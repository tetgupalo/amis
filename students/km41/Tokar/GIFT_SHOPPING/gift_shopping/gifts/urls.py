from django.conf.urls import url
from . import views

urlpatterns = [

	url(r'^view_gifts/$', views.view_gifts, name='view_gifts'),
	url(r'^view_gift_details/(?P<pk>\d+)/$', views.view_gift_details, name='view_gift_details'),

	url(r'^view_buckets/$', views.view_buckets, name='view_buckets'),
	url(r'^view_bucket_details/(?P<pk>\d+)/$', views.view_bucket_details, name='view_bucket_details'),

]
