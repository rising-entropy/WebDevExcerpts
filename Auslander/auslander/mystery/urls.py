from django.urls import path ,include
from . import views
from django.conf import settings
from django.conf.urls.static import static

app_name='mystery'
urlpatterns = [
    path('', views.begin, name="begin"),
    path('/',include([
    path('Question1', views.Question1, name="Question1"),
    path('Question2', views.Question2, name="Question2"),
    path('Question3', views.Question3, name="Question3"),
    path('Question4', views.Question4, name="Question4"),
    path('Question5', views.Question5, name="Question5"),
    #path('Question6', views.Question6, name="Question6"),
    #path('Completion', views.Completion, name="Completion"),
    #path('addCourse', views.addCourse.as_view(), name="addCourse"),
    
    ])),
]