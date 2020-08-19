FROM python:3-onbuild
RUN pip install --upgrade pip && \
    pip install numpy
COPY src/ .
CMD [ "python", "./schoolerp.py" ]
