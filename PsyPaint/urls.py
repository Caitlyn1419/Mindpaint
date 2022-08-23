"""PsyPaint URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path

#找对应的函数，是哪个APP里面的函数
from Paint import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.language, name='language'),
    path('index/', views.welcome, name='welcome'),
    path('index_en/', views.welcomeEN, name='welcomeEN'),
    path('index_cn/', views.welcomeCN, name='welcomeCN'),
    path('test/<int:test_id>', views.tests, name='tests'),
    path('result/', views.testresult, name='testresult'),

    # path('paint/', views.testpaint, name='testpaint'),
    path('result/', views.paint, name='result')
]
