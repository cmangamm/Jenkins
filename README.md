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


