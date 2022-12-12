from confluent_kafka.admin import AdminClient, NewTopic

TOPIC_NAME: str = "homework_topic"


admin_client = AdminClient({
    "bootstrap.servers": "localhost:29092,localhost:39092"
})

old_topics: dict = admin_client.list_topics().topics

if TOPIC_NAME not in old_topics:
    admin_client.create_topics([NewTopic(TOPIC_NAME, 1, 1)])
