FROM python:alpine3.19

WORKDIR /app
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt
COPY . /app


CMD [ "python", "scripts/fetching.py" ]
