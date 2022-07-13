# admin page
# username: psypaint
# password: psypaint

from django.contrib import admin
from Paint.models import testersData


# Register your models here.
# @admin.register(testersData)
# class testersDateAdmin(admin.ModelAdmin):
#     list_display = (
#         'tester_Name', 'tester_Program', 'tester_Age', 'tester_Gender', 'q1', 'q2', 'q3', 'q4', 'q5', 'q6', 'q7', 'q8',
#         'q9', 'q10', 'file_url', 'generate_time')


# Register your models here.
admin.site.register(testersData)
