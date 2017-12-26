from django.contrib import admin

from .models import Gifts, Bucket, GiftItemOrder


admin.site.register(Gifts)
admin.site.register(GiftItemOrder)
admin.site.register(Bucket)
