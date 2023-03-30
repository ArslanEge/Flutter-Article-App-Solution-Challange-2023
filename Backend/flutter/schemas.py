from pydantic import BaseModel 

class Login(BaseModel):
    email:str
    password:str


class User(BaseModel):
    email:str
    password:str

class Show(BaseModel):
    email:str

class Words(BaseModel):
    word:str
    article:str

