from flask import Blueprint, request, jsonify, make_response
import json
from src import db

manager = Blueprint('manager', __name__)


# Get all managers from the database
@manager.route('/manager', methods=['GET'])
def get_manager():
    cursor = db.get_db().cursor()
    cursor.execute('select * from manager')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get user information for manager with particular userID
@manager.route('/manager/profile/<userID>', methods=['GET'])
def get_profile(userID):
    cursor = db.get_db().cursor()
    #  check this line below
    cursor.execute('select first_name, last_name, manager_ID from manager where manager_ID={0}'.format(userID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

#get account information for manager with particular userID
@manager.route('/manager/account/<userID>', methods=['GET'])
def get_account(userID):
    cursor = db.get_db().cursor()
    # check this line below
    cursor.execute('select a.username, a.account_ID, a.age_of_account from account a join manager m where m.a_ID = a.account_ID and m.manager_ID = {0}'.format(userID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


#get autoshop information from a manager with a particular user_ID
@manager.route('/manager/autoshop/<userID>', methods=['GET'])
def get_autoshop(userID):
    cursor = db.get_db().cursor()
    cursor.execute('select a.auto_ID, a.name, a.street, a.city, a.state, a.postalcode from autoshop a where a.managerID = {0}'.format(userID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response