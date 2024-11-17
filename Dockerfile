FROM python:3.13.0-alpine3.20

RUN mkdir -p /home/app

COPY . /home/app

EXPOSE 8000

CMD ["python","/home/app/Django/manage.py","runserver","8000"]