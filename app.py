from flask import Flask, render_template, request, jsonify
import psycopg2
import os
from dotenv import load_dotenv

load_dotenv()

app = Flask(__name__)

# Database connection details
DB_HOST = os.getenv('DB_HOST')
DB_NAME = os.getenv('DB_NAME')
DB_USER = os.getenv('DB_USER')
DB_PASSWORD = os.getenv('DB_PASSWORD')

# Initialize the database
def init_db():
    conn = psycopg2.connect(
        host=DB_HOST,
        database=DB_NAME,
        user=DB_USER,
        password=DB_PASSWORD
    )
    cursor = conn.cursor()
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS users (
            id SERIAL PRIMARY KEY,
            name VARCHAR(100) NOT NULL,
            email VARCHAR(100) NOT NULL,
            age INTEGER NOT NULL
        )
    ''')
    conn.commit()
    cursor.close()
    conn.close()

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

        conn = psycopg2.connect(
            host=DB_HOST,
            database=DB_NAME,
            user=DB_USER,
            password=DB_PASSWORD
        )
        cursor = conn.cursor()
        cursor.execute('''
            INSERT INTO users (name, email, age)
            VALUES (%s, %s, %s)
        ''', (name, email, age))
        conn.commit()
        cursor.close()
        conn.close()

        return jsonify({'success': True})
    except Exception as e:
        return jsonify({'success': False, 'error': str(e)})

# Route to retrieve all user data
@app.route('/data', methods=['GET'])
def get_data():
    try:
        conn = psycopg2.connect(
            host=DB_HOST,
            database=DB_NAME,
            user=DB_USER,
            password=DB_PASSWORD
        )
        cursor = conn.cursor()
        cursor.execute('SELECT * FROM users')
        rows = cursor.fetchall()
        cursor.close()
        conn.close()

        # Format data as JSON
        users = []
        for row in rows:
            user = {
                'id': row[0],
                'name': row[1],
                'email': row[2],
                'age': row[3]
            }
            users.append(user)

        return jsonify(users)
    except Exception as e:
        return jsonify({'success': False, 'error': str(e)})

if __name__ == '__main__':
    init_db()
    app.run(debug=True, host='0.0.0.0', port=5000)
