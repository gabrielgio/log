FROM django

ADD . /app

WORKDIR /app

RUN ["pip", "install", "markdown2"]

RUN ["pip", "install", "django-bower"]

CMD ["python" , "manage.py", "migrate"]

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
