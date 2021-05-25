#!/bin/env python3
from flask import Flask

class Record:
    def __init__(self, name):
        self.name = name


class Registrar:
    def __init__(self, app):
        self.application = app
        self.register = []

    def create_record(self, record_name):
        assert(len(record_name) > 0)
        r = Record(record_name)
        self.register.append(r)

    def delete_record(self, record_name):
        for r in self.register:
            if record_name == r.name:
                self.register.remove(r)
                return True
        return False

    def list_records(self):
        rsp = ",".join([r.name for r in self.register])
        return rsp

app = Flask(__name__)
registrar = Registrar(app)

@app.route("/list_records")
def list_records():
    return registrar.list_records() + "\n"

@app.route("/create_record/<string:name>")
def create_record(name):
    try:
        registrar.create_record(name)
        return f"{name} added to register." + "\n"
    except:
        return "Empty record name" + "\n", 520

@app.route("/delete_record/<string:name>")
def delete_record(name):
    try:
        found = registrar.delete_record(name)
        assert(found)
        return f"{name} deleted from register." + "\n"
    except:
        return "No such record to delete" + "\n", 521
