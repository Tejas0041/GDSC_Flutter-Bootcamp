import json
from pathlib import Path
import uvicorn
from fastapi import FastAPI
from fastapi.responses import JSONResponse
from pydantic import BaseModel

from re_edge_gpt import Chatbot, ConversationStyle

app = FastAPI()
cookies = json.loads(open(str(Path(str(Path.cwd()) + "/bing-cookies.txt")), encoding="utf-8").read())


class Payload(BaseModel):
    text: str


@app.post('/get-response')
async def get_response(payload: Payload):
    question = payload.text
    bot = await Chatbot.create(cookies=cookies)
    response = await bot.ask(prompt=question, conversation_style=ConversationStyle.creative,
                             simplify_response=True)
    answer = response['text']
    res = {"response": answer}
    return JSONResponse(res, 200)


if __name__ == "__main__":
    uvicorn.run(app)
