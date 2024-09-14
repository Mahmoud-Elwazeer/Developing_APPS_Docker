FROM python:3.11

WORKDIR /app

COPY requirements.txt /app
COPY web_app /app

RUN pip3 install -r requirements.txt

CMD [ "python3", "app.py" ]
