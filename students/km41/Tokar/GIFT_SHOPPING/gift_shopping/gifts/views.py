from django.shortcuts import render, redirect
from django.core.urlresolvers import reverse
from django.contrib.auth.decorators import login_required
from django.utils import timezone
from django.db import connection
from django.db import transaction

from .models import Gifts, Bucket, GiftItemOrder


def view_gifts(request, template_name='view_gifts.html'):
    
    books_gifts = Gifts.objects.filter(caregory='Books')
    flowers_gifts = Gifts.objects.filter(caregory='Flowers')
    other_gifts = Gifts.objects.filter(caregory='Other')

    return render(request, template_name, {'books_gifts': books_gifts,
        'flowers_gifts': flowers_gifts,
        'other_gifts': other_gifts})

@login_required(login_url='/login/')
def view_gift_details(request, pk):
    template_name='view_gift_details.html'
    gift = Gifts.objects.get(pk=pk)

    if request.method == 'GET':
        return render(request, template_name, {'gift': gift})

    elif request.method == 'POST':

        gift_quantity = request.POST.get('gift_quantity')

        gift.quantity -= int(gift_quantity)
        gift.save()

        bucket = Bucket.objects.get(user_id=request.user.id, is_ordered=False)

        giftitem = GiftItemOrder.objects.create(gift_id=pk, quantity=gift_quantity,
            bucket_id=bucket.id)

        return redirect(reverse('gifts:view_bucket_details', args=(bucket.id,)))


@login_required(login_url='/login/')
def view_buckets(request, template_name='view_buckets.html'):
    
    buckets = Bucket.objects.filter(user_id=request.user.id)

    if not buckets:
        Bucket.objects.create(user_id=request.user.id, name='My Gift Bucket')


    return render(request, template_name, {'buckets': buckets})


@login_required(login_url='/login/')
def view_bucket_details(request, pk):
    template_name='view_bucket_details.html'
    # bucket = Bucket.objects.get(pk=pk)
    bucket = Bucket.objects.raw('SELECT * FROM GIFTS_BUCKET WHERE ID = {}'.format(pk))[0]


    giftitemorder = GiftItemOrder.objects.filter(bucket_id=bucket.id)
    if request.method == 'GET':
        return render(request, template_name, {'bucket': bucket, 'giftitemorder': giftitemorder})

    if request.method == 'POST':
        new_bucket_name = request.POST.get('new_bucket_name')

        with transaction.atomic():
            cursor = connection.cursor()
            cursor.execute('SET TRANSACTION ISOLATION LEVEL SERIALIZABLE')


            bucket.is_ordered = True
            bucket.ordered_time = timezone.now()
            bucket.save()

            # If name `MyName` exist - replase to `MyName(1)` or `MyName(2)` ...
            i = 0
            while True:
                i += 1
                is_exist = Bucket.objects.filter(user_id=request.user.id, name=new_bucket_name)
                if not is_exist:
                    Bucket.objects.create(user_id=request.user.id, name=new_bucket_name)
                    break
                else:
                    new_bucket_name = new_bucket_name + '(' + str(i) + ')'

        return render(request, template_name, {'bucket': bucket, 'giftitemorder': giftitemorder})



