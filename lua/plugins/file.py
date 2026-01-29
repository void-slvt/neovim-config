from random import randint
from uuid import uuid4

from fastapi import FastAPI, Header, HTTPException
from pydantic import BaseModel

app = FastAPI()

player_dict = {}


class GuessRequest(BaseModel):
    n: int


class GuessRespond(BaseModel):
    answer: str


class AuthRespond(BaseModel):
    token: str


@app.post('/auth')
async def auth():
    global player_dict

    while (token := uuid4().hex) in player_dict.keys():
        pass
    else:
        player_dict[token] = randint(0, 100)
        print(player_dict)
        return AuthRespond(token=token)


@app.post('/guess')
async def guess(request: GuessRequest, x_auth_token: str = Header(...)):
    global player_dict

    if x_auth_token not in player_dict.keys():
        raise HTTPException(status_code=403, detail='Недопустимый токен')
    else:
        n = request.n
        if n < player_dict[x_auth_token]:
            return GuessRespond(answer='<')
        if n > player_dict[x_auth_token]:
            return GuessRespond(answer='>')
        if n == player_dict[x_auth_token]:
            player_dict[x_auth_token] = randint(0, 100)
            print(player_dict)
            return GuessRespond(answer='=, new number generated')
