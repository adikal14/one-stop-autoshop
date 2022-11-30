from flask import Blueprint, request, jsonify, make_response
import json
from src import db


mechanics = Blueprint('mechanics', __name__)

# Get all customers from the DB
@mechanics.route('/test_mechanics', methods=['GET'])
def isnt_this_fun():
    return '<h1>Yay!</h1>'