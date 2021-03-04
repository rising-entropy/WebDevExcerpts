import os
from django.contrib.auth import authenticate, login, logout
from django.views import generic
from django.views.generic.base import View
from django.contrib.auth.models import Group
from django.contrib.auth.models import User
from django.urls import reverse_lazy
from django.shortcuts import render, redirect
from student.models import courses as Coursera
from student.models import webinars as Webi
from student.models import workshops as Work
from student.models import competitions as Compe
from student.models import teamMember as Memba
from student.models import paperpublications as Paper
from student.models import author as Author
from student.models import student as Student
from django.contrib.auth.hashers import make_password
from django.core.files.storage import FileSystemStorage
import shortuuid

# Create your views here.

class studentformView(View):
    
    def get(self, request, template_name='student/stureg.html'):
        return render(request, template_name)
    
    def post(self, request, template_name='student/stureg.html'):
        username=request.POST.get('username')
        first_name = request.POST.get('first_name')
        last_name = request.POST.get('last_name')
        PRN = request.POST.get('PRN')
        year = request.POST.get('year')
        dept = request.POST.get('dept')
        email = request.POST.get('email')
        password = request.POST.get('password')
        confPassword = request.POST.get('conf_password')

        if password != confPassword:
            err = {'error_message': "Passwords don't match. Please Try Again."}
            return render(request, 'student/stureg.html', err)

        try:
            user = User.objects.create_user(username, email, password, first_name=first_name,
                                                last_name=last_name, )
            user.save()
        except:
            err = {}
            err['error_message'] = "Account with this Username or Email already Exists."
            return render(request, template_name, err)

        try:
            studentData = Student(user=user, PRN = PRN, dept = dept, year = year)
            studentData.save()
        except:
            err = {}
            err['error_message'] = "Account with this PRN already Exists."
            return render(request, template_name, err)

        my_group = Group.objects.get(name='student_group')
        my_group.user_set.add(user)

        err = {}
        err['error_message'] = "Registration Successful. Please Login."
        return render(request, template_name, err)

########################################################################################################################

class courses(View):
    def get(self, request, template_name='student/courses.html'):
        try:
            user = request.user
            allCourses = Coursera.objects.filter(user=user)
            countCourses = len(allCourses)
        except:
            allCourses = None
            countCourses = 0
        args = {}
        args["allCourses"] = allCourses
        args["countCourses"] = countCourses
        return render(request, template_name, args)


class addCourse(View):
    def get(self, request, template_name='student/addCourse.html'):
        return render(request, template_name)

    def post(self, request, template_name='student/addCourse.html'):
        #username=request.POST.get('username')
        name = request.POST.get('name')
        domain = request.POST.get('domain')
        platform = request.POST.get('platform')
        startDate = request.POST.get('startDate')
        endDate = request.POST.get('endDate')
        user = request.user

        try:
            certification = request.FILES['certification']
            fs = FileSystemStorage()
            filename = fs.save(shortuuid.uuid(), certification)
            url = fs.url(filename)
            certification = url
            certBool = True
            publishCourse = Coursera(name=name, domain=domain, platform=platform, startDate=startDate, endDate=endDate, user=user, certification=certification, certBool=certBool)
            publishCourse.save()

        except:
            certification = "NA"
            certBool = False
            publishCourse = Coursera(name=name, domain=domain, platform=platform, startDate=startDate, endDate=endDate, user=user, certification=certification, certBool=certBool)
            publishCourse.save()

        err = {'error_message': "Course Added Successfully."}
        return render(request, template_name, err)



########################################################################################################################

class webinars(View):
    def get(self, request, template_name='student/webinars.html'):
        try:
            user = request.user
            allWebinars = Webi.objects.filter(user=user)
            countWebinars = len(allWebinars)
        except:
            allWebinars = None
            countWebinars = 0
        args = {}
        args["allWebinars"] = allWebinars
        args["countWebinars"] = countWebinars
        return render(request, template_name, args)


class addWebinar(View):
    def get(self, request, template_name='student/addWebinar.html'):
        return render(request, template_name)

    def post(self, request, template_name='student/addWebinar.html'):
        #username=request.POST.get('username')
        name = request.POST.get('name')
        organizer = request.POST.get('organizer')
        location = request.POST.get('location')
        if(request.POST.get('mode')=="Online"):
            mode = True
        else:
            mode = False
        startDate = request.POST.get('startDate')
        endDate = request.POST.get('endDate')
        user = request.user

        try:
            certification = request.FILES['certification']
            fs = FileSystemStorage()
            filename = fs.save(shortuuid.uuid(), certification)
            url = fs.url(filename)
            certification = url
            certBool = True
            publishWebinar = Webi(name=name, organizer=organizer, location=location, mode=mode, startDate=startDate, endDate=endDate, user=user, certification=certification, certBool=certBool)
            publishWebinar.save()

        except:
            certification = "NA"
            certBool = False
            publishWebinar = Webi(name=name, organizer=organizer, location=location, mode=mode, startDate=startDate, endDate=endDate, user=user, certification=certification, certBool=certBool)
            publishWebinar.save()

        err = {'error_message': "Webinar Added Successfully."}
        return render(request, template_name, err)

########################################################################################################################

class workshops(View):
    def get(self, request, template_name='student/workshops.html'):
        try:
            user = request.user
            allWorkshops = Work.objects.filter(user=user)
            countWorkshops = len(allWorkshops)
        except:
            allWorkshops = None
            countWorkshops = 0
        args = {}
        args["allWorkshops"] = allWorkshops
        args["countWorkshops"] = countWorkshops
        return render(request, template_name, args)

class addWorkshop(View):
    def get(self, request, template_name='student/addWorkshop.html'):
        return render(request, template_name)

    def post(self, request, template_name='student/addWorkshop.html'):
        #username=request.POST.get('username')
        name = request.POST.get('name')
        organizer = request.POST.get('organizer')
        location = request.POST.get('location')
        if(request.POST.get('mode')=="Online"):
            mode = True
        else:
            mode = False
        startDate = request.POST.get('startDate')
        endDate = request.POST.get('endDate')
        user = request.user

        try:
            certification = request.FILES['certification']
            fs = FileSystemStorage()
            filename = fs.save(shortuuid.uuid(), certification)
            url = fs.url(filename)
            certification = url
            certBool = True
            publishWorkshop = Work(name=name, organizer=organizer, location=location, mode=mode, startdate=startDate, enddate=endDate, user=user, certification=certification, certBool=certBool)
            publishWorkshop.save()

        except:
            certification = "NA"
            certBool = False
            publishWorkshop = Work(name=name, organizer=organizer, location=location, mode=mode, startdate=startDate, enddate=endDate, user=user, certification=certification, certBool=certBool)
            publishWorkshop.save()

        err = {'error_message': "Workshop Added Successfully."}
        return render(request, template_name, err)

########################################################################################################################

class competitions(View):
    def get(self, request, template_name='student/competitions.html'):
        try:
            user = request.user
            allCompetitions = Memba.objects.filter(user=user)
            countCompetitions = len(allCompetitions)
        except:
            allCompetitions = None
            countCompetitions = 0
        args = {}
        args["allCompetitions"] = allCompetitions
        args["countCompetitions"] = countCompetitions
        return render(request, template_name, args)


class addCompetition(View):
    def get(self, request, template_name='student/addCompetition.html'):
        return render(request, template_name)

    def post(self, request, template_name='student/addCompetition.html'):
        #username=request.POST.get('username')
        compname = request.POST.get('compname')
        organizer = request.POST.get('organizer')
        location = request.POST.get('location')
        if (request.POST.get('mode') == "Online"):
            mode = True
        else:
            mode = False
        projectTitle = request.POST.get('projectTitle')
        description = request.POST.get('description')
        startdate = request.POST.get('startdate')
        enddate = request.POST.get('enddate')
        winner = request.POST.get('winner')
        user = request.user
        if winner == "Winner":
            winner = True
        else:
            winner = False
        certification = request.POST.get('certification')

        #check if certification exists
        try:
            certification = request.FILES['certification']
            fs = FileSystemStorage()
            filename = fs.save(shortuuid.uuid(), certification)
            url = fs.url(filename)
            certification = url
            certBool = True
            publishCompetition = Compe(compname=compname, organizer=organizer, projectTitle=projectTitle, description=description, location=location, mode=mode, startdate=startdate, enddate=enddate, winner=winner, user=user, certification=certification, certBool=certBool)
            publishCompetition.save()

        except:
            certification = "NA"
            certBool = False
            publishCompetition = Compe(compname=compname, organizer=organizer, projectTitle=projectTitle, description=description, location=location, mode=mode, startdate=startdate, enddate=enddate, winner=winner, user=user, certification=certification, certBool=certBool)
            publishCompetition.save()


        #To Do: check if a similar Competition Already Exists.. Lets do this sometime later. It's Easy AF

        err = {'error_message': "Competition Added Successfully."}

        allMates = request.POST.get('allMates')
        allMates = allMates.rstrip()
        allMates = allMates.lstrip()
        allMates = allMates.split()

        #start adding all teammates with the associated competition
        currentCompetition = publishCompetition
        # add the adder
        adder = Memba(user=user, comps=currentCompetition)
        adder.save()
        # add other team-mates
        try:
            for mate in allMates:
                #get User Obj of mate: PNR
                mate = mate.upper()
                matePerson = Student.objects.filter(PRN=mate)
                matePerson = matePerson[0]
                matePerson = matePerson.user
                addMate = Memba(user=matePerson, comps=currentCompetition)
                addMate.save()
        
        except:
            err = {'error_message': "Entered PRNs of Team-Mates are Incorrect."}
        print(allMates)
        return render(request, template_name, err)

        
########################################################################################################################

class papers(View):
    def get(self, request, template_name='student/papers.html'):
        try:
            user = request.user
            allPapers = Author.objects.filter(user=user)
            countPapers = len(allPapers)
        except:
            allPapers = None
            countPapers = 0
        args = {}
        args["allPapers"] = allPapers
        args["countPapers"] = countPapers
        return render(request, template_name, args)

class addPaper(View):
    def get(self, request, template_name='student/addPaper.html'):
        return render(request, template_name)

    def post(self, request, template_name='student/addPaper.html'):
        # username=request.POST.get('username')
        user = request.user
        papertitle = request.POST.get('papertitle')
        if (request.POST.get('mode') == "Online"):
            mode = True
        else:
            mode = False
        confname = request.POST.get('confname')
        startdate = request.POST.get('startdate')
        enddate = request.POST.get('enddate')
        location = request.POST.get('location')
        if(request.POST.get('level') == "International"):
            level = True
        else:
            level = False
        if (request.POST.get('publicationPorR') == "Peered-reviewed"):
            publicationPorR = True
        else:
            publicationPorR = False
        publicationtype = request.POST.get('publicationtype')
        volumenumber = request.POST.get('volumenumber')
        issuenumber = request.POST.get('issuenumber')
        isbnissndoi = request.POST.get('isbnissndoi')
        pagefrom = request.POST.get('pagefrom')
        pageto = request.POST.get('pageto')
        month = request.POST.get('month')
        year = request.POST.get('year')
        paperurl = request.POST.get('paperurl')
        publishPaper = Paper(user=user, papertitle=papertitle, mode=mode, confname=confname, startdate=startdate, enddate=enddate, location=location,
                             level=level, publicationPorR=publicationPorR, publicationtype=publicationtype, volumenumber=volumenumber,
                             issuenumber=issuenumber, isbnissndoi=isbnissndoi, pagefrom=pagefrom, pageto=pageto, month=month, year=year, paperurl=paperurl)
        publishPaper.save()

        # To Do: check if a similar Paper Already Exists.. Lets do this sometime later. It's Easy AF

        err = {'error_message': "Paper Added Successfully."}

        allMates = request.POST.get('allMates')
        allMates = allMates.rstrip()
        allMates = allMates.lstrip()
        allMates = allMates.split()

        # start adding all teammates with the associated competition
        currentPaper = publishPaper
        # add the adder
        adder = Author(user=user, papers=currentPaper)
        adder.save()
        # add other team-mates
        try:
            for mate in allMates:
                # get User Obj of mate: PNR
                mate = mate.upper()
                matePerson = Student.objects.filter(PRN=mate)
                matePerson = matePerson[0]
                matePerson = matePerson.user
                addMate = Author(user=matePerson, papers=currentPaper)
                addMate.save()

        except:
            err = {'error_message': "Entered PRNs of Co-Authors are Incorrect."}
        print(allMates)
        return render(request, template_name, err)
