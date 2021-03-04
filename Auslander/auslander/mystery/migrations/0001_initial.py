# Generated by Django 3.1.1 on 2020-11-30 06:34

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='participant',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('showHint1', models.BooleanField(default=False)),
                ('showAnswer1', models.BooleanField(default=False)),
                ('solvedAnswer1', models.BooleanField(default=False)),
                ('showHint2', models.BooleanField(default=False)),
                ('showAnswer2', models.BooleanField(default=False)),
                ('solvedAnswer2', models.BooleanField(default=False)),
                ('showHint3', models.BooleanField(default=False)),
                ('showAnswer3', models.BooleanField(default=False)),
                ('solvedAnswer3', models.BooleanField(default=False)),
                ('showHint4', models.BooleanField(default=False)),
                ('showAnswer4', models.BooleanField(default=False)),
                ('solvedAnswer4', models.BooleanField(default=False)),
                ('showHint5', models.BooleanField(default=False)),
                ('showAnswer5', models.BooleanField(default=False)),
                ('solvedAnswer5', models.BooleanField(default=False)),
                ('showHint6', models.BooleanField(default=False)),
                ('showAnswer6', models.BooleanField(default=False)),
                ('solvedAnswer6', models.BooleanField(default=False)),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
