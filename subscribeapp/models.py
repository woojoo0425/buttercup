from django.contrib.auth.models import User
from django.db import models
from projectapp.models import Project

# Create your models here.

class Subscribe(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='subscribe')
    project = models.ForeignKey(Project, on_delete=models.CASCADE, related_name='subscribe')

    class Meta:
        unique_together = ('user', 'project')