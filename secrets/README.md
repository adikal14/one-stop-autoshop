One-Stop Autoshop
Members: Arielle Greenberg, Simone Ritcheson, Aditya Kalia

Welcome to One-Stop Autoshop, an app where customers can post detailed reviews about autoshops and mechanics near them and the services their vehicle received. Users can utilize the app to read reviews of autoshops and mechanics in their area, and find mechanics near them who specialize in the services they need. 

To see a demo of our app, watch this video: https://youtu.be/L44sROwWVRE (tip: put the video at 1.25 speed)

Our project is connected to port 8001. Ensure when doing the ngrok link you are writing './ngrok http 8001'

Due to the limited nature of the data in our database, we have written a user-friendly guide to exploring our app. We included default values in all the text boxes, but this guide includes some additional example inputs you can enter into the tables to see how the app works. 
NOTE: If this app were truly being used by the public, we obviously would not have a default value for ID's on each profile page. However, we thought it be best we include it for this project to make it more user-friendly as the data in the database is limited. 
      HOME PAGE: 
            * 'Input your zipcode to see autoshops near you'
                  * 22046, 33456, 09876, 12567, 87623
            * 'Input your zipcode to see revies from customers near you'
                  * 10444, 19444, 19428, 23046
            * 'Input your zipcode to see mechanics and their skills near you'
                  * 12567, 87623, 65439, 53012
      CUSTOMER PROFILE PAGE:
            * 'Input your cust_ID'
                  * Any number between 1-20
      CUSTOMER REVIEW PAGE: 
            * cust_ID : between 1-20
            * mech_ID : between 101-120
            * Duration, price paid, star rating: any float
      MECHANIC PAGES (PROFILE AND SKILLS PAGE): 
            * 'Input your mechanic ID'
                  * Any number between 101-120
            * 'Input your skill ID'
                  * Any number above 101:
                      * We suggest you try 105, 106, 107, etc.
      MANAGER PROFILE PAGE:
            * 'Input your manager ID'
                  * Any number between 41-60
                
