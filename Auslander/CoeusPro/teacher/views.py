
from django.contrib.auth.models import User
from teacher.models import faculty
import shortuuid
from django.core.files.storage import FileSystemStorage
from django.views.generic.base import View
from django.contrib.auth.models import Group
from django.shortcuts import render


class facultyFormView(View):

    def get(self, request, template_name='teacher/facreg.html'):
        return render(request, template_name)

    def post(self, request, template_name='teacher/facreg.html'):
        username = request.POST.get('username')
        password = request.POST.get('password')
        email = request.POST.get('email')
        first_name = request.POST.get('first_name')
        last_name = request.POST.get('last_name')
        department = request.POST.get('dept')
        confPassword = request.POST.get('conf_password')
        degree = request.POST.get('degree')
        desig = request.POST.get('designation')

        if confPassword != password:
            err = {'error_message': "Passwords don't match. Please Try Again."}
            return render(request, 'teacher/facreg.html', err)

        try:
            user = User.objects.create_user(username, email, password, first_name=first_name,
                                            last_name=last_name, )
            user.save()
        except:
            err = {'error_message': "Account with this Username already Exists."}
            return render(request, template_name, err)

        profile = request.FILES['profile']
        fs = FileSystemStorage()
        filename = fs.save(shortuuid.uuid(), profile)
        url = fs.url(filename)

        facultyData = faculty(user=user, dept=department, degree=degree, profile=url, desig=desig)
        facultyData.save()

        my_group = Group.objects.get(name='faculty_group')
        my_group.user_set.add(user)

        err = {'error_message': "Registration Successful. Please Login."}
        return render(request, template_name, err)
