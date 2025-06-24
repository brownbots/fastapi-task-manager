from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from .database import SessionLocal
from .models import Task

router = APIRouter()

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@router.post("/tasks")
def create_task(title: str, description: str, db: Session = Depends(get_db)):
    task = Task(title=title, description=description)
    db.add(task)
    db.commit()
    db.refresh(task)
    return task

@router.get("/tasks")
def get_tasks(db: Session = Depends(get_db)):
    return db.query(Task).all()