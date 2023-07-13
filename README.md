Scissor API - Documentation

API Overview.

Scissor is a simple tool which makes URLs as short as possible. : Its implemented in REST. The APIs allow users to create a short link for a url as well as resolve it. The APIs also allow users to perform account-related operations such as creating a new account, logging in with existing credentials, and logging out of the current session.

Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

Prerequisites
ruby
rails
psql

##Setting up locally
Step 1: Clone the repository
git clone https://github.com/kwamebio/Scissors.git

Step 2: Install gems
bundle install

Step 3: Create and Migrate your database
rails db:create
rails db:migrate

Scissors
The REST API follows a traditional RESTful architecture and uses HTTP verbs to interact with resources. It supports the following endpoints:


GET

Response
200 - Ok

View all users
http://localhost:3000/users

POST

Response
201 - Created

User sign_up
http://localhost:3000/users
Create new User

Body
raw (json)
json
{
    "first_name": "kofi",
    "last_name": "manu",
    "email": "kwame123@yahoo.com",
    "phone": "123432535",
    "password": "kwame12345",
    "password_confirmation": "kwame12345"
}

POST

Response
200 - Ok

user login
http://localhost:3000/login
User sign-in

Body
raw (json)
json
{
    "email": "kwame123@yahoo.com",
    "password": "kwame12345"
}

PUT

Response
200 - Ok

Update User
http://localhost:3000/users/2
Update User Details

Body
raw (json)
json
{
    "first_name": "kofi",
    "last_name": "agyemang",
    "email": "kwame123@yahoo.com",
    "phone": "123432535",
    "password": "kwame12345",
    "password_confirmation": "kwame12345"
}

DELETE

Response
204 - No Content

Delete User
http://localhost:3000/users/2
Provide the user id of the user you want to delete.

POST

Response
201 - Created

ShortUrl Generator
http://localhost:3000/scissor
Input your long URL to generate short url

Body
raw (json)
json
{
    "original_url": "www.wrestlemania25.com"
}
