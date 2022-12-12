from fastapi import FastAPI
from producer import SimpleProducer
from pydantic import BaseModel
import uvicorn

# THIS ROUTE ONLY FOR SENDING DATA TO TOPIC
TOPIC_NAME: str = "homework_topic"
producer = SimpleProducer()

class SomeDataForKafka(BaseModel):
    useful_string: str
    useless_string: str
    useful_int: int
    useless_float: float


app = FastAPI()

@app.post('/send/')
async def send_data(data: SomeDataForKafka):
    producer.send_message(TOPIC_NAME, str(data))
    return {"message": str(data)}

uvicorn.run(app, host="0.0.0.0", port=8000)
