FROM python:3.9.0

WORKDIR /home/

RUN git clone https://github.com/woojoo0425/buttercup.git

WORKDIR /home/buttercup/

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN echo "SECRET_KEY=django-insecure-4s&0#xmn-)hdnvfbi8=pbzov_h(ms36)ghep15$y_4x&3=2m!6" > .env

RUN python manage.py migrate

RUN python manage.py collectstatic

EXPOSE 8000

CMD ["gunicorn", "buttercup.wsgi", "--bind", "0.0.0.0:8000"]