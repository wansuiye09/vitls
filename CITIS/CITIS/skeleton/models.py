import CITIS.database
import CITIS.models
from sqlalchemy import Column, Integer, String, Text, ForeignKey, Boolean, Table
from sqlalchemy.orm import relationship, backref

# put your models here

# class MyModel(CITIS.database.Base):
#     __tablename__ = "foobar"
# 
#     id = Column(Integer, primary_key = True)
#     name = Column(String(250))
