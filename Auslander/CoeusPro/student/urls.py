from django.urls import path ,include
from . import views
from django.conf import settings
from django.conf.urls.static import static

app_name='student'
urlpatterns = [
    path('', views.studentformView.as_view(), name="studentregister"),
    path('/',include([
    path('courses', views.courses.as_view(), name="courses"),
    path('addCourse', views.addCourse.as_view(), name="addCourse"),
    path('webinars', views.webinars.as_view(), name="webinars"),
    path('addWebinar', views.addWebinar.as_view(), name="addWebinar"),
    path('workshops', views.workshops.as_view(), name="workshops"),
    path('addWorkshop', views.addWorkshop.as_view(), name="addWorkshop"),
    path('competitions', views.competitions.as_view(), name="competitions"),
    path('addCompetition', views.addCompetition.as_view(), name="addCompetition"),
    path('addPaper', views.addPaper.as_view(), name="addPaper"),
    path('papers', views.papers.as_view(), name="papers"),
    ])),
]