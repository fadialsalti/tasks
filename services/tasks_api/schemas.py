from uuid import UUID
from typing import List

from pydantic import BaseModel

from models import TaskStatus


class CreateTask(BaseModel):
    title: str


class APITask(BaseModel):
    id: UUID
    title: str
    status: TaskStatus
    owner: str

    class Config:
        orm_mode = True


class APITaskList(BaseModel):
    results: List[APITask]

    class Config:
        orm_mode = True


class CloseTask(BaseModel):
    id: UUID
