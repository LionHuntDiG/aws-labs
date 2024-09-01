# aws-labs
AWS Demos

## S3 creation 


{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::<bucket-name>/*"
        }
    ]
}

## RDS-Demo
create a sample python application for collecting user information, and  store it in database 
i will be using a database from aws rds, i have public ip enabled for the ec2,  I will be accessing this app on internet on port 5000, create a table called user if not exists  and also add color to the index.html and after the data entered, it should get a pop up or confirmation if its gets written into db or not, create separate endpoint in the application, to retrieve the data, like /data should show all stored data 


sudo -i
pip install python-dotenv
pip install Flask psycopg2-binary
mkdir rds-demo
cd rds-demo
mkdir templates
vi app.py   # add app.py content and update DB connection details
vi templates/index.html  #add index.html content
vi templates/requirements.txt  # add requirements.txt content
pip install -r templates/requirements.txt
nohup python3 app.py &
#from dotenv import load_dotenv


Install psql on the host:
sudo yum install -y postgresql15

connect: 
psql -h database-1.czomwkg6a2em.ap-south-1.rds.amazonaws.com -U postgres -d postgres

Check the db's
\l

switch to db: 
\c postgres

List the tables:
\dt

Check the Data:
SELECT * FROM users;
