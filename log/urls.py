from django.conf.urls import url
from log import views

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^add$', views.create, name='add'),
    url(r'^signup$', views.signup, name='signup')
]