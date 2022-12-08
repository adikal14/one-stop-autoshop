from flask import Blueprint, request, jsonify, make_response
import json
from src import db


mechanics = Blueprint('mechanics', __name__)

# Get all customers from the DB
@mechanics.route('/test_mechanics', methods=['GET'])
def nothing():
    return '<h1>Yay!</h1>'

# Get all mechanics from the DB
@mechanics.route('/mechanics', methods=['GET'])
def get_mechanics():
    cursor = db.get_db().cursor()
    cursor.execute('select * from mechanic')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


# Get all information for a single mechanic


# Get all work place information for chosen mechanic


# Get all Account Information for chosen mechanic


# Get all Skills information for chosen mechanic


# Get all past reviews for chosen mechanic


    