"""NewsRate URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
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
from django.urls import path
from.import views

urlpatterns = [
    path('', views.index,name='index'),
    path('login_page',views.login_page,name='login_Page'),
    path('adminhome',views.admin_home,name='adminhome'),
    path('userregister',views.userregister,name='userregister'),
    path('channelregister',views.channelregister,name='channelregister'),
    
    
    
    
    
    path('viewnch',views.viewnch,name='viewnch'),
    path('acptnch/<clogins_id>',views.acptnch,name='acptnch'),
    path('rejtnch/<clogins_id>',views.rejtnch,name='rejtnch'),
    path('viewuser',views.viewuser,name='viewuser'),
    path('viewbuyedvideos',views.viewbuyedvideos,name='viewbuyedvideos'),
    path('viewpayment/<buy_id>',views.viewpayment,name='viewpayment'),
    path('viewcom/<buy_id>',views.viewcom,name='viewcom'),
    path('viewvideos',views.viewvideos,name='viewvideos'),
    path('viewbuychannel/<video_id>',views.viewbuychannel,name='viewbuychannel'),
    path('viewcomments/<buy_id>',views.viewcomments,name='viewcomments'),
    path('viewratings/<buy_id>',views.viewratings,name='viewratings'),
    path('sendreply/<comp_id>',views.sendreply,name='sendreply'),
    path('viewcomplaints',views.viewcomplaints,name='viewcomplaints'),
    path('user_block/<clogins_id>',views.user_block),
    path('user_unblock/<clogins_id>',views.user_unblock),
    
    
    
    
    
    path('news_home',views.news_home,name='news_home'),
    path('newsviewvideos',views.newsviewvideos,name='newsviewvideos'),
    path('buyvideo/<video_id>/<amt>',views.buyvideo,name='buyvideo'),
    path('newsbuyedvideos',views.newsbuyedvideos,name='newsbuyedvideos'),
    path('newsviewcomments/<video_id>',views.newsviewcomments,name='newsviewcomments'),
    path('newsviewratings/<video_id>',views.newsviewratings,name='newsviewratings'),
    path('newssendcomplaints',views.newssendcomplaints,name='newssendcomplaints'),
    
    
    
    
    
    path('userhome',views.userhome,name='userhome'),
    path('userviewbuyedvideos',views.userviewbuyedvideos,name='userviewbuyedvideos'),
    path('userviewpayment/<buy_id>',views.userviewpayment,name='userviewpayment'),
    path('userviewvideos',views.userviewvideos,name='userviewvideos'),
    path('userviewbuychannel/<video_id>',views.userviewbuychannel,name='userviewbuychannel'),
    path('addcomments/<buy_id>',views.addcomments,name='addcomments'),
    path('addratings/<buy_id>',views.addratings,name='addratings'),
    path('usersendcomplaints',views.usersendcomplaints,name='usersendcomplaints'),
    path('useruploadvideo',views.useruploadvideo,name='useruploadvideo'),
    path('userviewmyedvideos',views.userviewmyedvideos,name='userviewmyedvideos'),
    
    
]
