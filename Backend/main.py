from fastapi import FastAPI, Response

app = FastAPI()


@app.get("/")
async def root():
    return {"message": "Hello World"}


@app.get("/hello")
async def say_hello(response:Response):
    response.set_cookie(key='fake_session_id', value="23234234234", expires=15)
    return {
        "message": "cookie"
    }
