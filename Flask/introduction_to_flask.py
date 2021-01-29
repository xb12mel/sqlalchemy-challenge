# 1. import Flask
from flask import Flask, jsonify

# 2. Create an app, being sure to pass __name__
app = Flask(__name__)

#2.5  Give the page some data
hello_dict = {"Hello": "Baby!"}

# 3. Define what to do when a user hits the index route
@app.route("/")
def home():
    print("Server received request for 'Home' page...")
    return "Welcome to my 'Home' page!"

@app.route("/normal")
def normal():
    return hello_dict

@app.route("/jsonified")
def jsonified():
    return jsonify(hello_dict)

# 4. Define what to do when a user hits the /about route
@app.route("/about")
def about():
    name = "XB12Mel"
    location = "Hampton Roads, VA"
    print("Server received request for 'About' page...")
    return f"My name is {name}, and I live in {location}."

@app.route("/contact")
def contact():
    email = "xb12mel@gmail.com"
    print("Server received request for 'Email' address ...")
    return f"Feel free to email me at <a href='mailto:{email}'>{email}</a> to request a quotation."

if __name__ == "__main__":
    app.run(debug=True)

