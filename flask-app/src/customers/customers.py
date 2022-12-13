from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db


customers = Blueprint('customers', __name__)


# Get user information for customer with particular userID
@customers.route('/customers/profile/<userID>', methods=['GET'])
def get_profile(userID):
    cursor = db.get_db().cursor()
    cursor.execute('select first_name, last_name, cust_ID, zip_code from customer where cust_ID = {0}'.format(userID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

#get account information for customer with particular userID
@customers.route('/customers/account/<userID>', methods=['GET'])
def get_account(userID):
    cursor = db.get_db().cursor()
    query = 'select a.username, a.account_ID, a.age_of_account from account a join customer c where c.a_ID = a.account_ID and c.cust_ID = {0}'.format(userID)
    current_app.logger.info(query)
    # cursor.execute('select a.username, a.account_ID, a.age_of_account from account a join customer c where c.a_ID = a.acount_ID and where c.cust_ID = {0}'.format(userID))
    cursor.execute(query)
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

#get vehicle information from a customer with a particular customer_ID
@customers.route('/customers/vehicle/<userID>', methods=['GET'])
def get_vehicle(userID):
    cursor = db.get_db().cursor()
    cursor.execute('select c.make, c.model, c.car_year, c.vin_num from cars c where c.cust_ID = {0}'.format(userID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


#get past reviews from a customer with a particular ID
@customers.route('/customers/reviews/<userID>', methods=['GET'])
def get_reviews(userID):
    cursor = db.get_db().cursor()
    cursor.execute('select r.duration, r.price_paid, r.star_rating, r.review_description from reviews r where r.customer_ID = {0}'.format(userID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


@customers.route('/customers/form', methods=['POST'])
def add_review():
    #customer_ID, repair_ID, mechanic_ID, duration, price_paid, star_rating, review_description
    customer_ID = request.form['customer_ID']
    repair_ID = request.form['repair_ID']
    mechanic_ID = request.form['mechanic_ID']
    duration = request.form['duration']
    price_paid = request.form['price_paid']
    star_rating = request.form['star_rating']
    review_description = request.form['review_description']
    
    cursor = db.get_db().cursor()
    cursor.execute(f'INSERT INTO reviews (customer_ID, repair_ID, mechanic_ID, duration, price_paid, star_rating, review_description) VALUES ({customer_ID}, {repair_ID}, {mechanic_ID}, {duration}, {price_paid}, {star_rating}, "{review_description}");')
    cursor.connection.commit()
    return get_all()

@customers.route('/customers/all_reviews', methods=['GET'])
def get_all():
    cursor = db.get_db().cursor()
    cursor.execute('select * from reviews')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

