import os
from django.contrib.auth import authenticate, login, logout
from django.views import generic
from django.views.generic.base import View
from django.contrib.auth.models import Group
from django.urls import reverse_lazy
from django.shortcuts import render, redirect
from django.http import HttpResponseRedirect
from mystery.models import participant as Participant
from django.http import HttpResponse, HttpResponseNotFound, Http404,  HttpResponseRedirect

def begin(request, template_name='begin.html'):
    if request.method == 'POST':
        request.method = 'GET'
        #Make the Participant Instance if not done already
        user = request.user
        #Search for the Participant
        if Participant.objects.filter(user = user).exists():
            return HttpResponseRedirect("/mystery/Question1")
        else:
            addnew = Participant(user = user)
            addnew.save()
            return HttpResponseRedirect("/mystery/Question1")
    elif request.method == 'GET':
        return render(request, template_name)

def Question1(request, template_name='Q1.html'):

    if request.POST.get('previous'):
        request.method = 'GET'
        return begin(request, template_name='begin.html')
    
    elif request.POST.get('hint'):
        user = request.user
        Participant.objects.filter(user = user).update(showHint1 = True)
        request.method = 'GET'
        return HttpResponseRedirect("/mystery/Question1")

    elif request.POST.get('sub'):
        #check Answer
        latitude =  request.POST.get('latitude')
        longitude = request.POST.get('longitude')
        latitude = latitude.lstrip()
        latitude = latitude.rstrip()
        if latitude == '51.44' and longitude == '0.067':
            #correct
            user = request.user
            Participant.objects.filter(user = user).update(solvedAnswer1 = True)
            request.method = 'GET'
            return HttpResponseRedirect("/mystery/Question2")
        else:
            print("Somethings wrong, I can feel it")
            request.method = 'GET'
            return HttpResponseRedirect("/mystery/Question1")
            #Trying to figure out how to pass the args there

    elif request.POST.get('answer'):
        user = request.user
        Participant.objects.filter(user = user).update(showAnswer1 = True)
        request.method = 'GET'
        return HttpResponseRedirect("/mystery/Question1")

    elif request.method == 'GET':
        user = request.user
        guy = Participant.objects.filter(user=user)
        guy = guy[0]
        args = {}
        if guy.showAnswer1 == True or guy.solvedAnswer1 == True:
            args["ans1"] = "51.44"
            args["ans2"] = "0.067"
        if guy.showHint1 == True:
            args["hin"] = "Know the dialect and answer will be known to you."
        return render(request, template_name, args)


def Question2(request, template_name='Q2.html'):

    if request.POST.get('previous'):
        request.method = 'GET'
        return HttpResponseRedirect("/mystery/Question1")
    
    if request.POST.get('hint'):
        user = request.user
        Participant.objects.filter(user = user).update(showHint2 = True)
        request.method = 'GET'
        return HttpResponseRedirect("/mystery/Question2")

    if request.POST.get('sub'):
        request.method = 'GET'
        #check Answer
        answer = request.POST.get('answer')
        answer = answer.rstrip()
        answer = answer.lstrip()
        if answer == '1918':
            #correct
            user = request.user
            Participant.objects.filter(user = user).update(solvedAnswer2 = True)
            return HttpResponseRedirect("/mystery/Question3")
        else:
            print("Somethings wrong, I can feel it")
            request.method = 'GET'
            return HttpResponseRedirect("/mystery/Question2")
            #Trying to figure out how to pass the args there

    if request.POST.get('answer'):
        user = request.user
        Participant.objects.filter(user = user).update(showAnswer2 = True)
        request.method = 'GET'
        return HttpResponseRedirect("/mystery/Question2")
            
    elif request.method == 'GET':
        user = request.user
        guy = Participant.objects.filter(user=user)
        guy = guy[0]
        args = {}
        if guy.showAnswer2 == True or guy.solvedAnswer2 == True:
            args["ans"] = "1918"
        if guy.showHint2 == True:
            args["hin"] = "Try to decipher the code written on chit that was found in hut."
        return render(request, template_name, args)

def Question3(request, template_name='Q3.html'):

    if request.POST.get('previous'):
        request.method = 'GET'
        return HttpResponseRedirect("/mystery/Question2")
    
    if request.POST.get('hint'):
        user = request.user
        Participant.objects.filter(user = user).update(showHint3 = True)
        request.method = 'GET'
        return HttpResponseRedirect("/mystery/Question3")

    if request.POST.get('sub'):
        request.method = 'GET'
        #check Answer
        answer = request.POST.get('answer')
        answer = answer.rstrip()
        answer = answer.lstrip()
        answer = answer.upper()
        if answer == 'BIG BEN':
            #correct
            user = request.user
            Participant.objects.filter(user = user).update(solvedAnswer3 = True)
            return HttpResponseRedirect("/mystery/Question4")
        else:
            print("Somethings wrong, I can feel it")
            request.method = 'GET'
            return HttpResponseRedirect("/mystery/Question3")
            #Trying to figure out how to pass the args there

    if request.POST.get('answer'):
        user = request.user
        Participant.objects.filter(user = user).update(showAnswer3 = True)
        request.method = 'GET'
        return HttpResponseRedirect("/mystery/Question3")
            
    elif request.method == 'GET':
        user = request.user
        guy = Participant.objects.filter(user=user)
        guy = guy[0]
        args = {}
        if guy.showAnswer3 == True or guy.solvedAnswer3 == True:
            args["ans"] = "BIG BEN"
        if guy.showHint3 == True:
            args["hin"] = "Tick Tock……Tick Tock……"
        return render(request, template_name, args)

def Question4(request, template_name='Q4.html'):

    if request.POST.get('previous'):
        request.method = 'GET'
        return HttpResponseRedirect("/mystery/Question3")
    
    if request.POST.get('hint'):
        user = request.user
        Participant.objects.filter(user = user).update(showHint4 = True)
        request.method = 'GET'
        return HttpResponseRedirect("/mystery/Question4")

    if request.POST.get('sub'):
        request.method = 'GET'
        #check Answer
        answer = request.POST.get('answer')
        answer = answer.rstrip()
        answer = answer.lstrip()
        answer = answer.upper()
        if answer == 'JUNE 27, 1887':
            #correct
            user = request.user
            Participant.objects.filter(user = user).update(solvedAnswer4 = True)
            return HttpResponseRedirect("/mystery/Question5")
        else:
            print("Somethings wrong, I can feel it")
            request.method = 'GET'
            return HttpResponseRedirect("/mystery/Question4")
            #Trying to figure out how to pass the args there

    if request.POST.get('answer'):
        user = request.user
        Participant.objects.filter(user = user).update(showAnswer4 = True)
        request.method = 'GET'
        return HttpResponseRedirect("/mystery/Question4")
            
    elif request.method == 'GET':
        user = request.user
        guy = Participant.objects.filter(user=user)
        guy = guy[0]
        args = {}
        if guy.showAnswer4 == True or guy.solvedAnswer4 == True:
            args["ans"] = "JUNE 27, 1887"
        if guy.showHint4 == True:
            args["hin"] = "Figure on two significant events occurred from the clue…….answer will be known to you."
        return render(request, template_name, args)

def Question5(request, template_name='Q5.html'):

    if request.POST.get('previous'):
        request.method = 'GET'
        return HttpResponseRedirect("/mystery/Question4")
    
    if request.POST.get('hint'):
        user = request.user
        Participant.objects.filter(user = user).update(showHint5 = True)
        request.method = 'GET'
        return HttpResponseRedirect("/mystery/Question5")

    if request.POST.get('sub'):
        request.method = 'GET'
        #check Answer
        answer = request.POST.get('answer')
        answer = answer.rstrip()
        answer = answer.lstrip()
        answer = answer.upper()
        if answer == 'AUSTIN':
            #correct
            user = request.user
            Participant.objects.filter(user = user).update(solvedAnswer5 = True)
            return HttpResponseRedirect("/mystery/Question6")
        else:
            request.method = 'GET'
            return HttpResponseRedirect("/mystery/Question5")
            #Trying to figure out how to pass the args there

    if request.POST.get('answer'):
        user = request.user
        Participant.objects.filter(user = user).update(showAnswer5 = True)
        request.method = 'GET'
        return HttpResponseRedirect("/mystery/Question5")
            
    elif request.method == 'GET':
        user = request.user
        guy = Participant.objects.filter(user=user)
        guy = guy[0]
        args = {}
        if guy.showAnswer5 == True or guy.solvedAnswer5 == True:
            args["ans"] = "AUSTIN"
        if guy.showHint5 == True:
            args["hin"] = "Refer chapter 4 where the black hooded figure murdered David. He was first time wearing Victorian clothes and not the black hood."
        return render(request, template_name, args)

a = """ def Question6(request, template_name='Q6.html'):

    if request.POST.get('previous'):
        request.method = 'GET'
        return HttpResponseRedirect("/mystery/Question5")
    
    if request.POST.get('sub'):
        request.method = 'GET'
        #check Answer
        conclusion = request.POST.get('conclusion')
        user = request.user
        Participant.objects.filter(user = user).update(conclusion = conclusion)
        return HttpResponseRedirect("/mystery/Completion")
            
    elif request.method == 'GET':
        user = request.user
        guy = Participant.objects.filter(user=user)
        guy = guy[0]
        args = {}
        return render(request, template_name, args)

def Completion(request, template_name='completion.html'):

    if request.POST.get('previous'):
        request.method = 'GET'
        return HttpResponseRedirect("/mystery/Question6")
            
    elif request.method == 'GET':
        user = request.user
        guy = Participant.objects.filter(user=user)
        guy = guy[0]
        args = {}
        return render(request, template_name, args) """