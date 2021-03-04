import os
from django.contrib.auth import authenticate, login, logout
from django.views import generic
from django.views.generic.base import View
from django.contrib.auth.models import Group
from django.urls import reverse_lazy
from django.shortcuts import render, redirect
from django.http import HttpResponseRedirect
from student.models import student
from teacher.models import faculty as teacher
# from .forms import GeneralForm
from student.models import student
from teacher.models import faculty


# Create your views here.
def home(request):
    return render(request, 'home.html', {})


def login_user(request):
    if request.method == "POST":
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)
        group = None
        if user is not None:
            if user.is_active:
                login(request, user)
                userr = Group.objects.filter(user=user)
                if group == 'faculty_group':
                    return render(request, 'teacher/facultyprofile.html', {'faculty': userr, user: user})
                if group == 'student_group':
                    return render(request, 'studentprofile.html', {'student': userr, user: user})

                else:
                    return render(request, 'home.html', {})
            else:
                return render(request, 'login.html', {'error_message': 'Your account has been disabled'})
        else:
            return render(request, 'login.html', {'error_message': 'Invalid login'})
    return render(request, 'login.html')


def logout_user(request):
    logout(request)
    return render(request, 'home.html', {})


def belongsto(request, user):
    group = request.user.groups.all()[0].name
    if group == 'faculty_group':
        return render(request, 'facultyprofile.html', {'faculty': request.user.faculty})
    if group == 'student_group':
        return render(request, 'studentprofile.html', {'student': request.user.student})

    else:
        return render(request, 'home.html', {})

