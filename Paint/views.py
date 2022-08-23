from django.shortcuts import render, redirect
from django.utils import timezone
from Paint.models import testersData
from datetime import datetime
import random

#The total number of the tests
NUMBER_OF_TESTS = 15

#The page of the language choosing
def language(request):
    return render(request,'language.html')

#The index page
def welcome(request):
    if request.method == 'POST':
        data = {'tester_Name': request.POST['username'], 'tester_Gender': request.POST['gender'],
                'tester_Role': request.POST['role'], 'tester_Age': request.POST['userage'],
                'start_time': timezone.now().isoformat(),
                'tester_No': request.POST['userno'] if request.POST.get('userno') else '',
                'tester_Program': request.POST['userprog'] if request.POST.get('userprog') else ''}
        request.session['data'] = data
        request.session['randomshapes'] = []
        request.session.pop('submitted_data', None)
        return redirect('tests', 1)
    #return redirect('welcomeEN' if request.session.get('lang', 'en') == 'en' else 'welcomeCN')
#Different versions of the index page
def welcomeEN(request):
    request.session['lang'] = 'en'
    return render(request, 'welcome.html', {'lang': 'en'})
def welcomeCN(request):
    request.session['lang'] = 'cn'
    return render(request, 'welcome.html', {'lang': 'cn'})

#The tests pages
def tests(request, test_id):
    if request.session.get('data') is None or request.session.get('randomshapes') is None:
        return redirect('welcome')

    if request.method == 'POST':
        if test_id <= 10:
            request.session['data'][f'q{test_id}'] = int(request.POST['value'])
        elif test_id <= 14:
            shape = request.session['randomshapes'][test_id - 11]
            request.session['data'][f'{shape}_color'] = request.POST['color']
            for feeling in range(3):
                request.session['data'][f'{shape}_feeling{feeling+1}'] = int(request.POST.getlist('feeling')[feeling])
        elif test_id == 15:
            # blind test
            request.session['data']['blindtest'] = request.POST['value']

        if test_id < NUMBER_OF_TESTS:
            return redirect('tests', test_id + 1)
        else:
            request.session.pop('randomshapes')
            data = request.session.pop('data')
            extraversion = round((data['q1'] + 6 - data['q6']) / 2)
            agreeableness = round((6 - data['q2'] + data['q7']) / 2)
            conscientiousness = round((data['q3'] + 6 - data['q8']) / 2)
            neuroticism = round((6 - data['q4'] + data['q9']) / 2)
            openness = round((data['q5'] + 6 - data['q10']) / 2)
            testersData.objects.create(**data)

            # print(extraversion, "-", agreeableness, "-", conscientiousness, "-", neuroticism, "-", openness)
            graph_data = {
                'ext': extraversion,
                'agr': agreeableness,
                'con': conscientiousness,
                'neu': neuroticism,
                'ope': openness,
            }
            request.session['submitted_data'] = {**data, **graph_data}
            return redirect('testresult')
    else:
        lang = request.session.get('lang', 'en')
        context = {'num_of_tests': NUMBER_OF_TESTS, 'test_id': test_id, 'last_test_id': test_id - 1, 'lang': request.session.get('lang', 'en')}

        if 11 <= test_id <= 14:
            if len(request.session['randomshapes']) < test_id - 10:
                allshapes = ['square', 'triangle', 'circle', 'halfcircle']
                shape = random.choice(allshapes)
                while shape in request.session['randomshapes']:
                    shape = random.choice(allshapes)
                request.session['randomshapes'].append(shape)
            else:
                shape = request.session['randomshapes'][test_id - 11]
            context['shape'] = shape

        return render(
            request,
            f'q{test_id}_{lang}.html' if not 11 <= test_id <= 14 else f'q11_{lang}.html',
            context,
        )


def testresult(request):
    if request.session.get('submitted_data') is None:
        return redirect('welcome')
    lang = request.session.get('lang', 'en')
    return render(request, f'qresult_{lang}.html', request.session['submitted_data'])




def testpaint(request):
    if request.session.get('submitted_data') is None:
        return redirect('welcome')
    lang = request.session.get('lang', 'en')
    return render(request, f'qpaint_{lang}.html', request.session['submitted_data'])


def paint(request):
    if request.method == 'POST':
        pass
    return render(request, 'index-new.html')
