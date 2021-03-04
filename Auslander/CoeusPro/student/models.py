from django.db import models
from django.contrib.auth.models import User
User._meta.get_field('email')._unique = True
from django.utils import timezone
import datetime
from django.core.validators import MaxValueValidator

# Create your models here.
from django.db.models import OneToOneField

class student(models.Model):
    user: OneToOneField = models.OneToOneField(User, on_delete=models.CASCADE)
    PRN = models.CharField(max_length=20, unique=True)
    dept = models.CharField(max_length=10)
    year = models.CharField(max_length=2)
    #semester
    #electives

    def __str__(self):
        return self.user.username

class courses(models.Model):
    user = models.ForeignKey(User, on_delete= models.CASCADE)
    name = models.CharField(default = 'C++', max_length=30)
    domain = models.CharField(default = 'CSE', max_length=30)
    platform = models.CharField(default = 'Udemy', max_length=30)
    startDate =  models.DateTimeField(default=timezone.now)
    endDate =  models.DateTimeField(default=timezone.now)
    certification = models.URLField()
    certBool = models.BooleanField()
    
class webinars(models.Model):
    user = models.ForeignKey(User, on_delete= models.CASCADE)
    name = models.CharField(default = 'kala', max_length=30)
    organizer = models.CharField(default = 'WCE', max_length=30)
    location = models.CharField(default = 'Sangli', max_length=50)
    mode = models.BooleanField()
    startDate = models.DateTimeField(default=timezone.now)
    endDate = models.DateTimeField(default=timezone.now)
    certification = models.URLField()
    certBool = models.BooleanField()

class workshops(models.Model):
    user = models.ForeignKey(User, on_delete= models.CASCADE)
    name = models.CharField(default = 'kala', max_length=30)
    organizer = models.CharField(default = 'WCE', max_length=30)
    location = models.CharField(default = 'Sangli', max_length=50)
    mode = models.BooleanField()
    startDate =  models.DateTimeField(default=timezone.now)
    endDate =  models.DateTimeField(default=timezone.now)
    certification = models.URLField()
    certBool = models.BooleanField()

class competitions(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    compname = models.CharField(default='WCE Hackathon', max_length=50)
    organizer = models.CharField(default='Walchand College of Engineering, Sangli', max_length=60)
    location = models.CharField(default='Sangli', max_length=15)
    mode = models.BooleanField()
    projectTitle = models.CharField(default='No Title', max_length=45)
    description = models.TextField(default='No description')
    startDate = models.DateTimeField(default=timezone.now)
    endDate = models.DateTimeField(default=timezone.now)
    winner = models.BooleanField()
    #devang######################################################################
    certBool = models.BooleanField(default=False)
    certification = models.URLField()

class paperpublications(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    papertitle = models.CharField(default='Research Paper', max_length=100)
    mode = models.BooleanField()
    confname = models.CharField(default='No Title', max_length=100)
    startDate = models.DateTimeField(default=timezone.now)
    endDate = models.DateTimeField(default=timezone.now)
    location = models.CharField(default='Sangli', max_length=100)
    level = models.BooleanField()
    publicationPorR = models.BooleanField()
    publicationtype = models.CharField(default='Book Chapter', max_length=100)
    volumenumber = models.IntegerField()
    issuenumber = models.IntegerField()
    isbnissndoi = models.CharField(default='ISBN', max_length=20)
    pagefrom = models.IntegerField()
    pageto = models.IntegerField()
    month = models.CharField(default='September', max_length=15)
    year = models.IntegerField('year', validators=[MaxValueValidator(9999)], default=datetime.datetime.now().year)
    paperurl = models.URLField(default='http://www.sciencedirect.com/science/article/pii/S0747563216304411')

class author(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    papers = models.ForeignKey(paperpublications, null=True, on_delete=models.CASCADE)

class teamMember(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    comps = models.ForeignKey(competitions, null=True, on_delete=models.CASCADE)
    #devang#########################################################################
    #certBool = models.BooleanField(default=False)
    #certification = models.URLField()

        # associate professor
        # assistant professor
        # professer
        # hi username

        # HOD view
        # Handle Certificate Individuality
        # Handle Duplicate Competitions- could not be done
        # Add Semester and Elective in student profile for ty and final

        # delete the posts
