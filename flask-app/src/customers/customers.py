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


@customers.route('/customers/add_review/customer_ID/repair_ID/mechanic_ID/duration/price_paid/star_rating/review_description', methods=['POST'])
def add_review(customer_ID, repair_ID, mechanic_ID, duration, price_paid, star_rating, review_description):
    cursor = db.get_db().cursor()
    cursor.execute = f'INSERT INTO reviews (customer_ID {customer_ID}, repair_ID {repair_ID}, mechanic_ID {mechanic_ID}, duration {duration}, price_paid {price_paid}), star_rating{star_rating}, review_description{review_description}'
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

#do a post request to add a vehicle
#insert ngrok link, change method to POST, go to body, make sure it says "muli-part form"
#insert as keys what the input things are in your input thing
##{{variablename.inputText}} in the value (you'll see the variable name to the right of the widget)
#this allows you to bind the query to those particular attributes
#go back to homepage, click on submit button, to the right there's something that says "on click", select "execute a query", and select the query you want to run
#select onsuccess, you can do "show message"
#on air, show message
#make the attributes that the customer isn't actually entering auto increment


