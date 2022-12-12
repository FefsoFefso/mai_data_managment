# THIS IS OK ... but spark stream ...

from confluent_kafka import Consumer
from time import sleep

class ExampleConsumer:
    topic = "homework_topic"
    group_id = "consumer-1"

    def start_listener(self):
        consumer_config = {
            'bootstrap.servers': 'localhost:29092,localhost:39092',
            'group.id': self.group_id,
            'auto.offset.reset': 'largest',
            'enable.auto.commit': 'false',
            'max.poll.interval.ms': '86400000'
        }

        consumer = Consumer(consumer_config)
        consumer.subscribe([self.topic])

        try:
            while True:
                print("Listening")

                msg = consumer.poll(0)

                if msg is None:
                    sleep(5)
                    continue
                if msg.error():
                    print("Error reading message : {}".format(msg.error()))
                    continue

                print(msg.value())
                consumer.commit()

        except Exception as ex:
            print("Kafka Exception : {}", ex)

        finally:
            print("closing consumer")
            consumer.close()

my_consumer = ExampleConsumer()
my_consumer.start_listener()