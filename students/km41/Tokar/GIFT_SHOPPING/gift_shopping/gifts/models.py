from django.db import models
from django.conf import settings
from django.contrib.auth.models import User

GIFT_CATEGORY = (('Books', 'Books'), ('Flowers', 'Flowers'), ('Other', 'Other'))


class Gifts(models.Model):

    name = models.CharField(max_length=20, blank=False)
    description = models.CharField(max_length=255, blank=True, null=True)
    quantity = models.PositiveIntegerField(null=True, blank=True, default=0)
    price = models.PositiveIntegerField(null=True, blank=True, default=0)
    picture = models.ImageField(upload_to='gifts/', blank=True, 
        default='gift.jpg')
    caregory = models.CharField(max_length=7, choices=GIFT_CATEGORY, default='One',)

    def __str__(self):
        return self.name


class Bucket(models.Model):
    user = models.ForeignKey(User, null=True)

    name = models.CharField(max_length=255, null=True)
    is_ordered = models.BooleanField(default=False)
    created_time = models.DateTimeField(auto_now_add=True, null=True)
    ordered_time = models.DateTimeField(blank=True, null=True)

    def __str__(self):
        return self.name

    class Meta:
        unique_together = (("user", "name"),)



class GiftItemOrder(models.Model):
    gift = models.ForeignKey(Gifts, null=True)
    bucket = models.ForeignKey(Bucket, null=True)

    quantity = models.PositiveIntegerField(null=True, blank=True, default=0)
    add_to_bucket_time = models.DateTimeField(auto_now_add=True, null=True)

