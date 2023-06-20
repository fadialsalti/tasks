# Project Title: Task Manager Web Application

This project is a web application designed to manage tasks. It includes both the backend API and the frontend UI, allowing users to create tasks, list open and closed tasks, and close tasks. The application is built using modern tools and leverages serverless technologies to eliminate the need for server management.

## Features

- Create a task: Users can create new tasks and add them to the task list.
- List open tasks: The application provides a view to display all open tasks.
- List closed tasks: Users can view a list of closed tasks.
- Close a task: Users have the ability to mark tasks as closed.

## Technologies Used

The project incorporates the following technologies and services:

- **FastAPI**: The backend API framework running on AWS Lambda and API Gateway.
- **Vue**: The frontend framework served from S3 via CloudFront.
- **DynamoDB**: The primary database for storing task data using a single table design.
- **Cognito**: Handles user authentication for both the APIs and Vue applications.
- **CloudWatch**: Monitors the application for effective performance monitoring.
- **CloudFormation**: Manages CloudFront, Route53, and CloudWatch using infrastructure as code.
- **Poetry**: Used as the package manager for the project.
- **CI/CD Pipeline**: Implements continuous integration and deployment pipelines for maintaining high code quality and running tests.

## Course Overview

The course provides a comprehensive guide to building a serverless web application using modern tools and services. It covers various aspects, including setting up a git repository, building the API, implementing CI/CD, designing the DynamoDB data model, integrating Cognito for authentication, building the Vue frontend, monitoring the application, and deploying new versions.

The course focuses on leveraging serverless technologies to build a scalable and secure application without the need to manage servers. The use of free-tier AWS services ensures cost-effectiveness, and the course also emphasizes Test-driven Development practices and setting up a CI/CD pipeline.

## Learning Outcomes

Upon completing this project, you will gain the following skills and knowledge:

- Create and manage DynamoDB tables using Serverless.
- Utilize DynamoDB as the primary database, employing the single table design pattern.
- Deploy FastAPI applications to AWS Lambda + API Gateway.
- Manage CloudFront, Route53, and CloudWatch using CloudFormation.
- Implement Cognito for authentication in APIs and Vue applications.
- Deploy and serve Vue applications from an S3 bucket via CloudFront.
- Separate business models from the database structure.
- Maintain high code quality using tools and pipeline jobs.
- Run tests within pipelines.
- Use Poetry as the package manager.
- Monitor applications effectively.
- Test applications using DynamoDB.

## Acknowledgement
The amazing course by Testdriven.io "Serverless Apps with FastAPI, DynamoDB, and Vue"
