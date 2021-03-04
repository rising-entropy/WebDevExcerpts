from django.db import models
from django.contrib.auth.models import User
# Create your models here.
from django.db.models import OneToOneField

class participant(models.Model):
    user: OneToOneField = models.OneToOneField(User, on_delete=models.CASCADE)
    showHint1 = models.BooleanField(default=False)
    showAnswer1 = models.BooleanField(default=False)
    solvedAnswer1 = models.BooleanField(default=False)
    showHint2 = models.BooleanField(default=False)
    showAnswer2 = models.BooleanField(default=False)
    solvedAnswer2 = models.BooleanField(default=False)
    showHint3 = models.BooleanField(default=False)
    showAnswer3 = models.BooleanField(default=False)
    solvedAnswer3 = models.BooleanField(default=False)
    showHint4 = models.BooleanField(default=False)
    showAnswer4 = models.BooleanField(default=False)
    solvedAnswer4 = models.BooleanField(default=False)
    showHint5 = models.BooleanField(default=False)
    showAnswer5 = models.BooleanField(default=False)
    solvedAnswer5 = models.BooleanField(default=False)
    solvedAnswer6 = models.BooleanField(default=False)
    conclusion = models.CharField(default = 'NA', max_length=30000)

    def __str__(self):
        return self.user.username