# Jenkins
Setup Jenkins, configure docker container as Jenkins node, setup CICD, deploy apps to Kubernetes using Argo CD in GitOps way
Create EC2 Instance in AWS

**Install Jenkins**
Pre-requisites: Java

Install Java
```
sudo apt update
sudo apt install openjdk-17-jre
```
Verify Java is installed
```
java --version
```
Install Jenkins using below curl command
```
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins
```

**Note:** By default, Jenkins applicaion will not be accessible to the external world due to the inbound traffic restriction by AWS. Open port 8080 in the inbound traffic rules as show below.

EC2 Instance > Click on Security > Security groups
Add inbound traffic rules, just allow TCP port 8080, allow from My IP, In my case i have allowed Anywhere-IPV4
<img width="899" alt="image" src="https://github.com/user-attachments/assets/6d117126-f5c4-47bf-a901-a5d856737dda" />

Login to Jenkins using the below URL:
http://<public_ip_address_of_ec2_instance>:8080

![image](https://github.com/user-attachments/assets/137a48ee-0892-4916-9fec-a22d4031996a)

After you login to ec2 instance- Run the command to copy the Jenkins Admin Password:
```
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```
Enter copied password and click continue to login into Jenkins as admin 
<img width="671" alt="image" src="https://github.com/user-attachments/assets/ec9cd384-c3de-41cd-93dc-a2e2a3cdcd85" />

Click on Install suggested plugins

<img width="732" alt="image" src="https://github.com/user-attachments/assets/89c2e956-636d-4a1c-8db3-f55c568495f8" />

Wait for Jenkins to Install suggested plugins.

![image](https://github.com/user-attachments/assets/1cbbda4c-509a-45d1-af66-585b7f58b7ea)

Create First Admin User or Skip the step [If you want to use this Jenkins instance for future use-cases as well, better to create admin user]

![image](https://github.com/user-attachments/assets/920c6c9f-bb81-47f7-9070-5c372ab66eda)

Jenkins Installation is Successful. You can now starting using the Jenkins

![image](https://github.com/user-attachments/assets/1d93e9bf-0242-415e-8d5b-27761dd1742b)

Install the Docker Pipeline plugin in Jenkins:
  - Log in to Jenkins.
  - Go to Manage Jenkins > Manage Plugins.
  - In the Available tab, search for "Docker Pipeline".
  - Select the plugin and click the Install button.
  - Restart Jenkins after the plugin is installed.

![image](https://github.com/user-attachments/assets/0d30d44e-1ec9-4f19-9706-6fc7e1546c5a)

Wait for the Jenkins to be restarted.

## Docker agent Configuration
Run the below command to Install Docker
```
sudo apt update
sudo apt install docker.io
```
## Grant Jenkins user and Ubuntu user permission to docker deamon.
```
sudo su - 
usermod -aG docker jenkins
usermod -aG docker ubuntu
systemctl restart docker
```
## Once you are done with the above steps, it is better to restart Jenkins.
```
http://<ec2-instance-public-ip>:8080/restart
```
The docker agent configuration is now successful.
