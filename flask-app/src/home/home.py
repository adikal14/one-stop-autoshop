from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db

home = Blueprint('home', __name__)

#get autoshops near you
@home.route('/home/autoshops/<postalcode>', methods=['GET'])
def get_autobody(postalcode):
    cursor = db.get_db().cursor()
    cursor.execute('select * from autoshop where postalcode = {0}'.format(postalcode))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

#get reviews near you
@home.route('/home/reviews/<postalcode>', methods=['GET'])
def get_reviews(postalcode):
    cursor = db.get_db().cursor()
    cursor.execute('select a.name, m.first_name, m.last_name, r.duration, r.price_paid, r.star_rating, r.review_description from reviews r join mechanic m join customer c join autoshop a where m.autoid = a.auto_ID and r.customer_ID = c.cust_ID and r.mechanic_ID = m.mechanic_ID and c.zip_code= {0}'.format(postalcode))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

#get mechanics and their skills near you
@home.route('/home/mechskills/<postalcode>', methods=['GET'])
def get_skills_near_you(postalcode):
    cursor = db.get_db().cursor()
    cursor.execute('select a.name, m.first_name, m.last_name, s.description, s.price, s.duration from autoshop a join mechanic m join skills s join mechanic_skills ms where m.autoid = a.auto_ID and ms.mechanic_ID = m.mechanic_ID and ms.skill_ID = s.skill_ID and a.postalcode = {0}'.format(postalcode))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response