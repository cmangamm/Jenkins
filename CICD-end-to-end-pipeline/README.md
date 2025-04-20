# django-todo
A simple todo app built with django

![todo App](https://raw.githubusercontent.com/shreys7/django-todo/develop/staticfiles/todoApp.png)
### Setup
To get this repository, run the following command inside your git enabled terminal
```bash
$ git clone https://github.com/shreys7/django-todo.git
```
You will need django to be installed in you computer to run this app. Head over to https://www.djangoproject.com/download/ for the download guide

Once you have downloaded django, go to the cloned repo directory and run the following command

```bash
$ python manage.py makemigrations
```

This will create all the migrations file (database migrations) required to run this App.

Now, to apply this migrations run the following command
```bash
$ python manage.py migrate
```

One last step and then our todo App will be live. We need to create an admin user to run this App. On the terminal, type the following command and provide username, password and email for the admin user
```bash
$ python manage.py createsuperuser
```

That was pretty simple, right? Now let's make the App live. We just need to start the server now and then we can start using our simple todo App. Start the server by following command

```bash
$ python manage.py runserver
```

Once the server is hosted, head over to http://127.0.0.1:8000/todos for the App.

Cheers and Happy Coding :)

# Install minikube on EC2 instance
To install Minikube on an EC2 instance, follow these steps:

1) Launch an EC2 Instance:
     Use an Ubuntu Server AMI (e.g., Ubuntu 18.04 LTS or later).
     Ensure the instance has at least 2 vCPUs and 2GB of memory (e.g., t3.micro).

3) SSH into EC2 instance
4) Install Required Tools:
  Update the package list:
  ```
  sudo apt-get update
  ```

Install Docker
  ```
  sudo apt-get install docker.io -y
  ```

Install kubectl(Kubernetes CLI)
  ```
  curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
  chmod +x ./kubectl
  sudo mv ./kubectl /usr/local/bin/kubectl
  ```

Install Minikube:
  ```
  curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
  chmod +x minikube
  sudo mv minikube /usr/local/bin/
  ```

Install conntrack utility, which is required for Kubernetes networking functionalities
```
sudo apt-get install -y conntrack
```

Verify conntrack version
```
conntrack --version
```

Install crictl (Container Runtime Interface CLI) tool is missing, which is required for Kubernetes to function properly.
```
wget https://github.com/kubernetes-sigs/cri-tools/releases/download/v1.26.0/crictl-v1.26.0-linux-amd64.tar.gz
sudo tar -xvf crictl-v1.26.0-linux-amd64.tar.gz -C /usr/local/bin
```

Verify crictl version
```
crictl --version
```

4) Start Minikube:
  Run Minikube with the --vm-driver=none option (since EC2 instances don't support virtualization):
  
  ```
  sudo minikube start --vm-driver=none
  ```

5) Verify Minikube installation
  ```
  minikube status
  ```

