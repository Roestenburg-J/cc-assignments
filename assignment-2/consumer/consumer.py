import signal
import click
import random
import avro.schema
from avro.io import DatumReader
from io import BytesIO

from confluent_kafka import Consumer


def signal_handler(sig, frame):
    print('EXITING SAFELY!')
    exit(0)

signal.signal(signal.SIGTERM, signal_handler)

schema = avro.schema.parse(open("./schemas/experiment_schema.avsc", "rb").read())
reader = DatumReader(schema)



c = Consumer({
    'bootstrap.servers': '13.49.128.80:19093',
    'group.id': f"{random.random()}",
    'auto.offset.reset': 'latest',
    'security.protocol': 'SSL',
    'ssl.ca.location': './auth/ca.crt',
    'ssl.keystore.location': './auth/kafka.keystore.pkcs12',
    'ssl.keystore.password': 'cc2023',
    'enable.auto.commit': 'true',
    'ssl.endpoint.identification.algorithm': 'none',
})

@click.command()
@click.argument('topic')
def consume(topic: str): 
    c.subscribe(
        [topic], 
        on_assign=lambda _, p_list: print(p_list)
    )

    while True:
        msg = c.poll(1.0)
        
        if msg is None:
            continue
        if msg.error():
            print("Consumer error: {}".format(msg.error()))
            continue
        avro_bytes = BytesIO(msg.value())
        avro_reader = avro.io.BinaryDecoder(avro_bytes)
        data = reader.read(avro_reader)
        
        # Print the deserialized data
        print(data)
        

consume()
