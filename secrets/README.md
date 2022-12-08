# Password secrets for MySQL

# ADD BASIC TEAM INFOMRATION
# ADD A BLURB about what the project is about
# grab screenshots and put in in the readme
# include details ahout how to do docker 

You should never store passwords in a file that will be pushed to github or any other cloud-hosted system.  You'll notice that in the .gitignore, two files from this folder are indeed ignored.  

In this folder, you'll need to create two files:

- `db_password.txt`
  - in this file, put a password that will be used for the webapp user
- `db_root_password.txt`
  - in this file, put the password you want to use for the root user (superuser) of mysql. 