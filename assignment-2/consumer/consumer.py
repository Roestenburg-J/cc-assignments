import signal
import click
import random
import avro.schema
from avro.datafile import DataFileReader, DataFileWriter
from avro.io import DatumReader, BinaryDecoder
import io

from confluent_kafka import Consumer


def signal_handler(sig, frame):
    print('EXITING SAFELY!')
    exit(0)

signal.signal(signal.SIGTERM, signal_handler)

schema = avro.schema.parse(open("./experiment_schema.avsc").read())
# writer = DataFileWriter(open("users.avro", "wb"), DatumWriter(), schema)

reader = DatumReader(schema)

def decode(msg_value):
    message_bytes = io.BytesIO(msg_value)
    decoder = BinaryDecoder(message_bytes)
    event_dict = reader.read(decoder)
    return event_dict

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
        # avro_bytes = BytesIO(msg.value())
        # avro_reader = avro.io.BinaryDecoder(avro_bytes)
        msg_value = msg.value()
        # print(msg_value)
        event_dict = decode(msg_value)
        print(event_dict)
     
        

consume()
