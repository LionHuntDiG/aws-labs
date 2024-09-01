from flask import Flask, render_template, request, jsonify
import psycopg2
import os
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

app = Flask(__name__)

# Database connection details from environment variables
DB_HOST = "database-1.czomwkg6a2em.ap-south-1.rds.amazonaws.com"
DB_NAME = "database-1"
DB_USER = "postgres"
DB_PASSWORD = "Shanmukha.123"

# Initialize the database
def init_db():
    try:
        with psycopg2.connect(
            host=DB_HOST,
            database=DB_NAME,
            user=DB_USER,
            password=DB_PASSWORD
        ) as conn:
            with conn.cursor() as cursor:
                cursor.execute('''
                    CREATE TABLE IF NOT EXISTS users (
                        id SERIAL PRIMARY KEY,
                        name VARCHAR(100) NOT NULL,
                        email VARCHAR(100) NOT NULL,
                        age INTEGER NOT NULL
                    )
                ''')
                conn.commit()
    except Exception as e:
        print(f"Error initializing the database: {e}")

# Route for the form
@app.route('/')
def index():
    return render_template('index.html')

# Route for handling form submission
@app.route('/submit', methods=['POST'])
def submit():
    try:
        name = request.form['name']
        email = request.form['email']
        age = request.form['age']

        with psycopg2.connect(
            host=DB_HOST,
            database=DB_NAME,
            user=DB_USER,
            password=DB_PASSWORD
        ) as conn:
            with conn.cursor() as cursor:
                cursor.execute('''
                    INSERT INTO users (name, email, age)
                    VALUES (%s, %s, %s)
                ''', (name, email, age))
                conn.commit()

        return jsonify({'success': True})
    except psycopg2.Error as db_error:
        return jsonify({'success': False, 'error': f"Database error: {db_error}"})
    except Exception as e:
        return jsonify({'success': False, 'error': str(e)})

# Route to retrieve all user data
@app.route('/data', methods=['GET'])
def get_data():
    try:
        with psycopg2.connect(
            host=DB_HOST,
            database=DB_NAME,
            user=DB_USER,
            password=DB_PASSWORD
        ) as conn:
            with conn.cursor() as cursor:
                cursor.execute('SELECT * FROM users')
                rows = cursor.fetchall()

        # Format data as JSON
        users = [{'id': row[0], 'name': row[1], 'email': row[2], 'age': row[3]} for row in rows]
        return jsonify(users)
    except psycopg2.Error as db_error:
        return jsonify({'success': False, 'error': f"Database error: {db_error}"})
    except Exception as e:
        return jsonify({'success': False, 'error': str(e)})

if __name__ == '__main__':
    init_db()
    app.run(debug=True, host='0.0.0.0', port=5000)
