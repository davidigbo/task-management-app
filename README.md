<a name="readme-top"></a>

<div align="center">
 <h1>Task Management System</h1>
</div>

📗 Table of Contents

- [📖 \Task-Management-App\] ](#-student_dashboard_api-)
  - [🛠 Built With ](#-built-with-)
    - [Tech Stack ](#tech-stack-)
    - [Key Features ](#key-features-)
  - [💻 Getting Started ](#-getting-started-)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Install](#install)
  - [Database Setup](#database-setup)
  - [👥 Authors ](#-authors-)
  - [🔭 Future Features ](#-future-features-)
  - [🤝 Contributing ](#-contributing-)
  - [⭐️ Show your support ](#️-show-your-support-)
  - [🙏 Acknowledgments ](#-acknowledgments-)
  - [📝 License ](#-license-)
   - [📝 Api Documentation ](#-api-documentation-)

<!-- PROJECT DESCRIPTION -->

# 📖 [task-management-app] <a name="about-project"></a>

The task management API provides a RESTful interface for managing tasks within an application. Users can perform various operations on tasks, including creating, reading, updating, and deleting tasks. The API supports user authentication using JWT tokens to ensure secure access to task data. Tasks are stored in a database, and input data is validated to maintain data integrity and security. The API facilitates seamless integration with client applications, enabling users to efficiently organize and track their tasks.
## 🛠 Built With <a name="built-with"></a>

<details>
  <summary>Client</summary>
  <ul>
    <li><p> <b>Ruby on Rails: </b></p></li>
  </ul>
</details>

### Tech Stack <a name="tech-stack"></a>

<summary>Ruby on Rails</summary>
  <ul>
    <li><a href="https://guides.rubyonrails.org">Ruby on Rails</a></li>
  </ul>
</details>

### Key Features <a name="key-features"></a>

- **[user authentication]**
- **[api for student information]**



<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 💻 Getting Started <a name="getting-started"></a>

Before you begin, ensure you have the following:

### Prerequisites

- Ruby (version 3.2.2)
- Ruby on Rails (version 7.0.8)
- PostgreSQL 
- Git
- Postman

### Install

Follow these steps to install and configure the student_dashboard_api Rails App:

## Clone this repository to your local machine:
 - git clone git@github.com:david30-maker/task-management-app.git
 ## Navigate to the project directory:
 - cd task-management-api
## Install the required Ruby gems:
- bundle install

## Create and configure your database:

- rails db:create
- rails db:migrate
- rails db:seed

## Start the Rails server:
- rails server

## 👥 Author <a name="authors"></a>

👤 **Okpah Igbo**

- GitHub: [@david30-maker](https://github.com/david30-maker)
- Twitter: [@davidigbo1](https://twitter.com/davidigbo1)
- LinkedIn: [davidigbo/](https://www.linkedin.com/in/davidigbo/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🔭 Future Features <a name="future-features"></a>

- **Department Api**

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## ⭐️ Show your support <a name="support"></a>

Give a start ⭐️ If you like this project...

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>
Special thanks to TechProsNG for this opportunity

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 📝 Api Documentation <a name="api"></a>

Now the server is running you can start to query the endpoints in the API.


To Sign up a user , send a POST request to the following endpoint;

`http://localhost:3000/signup`

The body of the Json will be

```json
    {
    "user": {
        "email": "david@gmail.com",
        "password": "1234567",
        "name": "Dave"
    }
}
```

If you do this right , you will get a response of the created user
```json 
    {
    "status": {
        "code": 200,
        "message": "Signed up successfully."
    },
    "data": {
        "id": 6,
        "email": "david@gmail.com",
        "name": "Dave"
    }
        "token": "eyJhbG*********************************************************nRVvhI" 
    }
```


If you do this wrong , you will get an error message of the error
```json
    { 
        "error": "User couldn't be created successfully" 
    }
```

## Get current user - using JWT token

Now let us see how we will use this jwt token to get the current user .
We will get this token from the response header after signing up and use it in the header of the GET request to the `http://localhost:3001/api/v1/users` endpoint to get the current user .


After signing up;

    Copy the token in the response body of the previous successful request

Send a GET request to the following endpoint to get details on the signed up user
`http://localhost:3000/signup`

On the headers for the request add  `Authorization` using the keyword `Bearer` , followed by the token you got upon signing up
The Authorization Header should look like this
```json
    "Authorization": "Bearer eyJhbG*********************************************************nRVvhI"  
```
We will get this as the response body
 
```json
     {
    "status": {
        "code": 200,
        "message": "Signed up successfully."
    },
    "data": {
        "id": 6,
        "email": "david@gmail.com",
        "name": "Dave"
    }
}
```


To handle login , send a POST request to the following endpoint

```http://localhost:3000/login```

and the body below

```json
   {
    "user": {
        "email": "david@gmail.com",
        "password": "1234567"
    }
}
```

We get this as the response body

```json
    {
    "status": {
        "code": 200,
        "message": "Logged in successfully.",
        "data": {
            "user": {
                "id": 6,
                "email": "david@gmail.com",
                "name": "Dave"
            }
        }
    }
            "token": "eyJhbG*********************************************************nRVvhI"  
    }
```
If you do this wrong , you will get an error message of the error
```json
    { 
        "error": "Logged in was not successfully" 
    }
```

To handle course api, send a POST request to the following endpoint

```http://localhost:3000/api/v1/tasks```
and the body below
```json
 {
    "course": {
        "name": "Programming",
        "description": "to build computer applications"
    }
}
```
We get this as the response body

```json
    {
    "id":2,"name":"Programming",
    "description":"to build computer applications",
    "created_at":"2023-11-03T08:13:16.530Z",
    "updated_at":"2023-11-03T08:13:16.530Z"
    }
```
To handle enrollment api, send a POST request to the following endpoint

```http://localhost:3001/api/v1/enrollments```
and the body below
```json
{
    "enrollment": {
        "user_id": 3,
        "course_id": 2
    }
}
```
We get this as the response body

```json
    {
    "id": 2,
    "user_id": 3,
    "course_id": 2,
    "created_at": "2023-11-03T08:28:15.814Z",
    "updated_at": "2023-11-03T08:28:15.814Z"
}
```

We can now use this profile to get the current user by sending a GET request to `http://localhost:3001/api/v1/users` with this token in the Authorization header to get the current user. 