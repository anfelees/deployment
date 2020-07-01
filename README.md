# Coding challenge

This document contains information related to the implementation of 3 microservices that implement a small API of CHECKOUT

## Projects
* **checkout** - It is the main project, runs the main flow, calls the other services and saves the order and its. products in the database
* **bill** - Contains a single rest service whose function is to calculate the sum of the products.
* **logistic** - Contains a rest service that creates a send order.
* **deployment** - Contains configuration files that install and run the application in docker

## Git epositories

* **checkout** - https://github.com/anfelees/checkout.git
* **bill** - https://github.com/anfelees/bill.git
* **logistic** - https://github.com/anfelees/logistic.git
* **deployment** - https://github.com/anfelees/deployment.git
All files are in the develop branch

## Technical requirements
First of all these applications were made on a Linux environment (Ubuntu 20.04), but it is not necessary to use the same OS to install the application. For its instalation and execution the following tools are required:
1. Docker. See https://docs.docker.com/engine/install/ubuntu/
2. Docker compose. See https://docs.docker.com/compose/install/
3. Amazoncorreto 11 (Java 11): https://docs.aws.amazon.com/corretto/latest/corretto-11-ug/generic-linux-install.html. You can also use another java distribution like OpenJDK or Oracle.
4. bash. Only if you want to install the application using sh command.

## Instalation
First of all clone all repositories and make sure that the git repositories folders of the projects are at the same level: Like this:
```sh
./folder/checkout/Dockerfile
./folder/bill/Dockerfile
./folder/logistic/Dockerfile
./folder/deploy/docker-compose.yml
```
##### Manual Instalation
Run the following commands. Keep folders in mind
```sh
./folder/checkout/ sh gradlew clean
./folder/checkout/ sh gradlew build
./folder/bill/ sh gradlew clean
./folder/bill/ sh gradlew build
./folder/logistic/ sh gradlew clean
./folder/logistic/ sh gradlew build
./folder/deploy/ docker-compose build
./folder/deploy/ docker-compose up
```
##### Using bash script
Run the following command. Keep folder in mind
```sh
./folder/deploy/ sh runApp.sh
```
##### Port configuration
You can modify the ports used to access the installed services. By default port 8081 is exposed to access the api rest and port 5432 to access the database. Check the file ./folder/docker-compose.yml

# Verify installation
You can see the containers running in docker using:
```sh
docker ps
```
Once the command is executed, you should see the following images:
- docker-compose_bill-service
- docker-compose_checkout-service
- docker-compose_logistic-service
- docker-compose_db-service

Also you can access the rest api at the address http://localhost:8081/checkout/order [POST] sending the following request:
```sh
{
    "clientId": 1,
    "date": "2020-06-28T00:00:00",
    "direction": "shomewhere",
    "products": [
        { 
            "id": 123,
            "quantity": 1,
            "cost": 32000
        }
    ]
}
```
If everything is ok then you will get following answer
```sh
{
    "success": true,
    "message": "ok"
}
```
##### Check postgress database
You can enter the databases and verify that information has been saved there.
```sh
Host: localhost
Port: 5432
Database: checkout
Username: postgres
Password: mysecretpassword
```

```sh
Host: localhost
Port: 5432
Database: logistic
Username: postgres
Password: mysecretpassword
```
# Technologies and tools used
- **spring-boot-starter-webflu:** Technology used to create reactive services. Through this you can optimize the use of the processor and improve the concurrency of the application.
- **spring-cloud-starter-netflix-hystrix:** Provides an implementation of the circuit breaker pattern. Allows isolating services and defining alternate flows of execution in case of errors.
- **spring-boot-starter-validation:** For checking input data.
- **spring-boot-starter-data-r2dbc:** Allows to execute operations on the database reactively. 
- **r2dbc-postgresql:** Driver that allows non-blocking communication with the postgres database.
- **reactor-spring:** Implementation of Project Reactor that allows to use the observer pattern.
- **spring-boot-starter-test:** Allows to execute unit tests.
- **org.projectlombok:**: It allows to decrease the written code through annotations that automatically generate access methods to POJOs.
- **gradle:** Dependency management tool that also allows you to compile and package the application.

# OpenApi
The documentation for the rest services is prepared under the OpenApi 3.0 standard. To access it you must enter the "docs" folder of each repository.