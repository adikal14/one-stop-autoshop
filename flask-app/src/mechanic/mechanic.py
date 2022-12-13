from flask import Blueprint, request, jsonify, make_response
import json
from src import db


mechanics = Blueprint('mechanics', __name__)

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


# Get all profile information for a single mechanic
@mechanics.route('/mechanics/profile/<userID>', methods=['GET'])
def get_profile(userID):
    cursor = db.get_db().cursor()
    cursor.execute('select first_name, last_name, mechanic_ID, average_rating, years_of_experience from mechanic where mechanic_ID = {0}'.format(userID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


# Get all work place information for chosen mechanic
@mechanics.route('/mechanics/workplace/<userID>', methods=['GET'])
def get_workplace(userID):
    cursor = db.get_db().cursor()
    cursor.execute('select a.name, a.street, a.city, a.state, a.postalcode, man.first_name, man.last_name from autoshop a join mechanic m join manager man where m.autoID = a.auto_ID and a.managerID = man.manager_ID and m.mechanic_ID={0}'.format(userID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get all Account Information for chosen mechanic
@mechanics.route('/mechanics/account/<userID>', methods=['GET'])
def get_account(userID):
    cursor = db.get_db().cursor()
    cursor.execute('select a.username, a.account_ID, a.age_of_account from account a join mechanic m where m.a_ID = a.account_ID and m.mechanic_ID = {0}'.format(userID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


# Get all Skills information for chosen mechanic
@mechanics.route('/mechanics/skills/<userID>', methods=['GET'])
def get_skills(userID):
    cursor = db.get_db().cursor()
    cursor.execute('select s.description, s.price, s.duration from skills s join mechanic m join mechanic_skills ms where s.skill_ID = ms.skill_ID and ms.mechanic_ID = m.mechanic_ID and m.mechanic_ID = {0}'.format(userID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


# Get all past reviews for chosen mechanic
@mechanics.route('/mechanics/reviews/<userID>', methods=['GET'])
def get_reviews(userID):
    cursor = db.get_db().cursor()
    cursor.execute('select r.duration, r.price_paid, r.star_rating, r.review_description from reviews r where r.mechanic_ID = {0}'.format(userID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

#a mechanic adds a skill
@mechanics.route('/mechanics/form', methods=['POST'])
def add_skills():
    #customer_ID, repair_ID, mechanic_ID, duration, price_paid, star_rating, review_description
    skill_ID = request.form['skill_ID']
    description = request.form['description']
    price= request.form['price']
    duration = request.form['duration']
    mechanic_ID = request.form['mechanic_ID']
    cursor = db.get_db().cursor()
    cursor.execute(f'INSERT INTO skills (skill_ID, description, price, duration) VALUES ({skill_ID}, "{description}", {price}, {duration});')
    cursor.execute(f'INSERT INTO mechanic_skills (skill_ID, mechanic_ID) VALUES ({skill_ID}, {mechanic_ID});')
    cursor.connection.commit()
    return get_all_skills()

#get the table of all mechanics and their skills
@mechanics.route('/mechanics/all_skills', methods=['GET'])
def get_all_skills():
    cursor = db.get_db().cursor()
    cursor.execute('select * from skills')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response
