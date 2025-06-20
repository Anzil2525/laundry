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
    path('userreg/',userreg,name="userreg"),
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
    path('login/',login,name='loign'),
    path('loginaction/',loginaction,name='loginaction'),
    path('shophome/',shophome,name='shophome'),
    path('userhome/',userhome,name='userhome'),
    path('adminhome/',adminhome,name='adminhome'),
    path('approve/',approve,name='approve'),
    path('reject/',reject,name='reject'),
    path('deleteshop/',deleteshop,name='deleteshop'),
    path('userprofile/',userprofile,name='userprofile'),
    path('shopprofile/',shopprofile,name='shopprofile'),
    path('edituser/',edituser,name='edituser'),
    path('editshop/',editshop,name='editshop'),
    path('staffhome/',staffhome,name='staffhome'),
    path('deletestaff/',deletestaff,name='deletestaff'),
    path('staffprofile/',staffprofile,name='staffprofile'),
    path('editstaff/',editstaff,name='editstaff'),
    path('shopservice/',shopservice,name='shopservice'),
    path('deleteservice/',deleteservice,name='deleteservice'),
    path('editservice/',editservice,name='editservice'),
    path('serviceeditingpage/',serviceeditingpage,name='serviceeditingpage'),
    path('userviewshops/',userviewshops,name='userviewshops'),
    path('userviewservices/',userviewservices,name='userviewservices'),
    path('showpassword/',showpassword,name='showpassword'),
    path('changepass/',changepass,name='changepass'),
    path('forgotpass/',forgotpass,name='forgotpass'),
    path('forgotpassaction/',forgotpassaction,name='forgotpassaction'),
    path('bookservice/',bookservice,name='bookservice'),
    path('showbookingsofuser/',showbookingsofuser,name='showbookingsofuser'),
    path('showbookingsofshop/',showbookingsofshop,name='showbookingsofshop'),
    path('viewbookdetailsbyshop/',viewbookdetailsbyshop,name='viewbookdetailsbyshop'),
]
