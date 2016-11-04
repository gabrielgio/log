from django.conf.urls import url
from log import views
from django.contrib.auth.views import login as django_login
from django.contrib.auth.views import logout_then_login as django_logout

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^add$', views.create, name='add'),
    url(r'^signup/$', views.signup, name='signup'),
    url(r'^signin/$', django_login, {'template_name': "signin.html"}, name='signin'),
    url(r'^signout/$', django_logout, {'login_url': '/signin/'}, name='signout')
]