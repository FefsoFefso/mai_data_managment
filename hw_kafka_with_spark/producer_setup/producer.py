from confluent_kafka import Producer


class SimpleProducer:
    def __init__(self):
        self.producer = Producer(
            {
                'bootstrap.servers': "localhost:29092,localhost:39092",
                'socket.timeout.ms': 100,
                'api.version.request': 'false',
                'broker.version.fallback': '0.9.0',
            }
        )
    
    def send_message(self, topic, message):
        self.producer.produce(topic, key=message, value=message)
        self.producer.flush()
