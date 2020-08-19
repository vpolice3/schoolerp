FROM python:alpine3.7
ADD schoolerp.py /
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY src/ .
CMD [ "python", "./schoolerp.py" ]
