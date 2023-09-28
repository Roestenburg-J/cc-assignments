FROM python:3.8

WORKDIR /usr/src/app

COPY ./requirements.txt ./
COPY ./schemas/experiment_schema.avsc ./
RUN pip install -r requirements.txt

COPY ./*.py ./  

VOLUME ["/usr/src/app/auth"]

ENTRYPOINT ["python3", "-u", "consumer.py"]
