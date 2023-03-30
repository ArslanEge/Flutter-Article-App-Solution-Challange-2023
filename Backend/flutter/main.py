from fastapi import FastAPI,Depends,HTTPException,status
from fastapi.responses import JSONResponse
from fastapi.encoders import jsonable_encoder
from http import HTTPStatus
from .database import engine,SessionLocal
from sqlalchemy.orm import Session
from .import schemas
from .import models
from .import hashing

app=FastAPI()

models.Base.metadata.create_all(engine)



def get_db():
    db=SessionLocal()

    try:
        yield db
    finally:
        db.close()


@app.post("/login")
def login(request:schemas.Login,db: Session=Depends(get_db),message:str="user verifed",status:bool=True):
    user=db.query(models.User).filter(models.User.email==request.email).first()

    if not user:
        
         raise HTTPException(status_code=HTTPStatus.NOT_FOUND,detail=f"Invalid email")     

    if not hashing.Hash.verify(user.password,request.password):
        raise HTTPException(status_code=HTTPStatus.NOT_FOUND,detail=f"Invalid password")

    return {"message":message,"status":status}

@app.post("/user")
def create_user(request:schemas.User,db: Session=Depends(get_db)):
    new_user=models.User(email=request.email,password=hashing.Hash.bcrypt(request.password))
    db.add(new_user)
    db.commit()
    db.refresh(new_user)
    return new_user

@app.post("/blog",response_model=schemas.Show)
def create(request:schemas.Login):

    return request

@app.post("/words")
def create_words(request:schemas.Words,db:Session=Depends(get_db)):
    new_row=models.Words(word=request.word,article=request.article)
    db.add(new_row)
    db.commit()
    db.refresh(new_row)
    return new_row

@app.get("/words")
def get_words(db:Session=Depends(get_db)):
    all_row=db.query(models.Words).all()
    return {"data":all_row}
    


