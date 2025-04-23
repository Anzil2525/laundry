from django.shortcuts import render
from django.http import HttpResponse
from django.db import connection
import datetime
from django.shortcuts import HttpResponseRedirect,redirect
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
    return render(request,'feedback.html')

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

    msg = "<script>alert('Added');window.location='/user/';</script>"
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
    sqlshop = "insert into shop(name,address,place,district,phn,email) values('%s','%s','%s','%s','%s','%s')"%(name,adr,plc,dis,ph,email)
    cur.execute(sqlshop)

    sqllast = "select max(shid) from shop"
    cur.execute(sqllast)
    result = cur.fetchall()
    for row in result:
        shid = int(row[0])
    sqllog = "insert into login(uid,uname,upass,utype) values('%s','%s','%s','%s')"%(shid,email,pas,'shop')
    cur.execute(sqllog)

    msg = "<script>alert('Added');window.locarion='/shop/';</script>"
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
    sqlstaff = "insert into staff(name,address,street,city,district,phn,pin,dob,email) values('%s','%s','%s','%s','%s','%s','%s','%s','%s')"%(name,address,street,city,district,phone,pin,dob,email) 
    cur.execute(sqlstaff)

    sqllast = "select max(stid) from staff;"
    cur.execute(sqllast)
    result = cur.fetchall()
    for row in result:
        stid = int(row[0])
    sqllog = "insert into login(uid,uname,upass,utype) values('%s','%s','%s','%s')"%(stid,email,pas,'staff')
    cur.execute(sqllog)

    msg = "<script>alert('Added');window.locarion='/staff/';</script>"
    return HttpResponse(msg)

def addservice(request):
    cur = connection.cursor()

    ser = request.GET['service']
    dis = request.GET['district']
    amount = request.GET['amount']

    sqlservice = "insert into service(service,district,amount) values('%s','%s','%s')"%(ser,dis,amount)
    cur.execute(sqlservice)

    msg = "<script>alert('service is entered');window.location='/service/';</script>"
    return HttpResponse(msg)

def addfeedback(request):
    cur= connection.cursor()
    fed=request.GET['feedback']

    sqlfed="insert into feedback(feedback) values('%s')"%(fed)
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
        }
        data.append(dis)
    return render(request,'viewshops.html',{'data':data})

def viewstaffs(request):
    cur = connection.cursor()
    sql = "select * from staff"
    cur.execute(sql)
    result = cur.fetchall()
    data = []
    for row in result:
        dis = {
            'shid' : row[0],
            'name' : row[1],
            'address' : row[2],
            'street' : row[3],
            'city' : row[4],
            'district' : row[5],
            'phn' : row[6],
            'pin' : row[7],
            'dob' : row[8],
            'email' : row[9],
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
    cur = connection.cursor()
    sql = "select * from feedback"
    cur.execute(sql)
    result = cur.fetchall()

    data = []
    for row in result:
        dis = {
            'fid' : row[0],
            'feedback' : row[1],
        }
        data.append(dis)
    return render(request,'viewfeedbacks.html',{'data':data})

        