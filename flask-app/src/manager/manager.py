from flask import Blueprint, request, jsonify, make_response
import json
from src import db


manager = Blueprint('manager', __name__)

# Get all customers from the DB
@manager.route('/test_manager', methods=['GET'])
def managers():
    return '<h1>Yay!</h1>'