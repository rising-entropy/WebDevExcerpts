import os
from django.contrib.auth import authenticate, login, logout
from django.views import generic
from django.views.generic.base import View
from django.contrib.auth.models import Group
from django.urls import reverse_lazy
from django.shortcuts import render, redirect
from django.http import HttpResponseRedirect

def landingPage(request, template_name='landingPage.html'):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')

        user = authenticate(request, username=username, password=password)

        if user is not None:
            login(request, user)
            #Successful login
            return render(request, 'begin.html')

        else:
            #Failure
            args = {}
            args["errorMessage"] = "Invalid username or password. Please Try Again."
            return render(request, template_name, args)

    elif request.method == 'GET':
        return render(request, template_name)

comm = """ class landingPage(View):

    def get(self, request, template_name='landingPage.html'):
        return render(request, template_name)

    def post(self, request, template_name='landingPage.html'):
        username = request.POST.get('username')
        password = request.POST.get('password')

        user = authenticate(request, username=username, password=password)

        if user is not None:
            login(request, user)
            #Successful login
            return render(request, 'begin.html')

        else:
            #Failure
            args = 
            args["errorMessage"] = "Invalid username or password. Please Try Again."
            return render(request, template_name, args) """