"""laundry URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path,include
from laundryapp.views import *
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from django.views.generic import TemplateView
from django.conf import settings
from django.conf.urls.static import static


urlpatterns = [
    path('admin/', admin.site.urls),
    path('',index,name="index"),
    path('index/',index,name="index"),
    path('user/',user,name="user"),
    path('staff/',staff,name="staff"),
    path('shop/',shop,name="shop"),
    path('userreg',userreg,name="userreg"),
    path('shopreg/',shopreg,name="shopreg"),
    path('staffreg/',staffreg,name="staffreg"),
    path('service/',service,name="service"),
    path('addservice/',addservice,name="addservice"),
    path('feedback/',feedback,name="feedback"),
    path('addfeedback/',addfeedback,name="addfeedback"),
    path('viewusers/',viewusers,name="viewusers"),
    path('viewshops/',viewshops,name="viewshops"),
    path('viewstaffs/',viewstaffs,name="viewstaffs"),
    path('viewservices/',viewservices,name="viewservices"),
    path('viewfeedbacks/',viewfeedbacks,name="viewfeedbacks"),
    
]
