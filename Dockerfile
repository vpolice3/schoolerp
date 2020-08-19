FROM python:alpine3.7
ADD schoolerp.py /
RUN pip install pystrich
CMD [ "python", "./schoolerp.py" ]
