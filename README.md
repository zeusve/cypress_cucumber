#  Dockerizing Project and Running script.sh

In this tutorial, we will learn how to **dockerize** a project and run the **script.sh** file from a Docker container.

## Step 1: Prepare the enviroment

Download and install Docker on your machine by clicking here:    [![download docker](https://img.icons8.com/?size=1x&id=22813&format=png "download docker")](https://img.icons8.com/?size=1x&id=22813&format=png "download docker")

------------

## Step 2: Clone the repository and navigate to it

```bash
git clone https://github.com/zeusve/cypress_cucumber.git

cd cypress_cucumber

```

## Step 3: Build the Docker image

```bash
docker build -t cypress_cucumber .
```

## Step 4: Start the Docker container

```bash
docker run -it cypress_cucumber
```

## Step 5: Execute the script.sh file in the Docker image

```bash
./script.sh
```

## Step 6: Run the test cases

```bash
npx run cypress --browser chrome --spec cypress/**/* --env allure=true
```
</body>
