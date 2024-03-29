from flask import Flask, render_template, jsonify, request, redirect, url_for, session, send_from_directory
from flask_mysqldb import MySQL
import json
import os

app = Flask(__name__, static_folder='static')
app.secret_key = 'teams'
# MySQL database configuration
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'quiz_web'

# Initialize MySQL
mysql = MySQL(app)

@app.route('/')
def login():
    return render_template('login.html')

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        fullname = request.form['fullname']
        email = request.form['email']
        password = request.form['password']
        
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO users (username, fullname, email, password) VALUES (%s, %s, %s, %s)", (username, fullname, email, password))
        mysql.connection.commit()
        cur.close()

        return 'Success'
    
    return render_template('register.html')

@app.route('/login', methods=['POST'])
def login_user():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM users WHERE username = %s AND password = %s", (username, password))
        user = cur.fetchone()
        cur.close()

        if user:
            return redirect('/category')  # Redirect to the category page
        else:
            return 'Wrong Username'
@app.route('/Teams', methods=['GET', 'POST'])
def Teams():
    try:
        cur = mysql.connection.cursor()

        if request.method == 'POST':
            # Get the submitted answer
            selected_answer = request.form.get('answer')

            # Retrieve the current question index from session
            question_index = session.get('question_index', 0)

            # Retrieve the questions from session
            questions = session.get('questions', [])

            # Update the answer for the current question
            questions[question_index]['selected_answer'] = selected_answer

            # Increment the question index
            question_index += 1

            # Store the updated values in session
            session['question_index'] = question_index
            session['questions'] = questions

            if question_index >= len(questions):
                # All questions answered, reset the question index to zero
                question_index = 0

                # Store the updated question index in session
                session['question_index'] = question_index

                # Redirect to the result page
                return redirect('/result')

            # Redirect to the next question
            return redirect('/Teams')

        else:
            # Fetch the questions from the database if it's the first question
            if 'questions' not in session:
                # Fetch the questions from the database
                sql = "SELECT id, question FROM quiz WHERE category_list_id = 2"
                cur.execute(sql)
                questions = []

                for row in cur.fetchall():
                    question_id = row[0]
                    question_text = row[1]

                    question = {
                        'id': question_id,
                        'question': question_text,
                        'choices': [],
                        'answer': '',
                        'selected_answer': ''
                    }

                    questions.append(question)

                # Set the initial question index
                question_index = 0

                session['question_index'] = question_index
                session['questions'] = questions

            else:
                # Retrieve the current question index and questions from session
                question_index = session.get('question_index', 0)
                questions = session.get('questions', [])

            # Check if the question_index is valid
            if question_index >= len(questions):
                # Invalid index, redirect to an error page or handle the error appropriately
                return render_template('error.html', message='Invalid question index')

            # Fetch choices for the current question
            question = questions[question_index]
            choices_sql = "SELECT choice_1, choice_2, choice_3, choice_4 FROM quiz WHERE id = %s "
            cur.execute(choices_sql, (question['id'],))
            choices_row = cur.fetchone()

            # Extract choices from the row
            choices = [choices_row[0], choices_row[1], choices_row[2], choices_row[3]]

            # Update the choices and answer for the current question
            question['choices'] = choices
            question['answer'] = choices_row[0]  # Assuming choice_1 is the correct answer

            cur.close()

            # Check if it's the last question
            if question_index + 1 == len(questions):
                # Render the last questionApologies for the incomplete response. Here's the continuation of the code:
                return render_template('Teams.html', question=question, is_last=True)

            # Render the current question
            return render_template('Teams.html', question=question)

    except Exception as e:
        return jsonify({'error': str(e)})

    
    
@app.route('/Leagues', methods=['GET', 'POST'])
def Leagues():
    try:
        cur = mysql.connection.cursor()

        if request.method == 'POST':
            # Get the submitted answer
            selected_answer = request.form.get('answer')

            # Retrieve the current question index from session
            question_index = session.get('question_index', 0)

            # Retrieve the questions from session
            questions = session.get('questions', [])

            # Update the answer for the current question
            questions[question_index]['selected_answer'] = selected_answer

            # Increment the question index
            question_index += 1

            # Store the updated values in session
            session['question_index'] = question_index
            session['questions'] = questions

            if question_index >= len(questions):
                # All questions answered, reset the question index to zero
                question_index = 0

                # Store the updated question index in session
                session['question_index'] = question_index

                # Redirect to the result page
                return redirect('/result')

            # Redirect to the next question
            return redirect('/Leagues')

        else:
            # Fetch the questions from the database if it's the first question
            if 'questions' not in session:
                # Fetch the questions from the database
                sql = "SELECT id, question FROM quiz WHERE category_list_id = 2"
                cur.execute(sql)
                questions = []

                for row in cur.fetchall():
                    question_id = row[0]
                    question_text = row[1]

                    question = {
                        'id': question_id,
                        'question': question_text,
                        'choices': [],
                        'answer': '',
                        'selected_answer': ''
                    }

                    questions.append(question)

                # Set the initial question index
                question_index = 0

                session['question_index'] = question_index
                session['questions'] = questions

            else:
                # Retrieve the current question index and questions from session
                question_index = session.get('question_index', 0)
                questions = session.get('questions', [])

            # Check if the question_index is valid
            if question_index >= len(questions):
                # Invalid index, redirect to an error page or handle the error appropriately
                return render_template('error.html', message='Invalid question index')

            # Fetch choices for the current question
            question = questions[question_index]
            choices_sql = "SELECT choice_1, choice_2, choice_3, choice_4 FROM quiz WHERE id = %s "
            cur.execute(choices_sql, (question['id'],))
            choices_row = cur.fetchone()

            # Extract choices from the row
            choices = [choices_row[0], choices_row[1], choices_row[2], choices_row[3]]

            # Update the choices and answer for the current question
            question['choices'] = choices
            question['answer'] = choices_row[0]  # Assuming choice_1 is the correct answer

            cur.close()

            # Check if it's the last question
            if question_index + 1 == len(questions):
                # Render the last questionApologies for the incomplete response. Here's the continuation of the code:
                return render_template('Leagues.html', question=question, is_last=True)

            # Render the current question
            return render_template('Leagues.html', question=question)

    except Exception as e:
        return jsonify({'error': str(e)})

@app.route('/Players', methods=['GET', 'POST'])
def Players():
    try:
        cur = mysql.connection.cursor()

        if request.method == 'POST':
            # Get the submitted answer
            selected_answer = request.form.get('answer')

            # Retrieve the current question index from session
            question_index = session.get('question_index', 0)

            # Retrieve the questions from session
            questions = session.get('questions', [])

            # Update the answer for the current question
            questions[question_index]['selected_answer'] = selected_answer

            # Increment the question index
            question_index += 1

            # Store the updated values in session
            session['question_index'] = question_index
            session['questions'] = questions

            if question_index >= len(questions):
                # All questions answered, reset the question index to zero
                question_index = 0

                # Store the updated question index in session
                session['question_index'] = question_index

                # Redirect to the result page
                return redirect('/result')

            # Redirect to the next question
            return redirect('/Players')

        else:
            # Fetch the questions from the database if it's the first question
            if 'questions' not in session:
                # Fetch the questions from the database
                sql = "SELECT id, question FROM quiz WHERE category_list_id = 3"
                cur.execute(sql)
                questions = []

                for row in cur.fetchall():
                    question_id = row[0]
                    question_text = row[1]

                    question = {
                        'id': question_id,
                        'question': question_text,
                        'choices': [],
                        'answer': '',
                        'selected_answer': ''
                    }

                    questions.append(question)

                # Set the initial question index
                question_index = 0

                session['question_index'] = question_index
                session['questions'] = questions

            else:
                # Retrieve the current question index and questions from session
                question_index = session.get('question_index', 0)
                questions = session.get('questions', [])

            # Check if the question_index is valid
            if question_index >= len(questions):
                # Invalid index, redirect to an error page or handle the error appropriately
                return render_template('error.html', message='Invalid question index')

            # Fetch choices for the current question
            question = questions[question_index]
            choices_sql = "SELECT choice_1, choice_2, choice_3, choice_4 FROM quiz WHERE id = %s "
            cur.execute(choices_sql, (question['id'],))
            choices_row = cur.fetchone()

            # Extract choices from the row
            choices = [choices_row[0], choices_row[1], choices_row[2], choices_row[3]]

            # Update the choices and answer for the current question
            question['choices'] = choices
            question['answer'] = choices_row[0]  # Assuming choice_1 is the correct answer

            cur.close()

            # Check if it's the last question
            if question_index + 1 == len(questions):
                # Render the last questionApologies for the incomplete response. Here's the continuation of the code:
                return render_template('Players.html', question=question, is_last=True)

            # Render the current question
            return render_template('Players.html', question=question)

    except Exception as e:
        return jsonify({'error': str(e)})

@app.route('/category')
def category():
    return render_template('category.html')

@app.route('/result')
def result():
    try:
        cur = mysql.connection.cursor()

        # Retrieve the questions from session
        questions = session.get('questions', [])

        # Calculate the score
        score = 0
        for question in questions:
            if question['selected_answer'] == question['answer']:
                score += 1

        # Render the result template with the score
        return render_template('result.html', score=score)

    except Exception as e:
        return jsonify({'error': str(e)})
        
if __name__ == '__main__':
    app.run(debug=True)