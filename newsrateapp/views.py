from django.shortcuts import render
from django.shortcuts import render,redirect
from django.http import HttpResponse, HttpResponseRedirect
from newsrateapp.models import *
from datetime import date, datetime


# Create your views here.

def index(request):

   return render(request,'index.html')


def login_page(request):
    if request.method=='POST':
        uname=request.POST['uname']
        password=request.POST['pass']
        print(uname,password)
        try:
            
            lg=login.objects.get(username=uname,password=password)
            print(lg)
            request.session['login_id']=lg.pk
            print(lg.usertype)
            if lg.usertype == 'admin':
                return HttpResponse("<script>alert('Login Success');window.location='/adminhome'</script>")
            
            elif lg.usertype == 'user':
                
                us=user.objects.get(ulogins=request.session['login_id'])
                     
                request.session['user_id']=us.pk
                
                return HttpResponse("<script>alert('Login Success');window.location='/userhome'</script>")
            
            
            elif lg.usertype == 'newschannel':
                
                res=newschanel.objects.get(clogins=request.session['login_id'])
                     
                request.session['nch_id']=res.pk
                
                return HttpResponse("<script>alert('Login Success');window.location='/news_home'</script>")
            
            

        except:
            return HttpResponse("<script>alert('Invalid Username Or Password');window.location='/login_page'</script>")
        
    return render(request,'login.html')



def userregister(request):
    
    if request.method=='POST':
        fname=request.POST['fname']
        lname=request.POST['lname']
     
        place=request.POST['place']
   
        phone=request.POST['phone']
     
        email=request.POST['email'] 
        uname=request.POST['uname'] 
        passs=request.POST['pass']
        
        
        q=user.objects.filter(email=email)
        f=login.objects.filter(username=uname)
        if q:
            return HttpResponse("<script>alert(' Email Already Exist....!!!');window.location='userregister';</script>")
        elif f:
            return HttpResponse("<script>alert(' Username Already Exist....!!!');window.location='userregister';</script>")            
        else:
            lg=login(username=uname,password=passs,usertype='user')
            lg.save()
        
            user_reg=user(fname=fname,lname=lname,place=place,phone=phone,email=email,ulogins_id=lg.pk)
            user_reg.save()

            return HttpResponse("<script>alert('register Successfull Please login');window.location='/login_page'</script>")

    return render(request,'userregister.html')



def channelregister(request):
    if request.method=='POST':
        fname=request.POST['fname']
        
     
        place=request.POST['place']
   
        phone=request.POST['phone']
     
        email=request.POST['email'] 
        uname=request.POST['uname'] 
        passs=request.POST['pass']
        
        em=newschanel.objects.filter(email=email)
        f=login.objects.filter(username=uname)

        if em:
            return HttpResponse("<script>alert('Email already existed');window.location='/login_page'</script>")
        elif f:
            return HttpResponse("<script>alert('Username already existed');window.location='/login_page'</script>")
        else:

            
        
            lg=login(username=uname,password=passs,usertype='pending')
            lg.save()
            
            user_reg1=newschanel(name=fname,place=place,phone=phone,email=email,clogins=lg)
            user_reg1.save()
            return HttpResponse("<script>alert('register Successfull Please login');window.location='/login_page'</script>")


    return render(request,'newsregister.html')

def admin_home(request):

   return render(request,'adminhome.html')





def viewnch(request):
    view_sal= newschanel.objects.all()
    
    
    return render(request,'admin_view_newschannel.html',{'view':view_sal})
    

    
def acptnch(request, clogins_id):
    accptsal = login.objects.get(login_id=clogins_id)
    accptsal.usertype='newschannel'
    accptsal.save()
    return HttpResponse("<script>alert('Successfully Updated');window.location='/viewnch'</script>")


def rejtnch(request, clogins_id):
    rejctsal = login.objects.get(login_id=clogins_id)
    rejctsal.usertype='Blocked'
    rejctsal.save()
    return HttpResponse("<script>alert('Successfully Updated');window.location='/viewnch'</script>")


def viewuser(request):
    view_sal= user.objects.all() 
    return render(request,'admin_view_user.html',{'view':view_sal})


def user_block(request,clogins_id):
    q=login.objects.get(login_id=clogins_id)
    q.usertype='Blocked'
    q.save()
    return HttpResponse("<script>alert('Successfully Updated');window.location='/viewuser'</script>")

def user_unblock(request,clogins_id):
    q=login.objects.get(login_id=clogins_id)
    q.usertype='user'
    q.save()
    return HttpResponse("<script>alert('Successfully Updated');window.location='/viewuser'</script>")

def viewbuyedvideos(request):
    view_sal= buy.objects.all()
    
    
    return render(request,'admin_view_buyed_videos.html',{'view':view_sal})
    

def viewpayment(request,buy_id):
    view_sal= payment.objects.filter(buys_id=buy_id)
    
    
    return render(request,'admin_view_payments.html',{'view':view_sal})
    

def viewcom(request,buy_id):
    view_sal= commission.objects.filter(combuys_id=buy_id)
    
    
    return render(request,'admin_view_commission.html',{'view':view_sal})
    

    

def viewvideos(request):
    view_sal= video.objects.all()
    
    
    return render(request,'admin_view_videos.html',{'view':view_sal})
    
    
    
    

def viewbuychannel(request,video_id):
    view_sal= buy.objects.filter(videos_id=video_id)
    
    print(view_sal)
    
    return render(request,'admin_view_channels.html',{'view':view_sal})
    

def viewcomments(request,buy_id):
    view_sal= comment.objects.filter(cbuys_id=buy_id)
    
    print(view_sal)
    
    return render(request,'admin_view_comments.html',{'view':view_sal})
    
def viewratings(request,buy_id):
    view_sal= rating.objects.filter(rbuys_id=buy_id)
    
    print(view_sal)
    
    return render(request,'admin_view_rating.html',{'view':view_sal})
    
def viewcomplaints(request):
    view_sal= complaint.objects.all
    
    
    
    return render(request,'admin_view_complaints.html',{'view':view_sal})
    
def sendreply(request,comp_id):
    view_sal= complaint.objects.get(comp_id=comp_id)
    
    if request.method=='POST':
    
        reply=request.POST['reply']
        
        view_sal.reply=reply
        view_sal.save()
        
        return HttpResponse("<script>alert('Successfully Updated');window.location='/viewcomplaints'</script>")
    
    return render(request,'admin_view_complaints.html',{'viewes':view_sal})
    
    
    
    
##################################################### admin section #####################################################################



def news_home(request):
    
    print("###########################################")

    return render(request,'newshome.html')


   

# def newsviewvideos(request):
#     view_sal= video.objects.filter(user.login_id__login__usertype=='block')
#     return render(request,'news_view_videos.html',{'view':view_sal})
    


def newsviewvideos(request):
    view_sal = video.objects.filter(users__ulogins__usertype='user')
    print(view_sal)
    return render(request, 'news_view_videos.html', {'view': view_sal})
 
   

def buyvideo(request,video_id,amt):
    cdate=date.today()
    view_sal= video.objects.get(video_id=video_id)
    
    try:
        view_buy= buy.objects.get(videos_id=video_id,nchs_id=request.session['nch_id'])
    
        if view_buy:
        
            return HttpResponse("<script>alert('You Havee already purchased this video');window.location='/newsviewvideos'</script>")
    except:
    
        if request.method == 'POST':
        
            buys=buy(date=datetime.now(),status='paid',nchs_id=request.session['nch_id'],videos_id=video_id)
            buys.save()
            
            p=payment(amount=amt,date=cdate,buys_id=buys.pk)
            p.save()
        
            return HttpResponse("<script>alert('Payment Successfull');window.location='/newsviewvideos'</script>")
    
    
    return render(request,'news_buy_video.html',{'view':view_sal})
    
    
    

def newsbuyedvideos(request):
    print(request.session['nch_id'])
    view_sal= buy.objects.filter(nchs_id=request.session['nch_id'])
    
    
    return render(request,'news_view_buy_videos.html',{'view':view_sal})




def newsviewcomments(request,video_id):
    view_all= buy.objects.filter(videos_id=video_id)
    buy_id=view_all[0].buy_id
    view_sal= comment.objects.filter(cbuys_id=buy_id)
    
    print(view_sal)
    
    return render(request,'news_view_comments.html',{'view':view_sal})
    
def newsviewratings(request,video_id):
    view_all= buy.objects.filter(videos_id=video_id)
    buy_id=view_all[0].buy_id
    view_sal= rating.objects.filter(rbuys_id=buy_id)
    
    print(view_sal)
    
    return render(request,'news_view_rating.html',{'view':view_sal})




def newssendcomplaints(request):
    
    uid=newschanel.objects.get(nch_id=request.session['nch_id'])
    nlogin=uid.clogins_id
    view_sal= complaint.objects.filter(comusers_id=nlogin)
    
    
    if request.method == 'POST':
        comp=request.POST['comp']
        com=complaint(complaint=comp,reply='pending',date=datetime.now(),comusers_id=nlogin)
        com.save()
        
        
        return HttpResponse("<script>alert('complaint Registered sucessfully ');window.location='/newssendcomplaints'</script>")
    
    return render(request,'news_send_complaints.html',{'view':view_sal})



######################################################################## newschanel section end ###########################################################



def userhome(request):

   return render(request,'userhome.html')


# def upvideo(request):
    
#     if request.method == 'POST':
#         title=request.POST['title']
#         =request.POST['title']

#     return render(request,'user_upload_videos.html')



def userviewbuyedvideos(request):
    view_sal= buy.objects.filter(videos_id__users_id=request.session['user_id'])
    
    
    return render(request,'user_view_buy_videos.html',{'view':view_sal})
    


def userviewpayment(request,buy_id):
    view_sal= payment.objects.filter(buys_id=buy_id)
    
    
    return render(request,'userviewpayment.html',{'view':view_sal})
    
    

def userviewvideos(request):
    view_sal = video.objects.filter(users__ulogins__usertype='user')    
    
    return render(request,'user_view_all_videos.html',{'view':view_sal})
    
    
    
def userviewbuychannel(request,video_id):
    view_sal= buy.objects.filter(videos_id=video_id)
    
    print(view_sal)
    
    return render(request,'user_view_channel.html',{'view':view_sal})
    
    
    
def addcomments(request,buy_id):
    view_sal= comment.objects.filter(cbuys_id=buy_id)
    
    print(view_sal)
    
    if request.method == 'POST':
        com=request.POST['com']
        
        asl=comment(reply=com,date=datetime.now(),cbuys_id=buy_id,cusers_id=request.session['user_id'])
        asl.save()
        
        response_content = f"<script>alert('Successfully Deleted'); window.location='/addcomments/{buy_id}'</script>"
        return HttpResponse(response_content)
    
    return render(request,'user_add_comments.html',{'view':view_sal})
    
    
    
def addratings(request,buy_id):
    view_sal= rating.objects.filter(rbuys_id=buy_id)
    print(view_sal)
    
    if request.method == 'POST':
        com=request.POST['com']
        
        asl=rating(rated=com,date=datetime.now(),rbuys_id=buy_id)
        asl.save()
        
        response_content = f"<script>alert('Successfully Deleted'); window.location='/addratings/{buy_id}'</script>"
        return HttpResponse(response_content)
    
    return render(request,'user_add_rating.html',{'view':view_sal})
    
    


def usersendcomplaints(request):
    
    uid=user.objects.get(user_id=request.session['user_id'])
    nlogin=uid.ulogins_id
    view_sal= complaint.objects.filter(comusers_id=nlogin)
    
    
    if request.method == 'POST':
        comp=request.POST['comp']
        com=complaint(complaint=comp,reply='pending',date=datetime.now(),comusers_id=nlogin)
        com.save()
        
        
        return HttpResponse("<script>alert('complaint Registered sucessfully ');window.location='/newssendcomplaints'</script>")
    
    return render(request,'user_send_comlpaints.html',{'view':view_sal})



def useruploadvideo(request):
    from django.core.files.storage import FileSystemStorage
    q=video.objects.all()
    if request.method=='POST':
        title=request.POST['title']
        amount=request.POST['amount']
        details=request.POST['det']
        uploaded_video=request.FILES['upload']
        fs = FileSystemStorage()
        f_nam = fs.save(uploaded_video.name, uploaded_video)
        # pu_ty=request.POST['type']
        up_myworks=video(title=title,video=f_nam,details=details,amount=amount,users_id=request.session['user_id'])
        up_myworks.save()
        
    
        return HttpResponse("<script>alert('successfully Added');window.location='/userviewbuyedvideos'</script>")
   
    return render(request,'user_upload_videos.html',{'view':q})



def userviewmyedvideos(request):
    view_sal= video.objects.filter(users_id=request.session['user_id'])
    
    
    return render(request,'user_view_my_videos.html',{'view':view_sal})
    
