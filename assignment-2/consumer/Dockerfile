FROM python:3.8

WORKDIR /usr/src/app

COPY ./requirements.txt ./
RUN pip install -r requirements.txt

COPY ./*.py ./  
COPY ./schemas/experiment_schema.avsc ./

VOLUME ["/usr/src/app/auth"]

ENTRYPOINT ["python3", "-u", "consumer.py"]
