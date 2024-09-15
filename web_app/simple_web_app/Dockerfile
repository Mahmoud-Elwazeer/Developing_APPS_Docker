FROM python:3.11

RUN groupadd -r elwazeer && useradd -r -g elwazeer elwazeer 

WORKDIR /app

COPY requirements.txt /app
COPY web_app /app
COPY cmd.sh /

RUN pip3 install -r requirements.txt

EXPOSE 5000 6000

# for development mode
# CMD [ "python3", "app.py" ]

# for production mode using uWSGI
USER elwazeer
# CMD ["uwsgi", "--http", "0.0.0.0:5000", "--module", "app:app"]
CMD ["/cmd.sh"]
