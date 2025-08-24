from django.shortcuts import render
from django.http import HttpResponse
from django.db import connection
import datetime
from django.shortcuts import HttpResponseRedirect,redirect
import random
today_date = datetime.date.today()
today = today_date.strftime("%y-%m-%d")

# Create your views here.

def index(request):
    return render(request,'index.html')

def user(request):
    return render(request,'user.html')

def shop(request):
    return render(request,'shop.html')

def staff(request):
    return render(request,'staff.html')

def feedback(request):
    try:
        if request.session['utype'] == 'user':
            temp = 'header_footer_user.html'
        elif request.session['utype'] == 'shop':
            temp = 'header_footer_shop.html'
        elif request.session['utype'] == 'staff':
            temp = 'header_footer_staff.html'
        else:
            temp = 'header_footer_index.html'
    except:
        temp = 'header_footer_index.html'
    return render(request,'feedback.html',{'temp' : temp})

def service(request):
    return render(request,'service.html')



def userreg(request):
    cur = connection.cursor()
    name = request.GET['u_name']
    adr = request.GET['u_address']
    dis = request.GET['u_district']
    ph = request.GET['u_ph_no']
    email = request.GET['u_email']
    plc = request.GET['u_place']
    pas = request.GET['u_password']
    sqluser = "insert into user(name,address,district,phn,email,place) values('%s','%s','%s','%s','%s','%s')"%(name,adr,dis,ph,email,plc)
    cur.execute(sqluser)

    sqllast = "select max(uid) from user"
    cur.execute(sqllast)
    result = cur.fetchall()
    for row in result:
        uid = int(row[0])
    sqllog = "insert into login(uid,uname,upass,utype) values('%s','%s','%s','%s')"%(uid,email,pas,'user')
    cur.execute(sqllog)

    msg = "<script>alert('Added');window.location='/userhome/';</script>"
    return HttpResponse(msg)

def shopreg(request):
    cur = connection.cursor()
    name = request.GET['shop_name']
    adr = request.GET['shop_address']
    plc = request.GET['shop_place']
    dis = request.GET['shop_district']
    ph = request.GET['shop_ph_no']
    email = request.GET['shop_email']
    pas = request.GET['shop_password']
    sqlshop = "insert into shop(name,address,place,district,phn,email,status) values('%s','%s','%s','%s','%s','%s','%s')"%(name,adr,plc,dis,ph,email,'pending')
    cur.execute(sqlshop)

    sqllast = "select max(shid) from shop"
    cur.execute(sqllast)
    result = cur.fetchall()
    for row in result:
        shid = int(row[0])
    sqllog = "insert into login(uid,uname,upass,utype,status) values('%s','%s','%s','%s','%s')"%(shid,email,pas,'shop','pending')
    cur.execute(sqllog)

    msg = "<script>alert('Added');window.location='/login/';</script>"
    return HttpResponse(msg)

def staffreg(request):
    cur = connection.cursor()
    name = request.GET['name']
    address = request.GET['address']
    street = request.GET['street']
    city = request.GET['city']
    district = request.GET['district']
    phone = request.GET['ph_no']
    pin = request.GET['pincode']
    dob = request.GET['dob']
    email = request.GET['email']
    pas = request.GET['password']

    shid = request.session['uid']

    sqlstaff = "insert into staff(shid,name,address,street,city,district,phn,pin,dob,email) values('%s','%s','%s','%s','%s','%s','%s','%s','%s','%s')"%(shid,name,address,street,city,district,phone,pin,dob,email) 
    cur.execute(sqlstaff)

    sqllast = "select max(stid) from staff;"
    cur.execute(sqllast)
    result = cur.fetchall()
    for row in result:
        stid = int(row[0])
    sqllog = "insert into login(uid,uname,upass,utype) values('%s','%s','%s','%s')"%(stid,email,pas,'staff')
    cur.execute(sqllog)

    msg = "<script>alert('staff is added');window.location='/shophome/';</script>"
    return HttpResponse(msg)

def addservice(request):
    cur = connection.cursor()

    ser = request.GET['sname']
    amt = request.GET['amount']
    desc = request.GET['desc']
    shid = request.session['uid']

    sql = "insert into service(sname,amt,descr,shid) values('%s','%s','%s','%s')"%(ser,amt,desc,shid)
    cur.execute(sql)

    msg = "<script>alert('service is entered');window.location='/shopservice/';</script>"
    return HttpResponse(msg)

def addfeedback(request):
    cur= connection.cursor()
    fed=request.GET['feedback']
    uid = request.session['uid']
    utype = request.session['utype']
    
    
    obj = datetime.datetime.now()
    time = str(obj.time())
    date = str(obj.date())

   
    sqlfed="insert into feedback(feedback,date,time,uid,utype) values('%s','%s','%s','%s','%s')"%(fed,date,time,uid,utype)
    cur.execute(sqlfed)

    msg = "<script>alert('feedback is entered');window.location='/feedback/';</script>"
    return HttpResponse(msg)


#view

def viewusers(request):
    cur = connection.cursor()
    sql = "select * from user"
    cur.execute(sql)
    result = cur.fetchall()
    data=[]
    for row in result:
        dis = {
            'uid' : row[0],
            'name' : row[1],
            'address' : row[2],
            'district' : row[3],
            'phn' : row[4],
            'email' : row[5],
            'place' : row[6],
        }
        data.append(dis)
    return render(request,'viewusers.html',{'data':data})

def viewshops(request):
    cur = connection.cursor()
    sql = "select * from shop"
    cur.execute(sql)
    result = cur.fetchall()
    data = []
    for row in result:
        dis = {
            'shid' : row[0],
            'name' : row[1],
            'address' : row[2],
            'place' : row[3],
            'district' : row[4],
            'phn' : row[5],
            'email' : row[6],
            'status' : row[7],
        }
        data.append(dis)
    return render(request,'viewshops.html',{'data':data})

def viewstaffs(request):
    cur = connection.cursor()
    shid = request.session['uid']
    sql = "select * from staff where shid = '%s'"%(shid)
    cur.execute(sql)
    result = cur.fetchall()
    data = []
    for row in result:
        dis = {
            'stid' : row[0],
            'shid' : row[1],
            'name' : row[2],
            'address' : row[3],
            'street' : row[4],
            'city' : row[5],
            'district' : row[6],
            'phn' : row[7],
            'pin' : row[8],
            'dob' : row[9],
            'email' : row[10],
        }
        data.append(dis)
    return render(request,'viewstaffs.html',{'data':data})

def viewservices(request):
    cur = connection.cursor()
    sql = "select * from service"
    cur.execute(sql)
    result = cur.fetchall()

    data = []
    for row in result:
        dis = {
            'srid' : row[0],
            'service' : row[1],
            'district' : row[2],
            'amount' : row[3],
        }
        data.append(dis)
    return render(request,'viewservices.html',{'data':data})

def viewfeedbacks(request):
    return render(request,'viewfeedbacks.html')

def viewfeedbacksofuser(request):
    cur = connection.cursor()
    sql = "select * from feedback inner join user on feedback.uid = user.uid " \
    "where utype = 'user' order by fid desc"    
    if request.POST:
        date = request.POST.get('date')
        uname = request.POST.get('uname')
        print(f"name = {uname}\ndate = {date}")
        if date:
            sql = "select * from feedback inner join user on feedback.uid = user.uid " \
            "where feedback.date = '%s' and utype = 'user' order by fid desc"%(date)    
    cur.execute(sql) 
    result = cur.fetchall()    
    data = []
    for row in result:
        dis = {
            'fid' : row[0],
            'feedback' : row[1],
            'date' : row[2],
            'time' : row[3],
            'uid' : row[4],
            'utype' : row[5],
            'uname' : row[7],
        }
        data.append(dis)
    return render(request,'viewfeedbacksofuser.html',{'data':data})

def viewfeedbacksofshop(request):
    cur = connection.cursor()
    sql = "select * from feedback inner join shop on feedback.uid = shop.shid " \
    "where utype = 'shop' order by fid desc"    
    if request.POST:
        date = request.POST.get('date')
        uname = request.POST.get('uname')
        print(f"name = {uname}\ndate = {date}")
        if date:
            sql = "select * from feedback inner join shop on feedback.uid = shop.shid " \
            "where feedback.date = '%s' utype = 'shop' order by fid desc"%(date)    
    cur.execute(sql) 
    result = cur.fetchall()    
    data = []
    for row in result:
        dis = {
            'fid' : row[0],
            'feedback' : row[1],
            'date' : row[2],
            'time' : row[3],
            'uid' : row[4],
            'utype' : row[5],
            'uname' : row[7],
        }
        data.append(dis)
    return render(request,'viewfeedbacksofshop.html',{'data':data})

def viewfeedbacksofstaff(request):
    cur = connection.cursor()
    sql = "select * from feedback inner join staff on feedback.uid = staff.stid " \
    "where utype = 'staff' order by fid desc"    
    if request.POST:
        date = request.POST.get('date')
        uname = request.POST.get('uname')
        print(f"name = {uname}\ndate = {date}")
        if date:
            sql = "select * from feedback inner join staff on feedback.uid = staff.stid " \
            "where feedback.date = '%s' and utype = 'staff' order by fid desc"%(date)    
    cur.execute(sql) 
    result = cur.fetchall()    
    data = []
    for row in result:
        dis = {
            'fid' : row[0],
            'feedback' : row[1],
            'date' : row[2],
            'time' : row[3],
            'uid' : row[4],
            'utype' : row[5],
            'uname' : row[8],
        }
        data.append(dis)
    return render(request,'viewfeedbacksofstaff.html',{'data':data})

def login(request):
    
    return render(request,'login.html')

def loginaction(request):
    cur = connection.cursor()
    email = request.GET['email']
    pas = request.GET['password']
    sql = "select * from login where uname = '%s' and upass = '%s'"%(email,pas)
    cur.execute(sql)
    print(sql)
    if(cur.rowcount)>0:
        result = cur.fetchall()
        for row in result:
            request.session['uid'] = row[1]
            request.session['utype'] = row[4]
            request.session['status'] = row[5]
            print(row[4])
            if(request.session['utype'] == 'admin'):
                msg ="<script>alert('welcome admin');window.location='/adminhome/';</script>"
                return HttpResponse(msg)
            elif(request.session['utype'] == 'user'):
                print("user")
                msg ="<script>alert('welcome user');window.location='/userhome/';</script>"
                return HttpResponse(msg)
            elif(request.session['utype'] == 'shop' and request.session['status'] == 'approved'):
                print("shop")
                msg = "<script>alert('welcome shop');window.location='/shophome/';</script>"
                return HttpResponse(msg)
            elif(request.session['utype'] == 'staff'):
                print("user")
                msg ="<script>alert('welcome staff');window.location='/staffhome/';</script>"
                return HttpResponse(msg)
            else:
                msg = "<script>alert('your request is pending');window.location='/login/';</script>"
                return HttpResponse(msg)
    else:
        msg = "<script>alert('login failed');window.location='/login/';</script>"
        return HttpResponse(msg)
    
def userhome(request):
    return render(request,'userhome.html')

def shophome(request):
    return render(request,'shophome.html')

def adminhome(request):
    return render(request,'adminhome.html')

def approve(request):
    cur = connection.cursor()
    id = request.GET['id']
    sql = "update shop set status = 'approved' where shid = '%s' "%(id)
    cur.execute(sql)
    sql1 = "update login set status = 'approved' where uid = '%s' and utype = 'shop'"%(id)
    cur.execute(sql1)
    msg = "<script>alert('approved');window.location='/viewshops/';</script>"
    return HttpResponse(msg)

def reject(request):
    cur = connection.cursor()
    id = request.GET['id']
    sql = "update shop set status = 'rejected' where shid = '%s'"%(id)
    cur.execute(sql)
    sql1 = "update login set status = 'rejected' where uid = '%s' and utype = 'shop'"%(id)
    cur.execute(sql1)
    msg = "<script>alert('rejected');window.location='/viewshops/';</script>"
    return HttpResponse(msg)

def deleteshop(request):
    cur = connection.cursor()
    id = request.GET['id']
    sql = "delete from shop where shid = '%s'"%(id)
    cur.execute(sql)
    sql1 = "delete from login where uid = '%s' and utype = 'shop'"%(id)
    cur.execute(sql1)
    msg = "<script>alert('deleted');window.location='/viewshops/';</script>"
    return HttpResponse(msg)

def userprofile(request):
    cur = connection.cursor()
    uid = request.session['uid']
    # sql = "select * from login where uid = '%s' and utype = 'user'"%(uid)
    # cur.execute(sql)
    # login_result = cur.fetchall()
    # for row in login_result:
    #         upass = row[3]
    sql = "select * from user where uid = '%s'"%(uid)
    cur.execute(sql)
    result = cur.fetchall()
    for row in result:
        dis = {
            'uid' : row[0],
            'name' : row[1],
            'address' : row[2],
            'district' : row[3],
            'phn' : row[4],
            'email' : row[5],
            'place' : row[6],
        }    
    return render(request,'userprofile.html',dis)

def shopprofile(request):
    cur = connection.cursor()
    shid = request.session['uid']
    sql = "select * from shop where shid = '%s'"%(shid)
    cur.execute(sql)
    result = cur.fetchall()
    for row in result:
        dis = {
            'shid' : row[0],
            'name' : row[1],
            'address' : row[2],
            'place' : row[3],
            'district' : row[4],
            'phn' : row[5],
            'email' : row[6],
            'status' : row[7],
        }
    return render(request,'shopprofile.html',dis)

def edituser(request):
    cur = connection.cursor()
    uid = request.session['uid']
    name = request.GET['name']
    addr = request.GET['address']
    dist = request.GET['district']
    pls = request.GET['place']
    phn = request.GET['phn']
    email = request.GET['email']
    sql = "update user set name = '%s', address = '%s', district = '%s', place = '%s', phn = '%s', email = '%s' where uid = '%s'"%(name,addr,dist,pls,phn,email,uid)
    cur.execute(sql)
    sql = "update login set uname = '%s' where uid = '%s' and utype = 'user'"%(email,uid)
    cur.execute(sql)

    msg = "<script>alert('updated');window.location='/userprofile/';</script>"
    return HttpResponse(msg)

def editshop(request):
    cur=connection.cursor()
    shid=request.session['uid']
    name=request.GET['name']
    addr=request.GET['address']
    plc=request.GET['place']
    dist=request.GET['district']
    ph=request.GET['phn']
    email=request.GET['email']
    sql = "update shop set name ='%s', address ='%s', place ='%s', district ='%s', phn ='%s', email ='%s' where shid ='%s'"%(name,addr,plc,dist,ph,email,shid)
    cur.execute(sql)
    sql ="update login set uname ='%s' where uid ='%s' and utype ='shop'"%(email,shid)
    cur.execute(sql)
    
    msg ="<script>alert('updated');window.location ='/shopprofile/';</script>"
    return HttpResponse(msg)

def staffhome(request):
    stid = request.session['uid']
    
    return render(request,'staffhome.html',{'stid':stid})

def deletestaff(request):
    print('in deletestaff')
    cur = connection.cursor()
    id = request.GET['id']
    print('id = ',id)
    sql = "delete from staff where stid = '%s'"%(id)
    cur.execute(sql)
    sql1 = "delete from login where uid = '%s' and utype = 'stid'"%(id)
    cur.execute(sql1)
    msg = "<script>alert('deleted');window.location='/viewstaffs/';</script>"
    return HttpResponse(msg)

def staffprofile(request):
    cur = connection.cursor()
    try:
        stid = request.GET['id']
    except:
        stid = request.session['uid']
    sql = "select * from staff where stid = '%s'"%(stid)
    cur.execute(sql)
    result = cur.fetchall()
    for row in result:
        dis = {
            'stid' : row[0],
            'shid' : row[1],
            'name' : row[2],
            'address' : row[3],
            'street' : row[4],
            'city' : row[5],
            'district' : row[6],
            'phn' : row[7],
            'pin' : row[8],
            'dob' : row[9],
            'email' : row[10],

            'utype' : request.session['utype']
        }
    if request.session['utype'] == 'shop':
        temp = 'header_footer_shop.html'
    elif request.session['utype'] == 'staff':
        temp = 'header_footer_staff.html'
    dis['temp'] = temp
    return render(request,'staffprofile.html',dis)

def editstaff(request):
    cur = connection.cursor()
    name = request.GET['name']
    address = request.GET['address']
    street = request.GET['street']
    city = request.GET['city']
    district = request.GET['district']
    phone = request.GET['ph_no']
    pin = request.GET['pincode']
    dob = request.GET['dob']
    email = request.GET['email']
    stid = request.GET['id']

    sql = "update staff set name = '%s',address = '%s',street = '%s', city = '%s', district = '%s', phn = '%s', pin = '%s', dob = '%s', email = '%s'  where stid='%s'"%(name,address,street,city,district,phone,pin,dob,email,stid)
    cur.execute(sql)
    sql = "update login set uname = '%s' where uid='%s' and utype = 'staff'"%(email,stid)
    cur.execute(sql)

    if request.session['utype'] == 'shop':
        msg = "<script>alert('staff profile edited');window.location='/viewstaffs/';</script>"
        return HttpResponse(msg)
    elif request.session['utype'] == 'staff':
        msg = "<script>alert('staff profile edited');window.location='/staffhome/';</script>"
        return HttpResponse(msg)
    else:
        msg = "<script>alert('unknow error');window.location='/staffhome/';</script>"
        return HttpResponse(msg)

def shopservice(request):
    cur = connection.cursor()
    shid = request.session['uid']
    sql = "select * from service where shid = '%s'"%(shid)
    cur.execute(sql)
    result = cur.fetchall()
    data = []
    for row in result:
        dis = {
            'srid' : row[0],
            'service' : row[1],
            'amount' : row[2],
            'descr' : row[3],
            'shid' : row[4],
        }
        data.append(dis)
    return render(request,'shopservice.html',{'data':data})

def deleteservice(request):
    cur = connection.cursor()
    id = request.GET['id']
    sql = "delete from service where srid = '%s'"%(id)
    cur.execute(sql)
    msg = "<script>alert('deleted');window.location='/shopservice/';</script>"
    return HttpResponse(msg)

def serviceeditingpage(request):
    cur = connection.cursor()
    id = request.GET['id']
    sql = "select * from service where srid = '%s'"%(id)
    cur.execute(sql)
    result = cur.fetchall()
    for row in result:
        dis = {
            'srid' : row[0],
            'service' : row[1],
            'amount' : row[2],
            'descr' : row[3],
            'shid' : row[4],
        }
    return render(request,'serviceeditingpage.html',dis) 


def editservice(request):
    cur = connection.cursor()
    id = request.GET['id']
    name = request.GET['sname']
    amt = request.GET['amount']
    desc = request.GET['desc']
    sql = "update service set sname = '%s', amt = '%s', descr = '%s' where srid = '%s'"%(name,amt,desc,id)
    cur.execute(sql)
    msg = "<script>alert('updated');window.location='/shopservice/';</script>"
    return HttpResponse(msg)

def userviewshops(request):
    cur = connection.cursor()
    sql = "select * from shop where status = 'approved'"
    cur.execute(sql)
    result = cur.fetchall()
    data = []
    for row in result:
        dis = {
            'shid' : row[0],
            'name' : row[1],
            'address' : row[2],
            'place' : row[3],
            'district' : row[4],
            'phn' : row[5],
            'email' : row[6],
            'status' : row[7],
        }
        data.append(dis)
    return render(request,'userviewshops.html',{'data':data})

def userviewservices(request):
    cur = connection.cursor()
    shid = request.GET['id']
    sql = "select * from shop where shid = '%s'"%(shid)
    cur.execute(sql)
    result = cur.fetchall()
    for row in result:
        shop = {
            'shid' : row[0],
            'name' : row[1],
            'address' : row[2],
            'place' : row[3],
            'district' : row[4],
            'phn' : row[5],
            'email' : row[6],
        }

    sql = "select * from service where shid = '%s'"%(shid)
    cur.execute(sql)
    result = cur.fetchall()
    data = []
    for row in result:
        dis = {
            'srid' : row[0],
            'service' : row[1],
            'amount' : row[2],
            'descr' : row[3],
            
        }
        data.append(dis)
    return render(request,'userviewservices.html',{'data':data,'shop':shop})

def showpassword(request):
    cur = connection.cursor()
    uid = request.session['uid']
    utype = request.session['utype']
    sql = "select * from login where uid = '%s' and utype = '%s'"%(uid,utype)
    cur.execute(sql)
    result = cur.fetchall()
    for row in result:
        dis = {
            'uname' : row[2],
            'prepass' : row[3],
            'utype' : row[4],
        }
    if request.session['utype'] == 'user':
        dis['temp'] = 'header_footer_user.html'
    elif request.session['utype'] == 'shop':
        dis['temp'] = 'header_footer_shop.html'
    elif request.session['utype'] == 'staff':
        dis['temp'] = 'header_footer_staff.html'
    
    return render(request,'password.html',dis)

def changepass(request):
    cur = connection.cursor()
    prepass = request.GET['prepass']
    newpass = request.GET['newpass']
    uid = request.session['uid']
    utype = request.session['utype']
    sql = "select * from login where uid = '%s' and utype = '%s'"%(uid,utype)
    cur.execute(sql)
    result = cur.fetchall()
    for row in result:
        if row[3] != prepass:
            msg = "<script>alert('previous password is incorrect');window.location='/showpassword/';</script>"
            return HttpResponse(msg)
    sql = "update login set upass = '%s' where uid='%s' and utype = '%s'"%(newpass,uid,utype)
    cur.execute(sql)
    msg = "<script>alert('password changed');window.location='/showpassword/';</script>"
    return HttpResponse(msg)

def forgotpass(request):
    try:
        if request.session['utype'] == 'user':
            temp = 'header_footer_user.html'
        elif request.session['utype'] == 'shop':
            temp = 'header_footer_shop.html'
        elif request.session['utype'] == 'staff':
            temp = 'header_footer_staff.html'
        else:
            temp = 'header_footer_index.html'
    except:
        temp = 'header_footer_index.html'
    return render(request,'forgotpassform.html',{'temp':temp})

def forgotpassaction(request):
    cur = connection.cursor()
    email = request.GET['email']
    phn = request.GET['phn']
    sql = "select * from login where uname = '%s'"%(email)
    cur.execute(sql)
    result = cur.fetchall()
    for row in result:
        utype = row[4]

    if utype == 'user':
        sql = "select * from login inner join user on user.uid = login.uid where login.uname= '%s' and user.phn = '%s'"%(email,phn)
    elif utype == 'shop':
        sql = "select * from login inner join shop on shop.shid = login.uid where login.uname= '%s' and shop.phn = '%s'"%(email,phn)
    elif utype == 'staff':
        sql = "select * from login inner join staff on staff.stid = login.uid where login.uname= '%s' and staff.phn = '%s'"%(email,phn)
    cur.execute(sql)
    if cur.rowcount == 0:
        msg = "<script>alert('invalid email or phone number');window.location='/forgotpass/';</script>"
        return HttpResponse(msg)
    result = cur.fetchall()
    for row in result:
        upass = row[3]
    msg = "<script>alert('your password is %s');window.location='/login/';</script>"%(upass)
    return HttpResponse(msg)

def bookservice(request):
    cur = connection.cursor()
    uid = request.session['uid']
    srid = request.GET['srid']
    
    obj = datetime.datetime.now()
    time = str(obj.time())
    date = str(obj.date())

    sql = "insert into booking(srid,uid,date,time,status) values('%s','%s','%s','%s','%s')"%(srid,uid,date,time,'booked')
    cur.execute(sql)

    sql = "select max(oid) from booking"
    cur.execute(sql)
    result = cur.fetchall()
    for row in result:
        oid = int(row[0])

    sql = "insert into tracker(oid,status,date,time) values('%s','%s','%s','%s')"%(oid,'booked',date,time)
    cur.execute(sql)

    msg = "<script>alert('service booked');window.location='/userviewshops/';</script>"
    return HttpResponse(msg)

def showbookingsofuser(request):
    cur = connection.cursor()
    uid = request.session['uid']
    sql = "select count(oid) from booking where uid = '%s'"%(uid)
    cur.execute(sql)
    for row in cur.fetchall():
        all_count = row[0]

    sql = "select count(oid) from booking where uid = '%s' and status in ('booked','assigned','progress')"%(uid)
    cur.execute(sql)
    for row in cur.fetchall():
        progress_count = row[0]
    
    sql = "select count(oid) from booking where uid = '%s' and status = 'completed'"%(uid)
    cur.execute(sql)
    for row in cur.fetchall():
        completed_count = row[0]
    
    sql = "select count(oid) from booking where uid = '%s' and status = 'rejected'"%(uid)
    cur.execute(sql)
    for row in cur.fetchall():
        rejected_count = row[0]
    
    count = {
        'all' : all_count,
        'progress' : progress_count,
        'completed' : completed_count,
        'rejected' : rejected_count,
    }
    try:
        if request.GET['filter'] == 'progress':
            fil = ('progress','booked','assigned',)
        elif request.GET['filter'] == 'completed':
            fil = ('completed','')
        elif request.GET['filter'] == 'rejected':
            fil = ('rejected','')
        else:
            sql = "select * from booking inner join service inner join shop " \
            "on service.srid=booking.srid and service.shid = shop.shid " \
            "where booking.uid = '%s' order by booking.oid desc"%(uid)
      
        sql = "select * from booking inner join service inner join shop " \
            "on service.srid=booking.srid and service.shid = shop.shid " \
            "where booking.uid = '%s'and booking.status in %s order by booking.oid desc"%(uid,fil)       
        print( ' not error')
        print(sql)
    except:
        print('error')
        sql = "select * from booking inner join service inner join shop " \
        "on service.srid=booking.srid and service.shid = shop.shid " \
        "where booking.uid = '%s' order by booking.oid desc"%(uid)
    cur.execute(sql)
    result = cur.fetchall()
    data = []
    for row in result:
        dis = {
            'oid' : row[0],
            'srid' : row[1],
            'uid' : row[2],
            'date' : row[3],
            'time' : row[4],
            'status' : row[5],
            'service' : row[7],
            'amount' : row[8],
            'shop' : row[12],
            
        }
        data.append(dis)
    return render(request,'showbookingsofuser.html',{'data':data,'count':count})

def showbookingsofshop(request):
    cur = connection.cursor()
    shid = request.session['uid']

    sql = "select count(oid) from booking inner join service " \
    "on service.srid = booking.srid where service.shid = '%s'"%(shid)
    cur.execute(sql)
    for row in cur.fetchall():
        all_count = row[0]

    sql = "select count(oid) from booking inner join service " \
    "on service.srid = booking.srid where service.shid = '%s'and booking.status = 'booked'"%(shid)
    cur.execute(sql)
    for row in cur.fetchall():
        booked_count = row[0]
    
    sql = "select count(oid) from booking inner join service " \
    "on service.srid = booking.srid where service.shid = '%s'and booking.status = 'completed'"%(shid)
    cur.execute(sql)
    for row in cur.fetchall():
        completed_count = row[0]
    
    sql = "select count(oid) from booking inner join service " \
    "on service.srid = booking.srid where service.shid = '%s'and booking.status = 'rejected'"%(shid)
    cur.execute(sql)
    for row in cur.fetchall():
        rejected_count = row[0]
    
    sql = "select count(oid) from booking inner join service " \
    "on service.srid = booking.srid where service.shid = '%s'and booking.status in ('progress','assigned')"%(shid)
    cur.execute(sql)
    for row in cur.fetchall():
        progress_count = row[0]

    sql = "select count(oid) from booking inner join service " \
    "on service.srid = booking.srid where service.shid = '%s'and booking.status = 'cancelled'"%(shid)
    cur.execute(sql)
    for row in cur.fetchall():
        cancelled_count = row[0]

    sql = "select count(oid) from booking inner join service " \
    "on service.srid = booking.srid where service.shid = '%s'" \
    "and booking.oid not in (select oid from transaction where shid = '%s')"%(shid,shid)
    cur.execute(sql)
    for row in cur.fetchall():
        unpaid_count = row[0]
    
    count = {
        'booked' : booked_count,
        'completed' : completed_count,
        'rejected' : rejected_count,
        'cancelled' : cancelled_count,
        'all' : all_count,
        'progress' : progress_count,
        'unpaid' : unpaid_count,

    }
    try:
        if request.GET['filter'] == 'progress':
            fil = ('progress','assigned')
        elif request.GET['filter'] == 'booked':
            fil = ('booked','')
        elif request.GET['filter'] == 'cancelled':
            fil = ('cancelled','')
        elif request.GET['filter'] == 'rejected':
            fil = ('rejected','')
        elif request.GET['filter'] == 'completed':
            fil = ('completed','')

        if request.GET['filter'] == 'unpaid':
            sql = "select * from service inner join booking inner join user " \
            "on service.srid = booking.srid and booking.uid = user.uid " \
            "where service.shid= '%s' and booking.oid not in (select oid from transaction where shid = '%s') " \
            "order by booking.oid desc"%(shid,shid)

        else:   
            sql = "select * from service inner join booking inner join user " \
            "on service.srid = booking.srid and booking.uid = user.uid " \
            "where service.shid= '%s' and booking.status in %s order by booking.oid desc"%(shid,fil)
    except:
        sql = "select * from service inner join booking inner join user " \
        "on service.srid = booking.srid and booking.uid = user.uid " \
        "where service.shid= '%s' order by booking.oid desc"%(shid)

    cur.execute(sql)
    result = cur.fetchall()
    data = []
    for row in result:
        dis = {
            'srid' : row[0],
            'service': row[1],
            'amount' : row[2],
            'descr' : row[3],
            'shid' : row[4],
            'oid' : row[5],
            'date': row[8],
            'time' : row[9],
            'uname': row[12],
            'address': row[13],
            'district': row[14],
            'phn' : row[15],
        }
        data.append(dis)
    return render(request,'showbookingsofshop.html',{'data':data,'count':count})

def viewbookdetailsbyshop(request):
    cur = connection.cursor()
    oid = request.GET['oid']
    shid = request.session['uid']

    sql = "select * from service inner join booking inner join user " \
    "on service.srid = booking.srid and booking.uid = user.uid " \
    "where booking.oid = '%s'"%(oid)
    cur.execute(sql)
    result = cur.fetchall()
    for row in result:
        dis = {
            'srid' : row[0],
            'service' : row[1],
            'amount' : row[2],
            # 'district' : row[3],
            'shid' : row[4],

            'oid' : row[5],
            # 'srid' : row[6],
            # 'uid' : row[7],
            'date' : row[8],
            'time' : row[9],
            'status' : row[10],

            'uid' : row[11],
            'name' : row[12],
            'address' : row[13],
            'district' : row[14],
            'phn' : row[15],
            'email' : row[16],
            'place' : row[17],
        }


    sql = "select * from  transaction where oid = '%s'"%(oid)
    cur.execute(sql)
    result = cur.fetchall()
    transaction = []
    for row in result:
        trans = {
            'date' : row[1],
            'time' : row[2],
            'amount' : row[4],
        }
        transaction.append(trans)

    sql = "select * from tracker where oid = '%s' order by tid asc"%(oid)
    cur.execute(sql)
    result = cur.fetchall()
    tracker_data = []
    for row in result:
        tracker = {
            'tid' : row[0],
            'oid' : row[1],
            'status' : row[2],
            'date' : row[3],
            'time' : row[4],
        }
        tracker_data.append(tracker)

    sql = "select * from staff where shid = '%s'"%(shid)
    cur.execute(sql)
    result = cur.fetchall()
    staffs = []
    for row in result:
        data = {
            'stid' : row[0],
            'name' : row[2]
        }
        staffs.append(data)
    
    sql = "select * from assign inner join staff on assign.stid = staff.stid where oid = '%s' order by assign.asnid"%(oid)
    cur.execute(sql)
    result = cur.fetchall()
    if cur.rowcount != 0:
        assign_data = []
        for row in result:
            assign = {
                'asnid' : row[0],
                'oid' : row[1],
                'stid' : row[2],
                'date' : row[3],
                'time' : row[4],
                'code' : row[5],
                'name' : row[8],
            }
            current_asnid = row[0]
            
            assign_data.append(assign)
        
        return render(request,'viewbookdetailsbyshop.html',{'dis':dis,'tracker':tracker_data,'staffs':staffs,'transaction' : transaction,'assign_data':assign_data, 'current_asnid':current_asnid})
    else:
        return render(request,'viewbookdetailsbyshop.html',{'dis':dis,'tracker':tracker_data,'staffs':staffs,'transaction' : transaction})

def assignstaff(request):
    cur = connection.cursor()
    oid = request.GET['oid']
    stid = request.GET['stid']
    code = random.randint(1000,9999)

    obj = datetime.datetime.now()
    time = str(obj.time())
    date = str(obj.date())

    sql = "select * from assign where oid = '%s'"%(oid)
    cur.execute(sql)
    for row in cur.fetchall():
        current_stid = row[2]
    if cur.rowcount != 0:
        if current_stid == stid:
           msg = "<script>alert('already assigned');window.location='/viewbookdetailsbyshop/?oid=%s';</script>"%(oid)
           return HttpResponse(msg)
    
    sql = "insert into assign(oid,stid,date,time,code) values('%s','%s','%s','%s','%s')"%(oid,stid,date,time,code)
    cur.execute(sql)

    sql = "select status from booking where oid = '%s'"%(oid)
    cur.execute(sql)
    result = cur.fetchall()
    for row in result:
        if row[0] == 'booked':
            sql = "update booking set status = 'assigned' where oid = '%s'"%(oid)
    cur.execute(sql)
    msg = "<script>alert('assigned');window.location='/viewbookdetailsbyshop/?oid=%s';</script>"%(oid)
    return HttpResponse(msg)
    
def showbookingsofstaff(request):
    cur = connection.cursor()
    stid = request.session['uid']

    sql = "select count(oid) from assign where stid = '%s' and asnid in (select max(asnid) from assign group by oid)"%(stid)
    cur.execute(sql)
    for row in cur.fetchall():
        all_count = row[0]
    
    sql = "select count(assign.oid) from assign inner join booking on assign.oid = booking.oid " \
    "where assign.stid = '%s' and assign.asnid in (select max(asnid) from assign group by oid) and booking.status in ('progress','assigned','booked')"%(stid)
    cur.execute(sql)
    for row in cur.fetchall():
        incompleted_count = row[0]
    
    sql = "select count(assign.oid) from assign inner join booking on assign.oid = booking.oid " \
    "where assign.stid = '%s' and assign.asnid in (select max(asnid) from assign group by oid) and booking.status in ('completed')"%(stid)
    cur.execute(sql)
    for row in cur.fetchall():
        completed_count = row[0]
    
    sql = "select count(assign.oid) from assign inner join booking on assign.oid = booking.oid " \
    "where assign.stid = '%s' and assign.asnid in (select max(asnid) from assign group by oid) and booking.status in ('cancelled')"%(stid)
    cur.execute(sql)
    for row in cur.fetchall():
        cancelled_count = row[0]

    count = {
        'completed' : completed_count,
        'cancelled' : cancelled_count,
        'all' : all_count,
        'incompleted' : incompleted_count,

    }

    try:
        if request.GET['filter'] == 'incompleted':
            fil = ('progress','assigned','booked')
        elif request.GET['filter'] == 'completed':
            fil = ('completed','')
        elif request.GET['filter'] == 'cancelled':
            fil = ('cancelled','')
        else:
            pass
        sql = "select * from assign inner join booking inner join service inner join user "\
        "on assign.oid = booking.oid and booking.srid = service.srid and booking.uid = user.uid "\
        "where assign.stid = '%s' and assign.asnid in (select max(asnid) from assign group by oid)  and booking.status in %s order by assign.asnid desc"%(stid,fil)

    except: 
        sql = "select * from assign inner join booking inner join service inner join user "\
        "on assign.oid = booking.oid and booking.srid = service.srid and booking.uid = user.uid "\
        "where assign.stid = '%s' and assign.asnid in (select max(asnid) from assign group by oid) order by assign.asnid desc"%(stid)

    cur.execute(sql)
    result = cur.fetchall()
    data = []
    for row in result:
        dis = {
            # 'asnid' : row[0],
            # 'oid' : row[1],
            # 'stid' : row[2],
            # 'date' : row[3],
            # 'time' : row[4],
            # 'code' : row[5],

            'oid' : row[6],
            # 'srid' : row[7],
            # 'uid' : row[8],
            'date' : row[9],
            'time' : row[10],
            # 'status' : row[11],

            # 'srid' : row[12],
            'service' : row[13],
            'amount' : row[14],
            'descr' : row[15],
            'shid' : row[16],

            # 'uid' : row[17],
            'name' : row[18],
            'address' : row[19],
            'district' : row[20],
            'phn' : row[21],
            'email' : row[22],
            'place' : row[23],
        }
        data.append(dis)
    return render(request,'showbookingsofstaff.html',{'data':data,'count':count})

def viewbookdetailsbystaff(request):
    cur = connection.cursor()
    stid = request.session['uid']
    oid = request.GET['oid']

    sql = "select * from tracker where oid = '%s'"%(oid)
    cur.execute(sql)
    result = cur.fetchall()
    tracker = []
    for row in result:
        dis = {
            'tid' : row[0],
            'oid' : row[1],
            'status' : row[2],
            'date' : row[3],
            'time' : row[4],
        }
        tracker.append(dis)
    
    sql = "select * from assign inner join booking inner join service inner join user "\
    "on assign.oid = booking.oid and booking.srid = service.srid and booking.uid = user.uid "\
    "where assign.oid = '%s' and assign.stid = '%s' and assign.asnid in (select max(asnid) from assign group by oid) order by booking.oid desc"%(oid,stid)
    cur.execute(sql)
    result = cur.fetchall()
    for row in result:
        dis = {
            # 'asnid' : row[0],
            # 'oid' : row[1],
            'stid' : row[2],
            'asn_date' : row[3],
            # 'asn_time' : row[4],
            'code' : row[5],

            'oid' : row[6],
            # 'srid' : row[7],
            # 'uid' : row[8],
            'odate' : row[9],
            'otime' : row[10],
            'status' : row[11],

            'srid' : row[12],
            'service' : row[13],
            'amount' : row[14],
            'descr' : row[15],
            'shid' : row[16],

            # 'uid' : row[17],
            'name' : row[18],
            'address' : row[19],
            'district' : row[20],
            'phn' : row[21],
            'email' : row[22],
            'place' : row[23],
        }

    sql = "select * from  transaction where oid = '%s'"%(oid)
    cur.execute(sql)
    result = cur.fetchall()
    transaction = []
    for row in result:
        trans = {
            'date' : row[1],
            'time' : row[2],
            'amount' : row[4],
        }
        transaction.append(trans)
    return render(request,'viewbookdetailsbystaff.html',{'data': dis ,'transaction':transaction,'tracker':tracker})

def updatetrackerbyoption(request):
    cur = connection.cursor()
    oid = request.GET['oid']
    status = request.GET['status']

    obj = datetime.datetime.now()
    time = str(obj.time())
    date = str(obj.date())

    sql= "update booking set status = 'progress' where oid = '%s'"%(oid)
    cur.execute(sql)
    
    sql = "insert into tracker (oid, status, date, time) values ('%s', '%s', '%s', '%s')"%(oid,status,date,time)
    cur.execute(sql)

    msg = "<script>alert('status updated');window.location='/viewbookdetailsbystaff/?oid=%s';</script>"%(oid)
    return HttpResponse(msg)

def updatetrackerbytyping(request):
    cur = connection.cursor()
    oid = request.GET['oid']
    status = request.GET['status']

    obj = datetime.datetime.now()
    time = str(obj.time())
    date = str(obj.date())

    sql= "update booking set status = 'progress' where oid = '%s'"%(oid)
    cur.execute(sql)

    sql = "insert into tracker (oid, status, date, time) values ('%s', '%s', '%s', '%s')"%(oid,status,date,time)
    cur.execute(sql)

    msg = "<script>alert('status updated');window.location='/viewbookdetailsbystaff/?oid=%s';</script>"%(oid)
    return HttpResponse(msg)

def viewbookdetailsbyuser(request):
    cur = connection.cursor()
    oid = request.GET['oid']

    sql = "select * from service inner join booking inner join shop " \
    "on service.srid = booking.srid and service.shid = shop.shid " \
    "where booking.oid = '%s'"%(oid)
    cur.execute(sql)
    result = cur.fetchall()
    for row in result:
        dis = {
            'srid' : row[0],
            'service' : row[1],
            'amount' : row[2],
            'description' : row[3],
            'shid' : row[4],

            'oid' : row[5],
            # 'srid' : row[6],
            # 'uid' : row[7],
            'date' : row[8],
            'time' : row[9],
            'status' : row[10],

            # 'shid' : row[11],
            'name' : row[12],
            'address' : row[13],
            'place' : row[14],
            'district' : row[15],
            'phn' : row[16],
            'email' : row[17],
        }
    
    sql = "select * from tracker where oid = '%s' order by tid asc"%(oid)
    cur.execute(sql)
    result = cur.fetchall()
    tracker_data = []
    for row in result:
        tracker = {
            'tid' : row[0],
            'oid' : row[1],
            'status' : row[2],
            'date' : row[3],
            'time' : row[4],
        }
        tracker_data.append(tracker)
    
    sql = "select max(code) from assign where oid = '%s'"%(oid)
    cur.execute(sql)
    result = cur.fetchall()
    for row in result:
        code = row[0]
    return render(request,'viewbookdetailsbyuser.html',{'dis':dis,'tracker':tracker_data,'code':code,})

def cancelbooking(request):
    cur = connection.cursor()
    oid = request.GET['oid']
    sql = "update booking set status = 'cancelled' where oid = '%s'"%(oid)
    cur.execute(sql)    
    msg = "<script>alert('booking is cancelled');window.location='/viewbookdetailsbyuser/?oid=%s/';</script>"%(oid)
    return HttpResponse(msg)

def rejectbooking(request):
    cur = connection.cursor()
    oid = request.GET['oid']
    sql = "update booking set status = 'rejected' where oid = '%s'"%(oid)
    cur.execute(sql)    
    msg = "<script>alert('booking is rejected');window.location='/viewbookdetailsbyshop/?oid=%s/';</script>"%(oid)
    return HttpResponse(msg)

def completebooking(request):
    cur = connection.cursor()
    oid = request.GET['oid']
    sql = "update booking set status = 'completed' where oid = '%s'"%(oid)
    cur.execute(sql)
    msg = "<script>alert('booking is completed');window.location='/viewbookdetailsbystaff/?oid=%s';</script>"%(oid)
    return HttpResponse(msg)
    
def viewservicedetails(request):
    cur = connection.cursor()
    srid = request.GET['srid']
    uid = request.session['uid']
    sql = "select * from cart where uid = '%s' and srid = '%s'"%(uid,srid)
    cur.execute(sql)
    if cur.rowcount > 0:
        cart = True
    else:
        cart = False
    sql = "select * from service inner join shop on service.shid = shop.shid where srid = '%s'"%(srid)
    cur.execute(sql)
    result = cur.fetchall()
    for row in result:
        dis = {
            'srid' : row[0],
            'service' : row[1],
            'amount' : row[2],
            'descr' : row[3],
            
            'shid' : row[5],
            'name' : row[6],
            'address' : row[7],
            'place' : row[8],
            'district' : row[9],
            'phn' : row[10],
            'email' : row[11],
        }
    return render(request,'viewservicedetails.html',{'dis':dis,'cart':cart})

def addtocart(request):
    cur = connection.cursor()
    uid = request.session['uid']
    srid = request.GET['srid']
    sql = "insert into cart(uid,srid) values('%s','%s')"%(uid,srid)
    cur.execute(sql)
    msg = "<script>window.location='/viewservicedetails/?srid=%s';</script>"%(srid)
    return HttpResponse(msg)

def removecart(request):
    cur = connection.cursor()
    uid = request.session['uid']
    srid = request.GET['srid']
    sql = "delete from cart where uid = '%s' and srid = '%s'"%(uid,srid)
    cur.execute(sql)
    msg = "<script>window.location='/viewservicedetails/?srid=%s';</script>"%(srid)
    return HttpResponse(msg)

def viewcart(request):
    cur = connection.cursor()
    uid = request.session['uid']
    sql = "select * from cart inner join service inner join shop "\
    "on cart.srid = service.srid and service.shid = shop.shid "\
    "where cart.uid = '%s'"%(uid)
    cur.execute(sql)
    result = cur.fetchall()
    data = []
    for row in result:
        dis = {
            'cid' : row[0],
            'uid' : row[1],
            # 'srid' : row[2],

            'srid' : row[3],
            'service' : row[4],
            'amount' : row[5],
            'descr' : row[6],
            # 'shid' : row[7],

            'shid' : row[8],
            'name' : row[9],
            'address' : row[10],
            'place' : row[11],
            'district' : row[12],
            'phn' : row[13],
            'email' : row[14],
        }
        data.append(dis)
    return render(request,'viewcart.html',{'data':data})
    
def addtransaction(request):
    cur = connection.cursor()
    if request.session['utype'] == 'staff':
        stid = request.session['uid']
        sql = "select shid from staff where stid = '%s'"%(stid)
        cur.execute(sql)
        result = cur.fetchall()
        for row in result:
            shid = row[0]
        print(f'shid = {shid}')
    elif request.session['utype'] == 'shop':
        shid = request.session['uid']

    obj = datetime.datetime.now()
    time = str(obj.time())
    date = str(obj.date())
    oid = request.GET['oid']
    amt = request.GET['amount']
    sql = "insert into transaction(date,time,oid,amount,shid) values('%s','%s','%s','%s','%s')"%(date,time,oid,amt,shid)
    print(f'sql = {sql}')
    cur.execute(sql)
    if request.session['utype'] == 'staff':
        msg = "<script>alert('transaction added');window.location='/viewbookdetailsbystaff/?oid=%s';</script>"%(oid)
    elif request.session['utype'] == 'shop':
        msg = "<script>alert('transaction added');window.location='/viewbookdetailsbyshop/?oid=%s';</script>"%(oid)
    
    return HttpResponse(msg)

def viewtransactionbyshopdaily(request):
    cur = connection.cursor()
    shid = request.session['uid']

    if request.method == "POST":
        date = request.POST.get('date')
    else:
        obj = datetime.datetime.now()
        time = str(obj.time())
        date = str(obj.date())
    sql = "select * from transaction where shid = '%s' and date = '%s'order by time desc"%(shid,date)
    cur.execute(sql)
    result = cur.fetchall()
    trans = []
    for row in result:
        dis = {
            'tid' : row[0],
            'date' : row[1],
            'time' : row[2],
            'oid' : row[3],
            'amount' : row[4],
            'shid' : row[5],
        }
        trans.append(dis)

    sql = "select sum(amount) from transaction where shid = '%s' and date = '%s'"%(shid,date)
    cur.execute(sql)
    for row in cur.fetchall():
        amount = row[0]
        if amount == None:
            amount = 0
    return render(request,'viewtransactionbyshopdaily.html',{'trans':trans,'date':date,'amount':amount})