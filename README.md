# Mindpaint
1. extract source code to a folder (e.g. C:\Source\PsypaintDev-master)

2. install python3

3. after installed python3, install django
   go to command prompt window, type in:
   pip install django==3.2.9

4. after install django, do database migration
   open command prompt window, go to C:\Source\PsypaintDev-master
   type in:
   
   **python manage.py migrate**

6. if all ok, you are ready to run the program
   on the same command prompt window, type in:
   
   **python manage.py runserver**

8. open any browser(e.g. chrome), go to http://127.0.0.1:8000/
