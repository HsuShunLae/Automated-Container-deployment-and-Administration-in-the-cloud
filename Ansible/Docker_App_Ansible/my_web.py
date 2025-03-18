from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return '''
        <!DOCTYPE html>
        <html lang="en">
            <head>
                <title>My Simple Web Application</title>
            </head>
            <body>
                <h1 align="center">Hello Everyone !!!</h1>
                <p>Welcome to DBS!!!!!</p>
            </body>
        </html>
    '''

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)