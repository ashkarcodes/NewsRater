from django.db import models

# Create your models here.
class login(models.Model):
    login_id=models.AutoField(primary_key=True)
    username=models.CharField(max_length=225)
    password=models.CharField(max_length=225)
    usertype=models.CharField(max_length=225)
    
    
class newschanel(models.Model):
    nch_id=models.AutoField(primary_key=True)
    clogins=models.ForeignKey(login,on_delete=models.CASCADE)
    name=models.CharField(max_length=225)
    place=models.CharField(max_length=225)
    phone=models.CharField(max_length=225)
    email=models.CharField(max_length=225)
    
class user(models.Model):
    user_id=models.AutoField(primary_key=True)
    ulogins=models.ForeignKey(login,on_delete=models.CASCADE)
    fname=models.CharField(max_length=225)
    lname=models.CharField(max_length=225)
    place=models.CharField(max_length=225)
    phone=models.CharField(max_length=225)
    email=models.CharField(max_length=225)
    
class video(models.Model):
    video_id=models.AutoField(primary_key=True)
    users=models.ForeignKey(user,on_delete=models.CASCADE)
    title=models.CharField(max_length=225)
    video=models.CharField(max_length=225)
    amount=models.CharField(max_length=225)
    details=models.CharField(max_length=225)
    
    
class buy(models.Model):
    buy_id=models.AutoField(primary_key=True)
    nchs=models.ForeignKey(newschanel,on_delete=models.CASCADE)
    videos=models.ForeignKey(video,on_delete=models.CASCADE)
    date=models.CharField(max_length=225)
    status=models.CharField(max_length=225)
 
    
    
class payment(models.Model):
    payment_id=models.AutoField(primary_key=True)
    buys=models.ForeignKey(buy,on_delete=models.CASCADE)
    amount=models.CharField(max_length=225)
    date=models.CharField(max_length=225)
    
    
class rating(models.Model):
    rating_id=models.AutoField(primary_key=True)
    rbuys=models.ForeignKey(buy,on_delete=models.CASCADE)
    rated=models.CharField(max_length=225)
    date=models.CharField(max_length=225)
    
class comment(models.Model):
    comment_id=models.AutoField(primary_key=True)
    cusers=models.ForeignKey(user,on_delete=models.CASCADE)
    cbuys=models.ForeignKey(buy,on_delete=models.CASCADE)
    reply=models.CharField(max_length=225)
    date=models.CharField(max_length=225)
    
    
class commission(models.Model):
    comm_id=models.AutoField(primary_key=True)
    combuys=models.ForeignKey(buy,on_delete=models.CASCADE)
    amount=models.CharField(max_length=225)
  
    

 
    
class complaint(models.Model):
    comp_id=models.AutoField(primary_key=True)
    comusers=models.ForeignKey(user,on_delete=models.CASCADE)
    complaint=models.CharField(max_length=225)
    reply=models.CharField(max_length=225)
    date=models.CharField(max_length=225)
  
 
    
class history(models.Model):
    his_id=models.AutoField(primary_key=True)
    husers=models.ForeignKey(user,on_delete=models.CASCADE)
    hbuys=models.ForeignKey(buy,on_delete=models.CASCADE)
    count=models.CharField(max_length=225)
   
  
    

 
    