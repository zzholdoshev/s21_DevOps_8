## Part 1. Remote node configuration via Ansible
* Create three machines using Vagrant - manager, node01, node02. Using Vagrantfile created by `vagrant init` command
* Prepare manager as a workstation for remote configuration. SSH into manager node:
![](./images/part1_1.png)
* Generate SSH key and check the connection to node01 via ssh on a private network:
![](./images/part1_2.png)
* Copy the docker-compose file and the source code of the microservices to the manager. 
* Install ansible on the manager
* Use the ping module to check the connection via Ansible:
![](./images/part1_3.png)
* Write the first playbook for Ansible that performs apt update, installs docker, docker-compose, copies the compose file from the manager and deploys the microservice application:
![](./images/part1_4.png)
* Run the ansible playbook:
![](./images/part1_5.png)
* Run postman tests: \
![](./images/postman.png)
* Form three roles:
the application role performs the deployment of a microservice application using docker-compose,
apache installs and runs the standard apache server
postgres installs and runs postgres, creates a database with an arbitrary table and adds three arbitrary records to it.
Assign the first role to node01 and the second two roles to node02, check the functionality of the microservices application with postman tests, make sure that postgres and the apache server are available. For Apache, a web page should open in the browser. As for PostgreSQL, you need to connect from the local machine and display the contents of the previously created table with data:

![](./images/part1_6.png)
![](./images/part1_7.png)
![](./images/part1_8.png)
![](./images/postman.png)

## Part 2. Service Discovery
* Write two configuration files for consul
![](./images/part2_1.png)
* Create three [four???? it's unclear, i created 4] machines using Vagrant - consul_server, api, manager and db.
![](./images/part2_2.png)
* Write a playbook for ansible and four roles:
install_consul_server
install_consul_client
install_db
install_hotels_service
* running install_consul_server:
![](./images/part2_3.png)
* running install_consul_client:
![](./images/part2_4.png)
* Ensure consul agents and server works:
![](./images/part2_5.png)
![](./images/part2_6.png)
* Envoy proxy is created by adding systemd service in ansible task, some people used consul sidecar proxy, this is not correct. Ensure proxy is working:
![](./images/part2_7.png)
* running install_db task:
![](./images/part2_8.png)
* ensure the task completed successfully and the database is present:
![](./images/part2_9.png)
* running install_hotels_service task:
![](./images/part2_10.png)
* Ensure the api is working:
![](./images/part2_11.png)
* Check the functionality of CRUD operations on hotel service using http requests:
![](./images/part2_12.png)
![](./images/part2_13.png)
* PUT and DELETE method don't work correctly, the problem is in the api:
![](./images/part2_14.png)



