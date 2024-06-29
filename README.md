# aws-labs
AWS Demos

## S3 creation 

 sudo -i
pip install python-dotenv
 pip install Flask psycopg2-binary

  1  mkdir user_info_app
    2  cd user_info_app
  mkdir templates
   
    5  vi app.py
    6  
    7  vi templates/index.html
    8  vi app.py 
    9  python app.py
   10  sudo yum update
   11  sudo yum install python3
   12  python3 app.py
   13  vi app.py 
   14  python3 app.py
   15  vi app.py 
   16  python3 app.py
   17  ls
   18  cd user_info_app/
   19  python3 app.py
   20  vi app.py 
   21  python3 app.py
   22  vi templates/index.html 
   23  vi app.py 
   24  python3 app.py
   25  from dotenv import load_dotenv
   26  
   28
   30  cat app.py 
   31  clear
   32  cat app.py 
   33  cat templates/index.html 
   34  clear
   35  cat templates/index.html 
   36  history

   create a sample python application for collecting user information, and  store it in database 
i will be using a database from aws rds, i have public ip enabled for the ec2,  I will be accessing this app on internet on port 5000, create a table called user if not exists  and also add color to the index.html and after the data entered, it should get a pop up or confirmation if its gets written into db or not, create separate endpoint in the application, to retrieve the data, like /data should show all stored data 