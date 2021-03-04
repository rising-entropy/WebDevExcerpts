from django.db import models
from django.contrib.auth.models import User
User._meta.get_field('email')._unique = True

# Create your models here.
from django.db.models import OneToOneField


class faculty(models.Model):
    user: OneToOneField = models.OneToOneField(User, on_delete=models.CASCADE)
    dept = models.CharField(default = 'CSE', max_length=10)
    #fName = models.CharField(default = 'Lionel', max_length=30)
    #lName = models.CharField(default = 'Messi', max_length=30)
    #email = models.EmailField(default = 'lionel@messi.com', max_length=50, unique=True)
    degree = models.CharField(default='Bachelors', max_length=50)
    desig = models.CharField(default='Professor',max_length=50)
    profile = models.URLField()

    def __str__(self):
        return self.user.username

