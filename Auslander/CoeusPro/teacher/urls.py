from django.urls import path
from . import views
from django.conf import settings
from django.conf.urls.static import static

app_name='teacher'

urlpatterns = [
    path('', views.facultyFormView.as_view(), name="facultyregister"),
]