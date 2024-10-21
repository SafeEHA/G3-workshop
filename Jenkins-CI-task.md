# Task: Jenkins CI/CD for JavaScript Applications

**Deadline: October 25th, 2024**

In this assignment, you will set up two Jenkins jobs for two different JavaScript applications. This will help you understand both Freestyle and Pipeline jobs in Jenkins.

# CI Pipeline Assignment: Todo List and Counter Apps

## Part 1: Jenkins Freestyle Project for Todo List App

### Step 1: Fork the Repository
1. Go to [todo-list app](https://github.com/sanoojes/simple-todo-app).
2. Click on the **Fork** button in the top right corner to create a copy in your GitHub account.

### Step 2: Install Jenkins
1. Refer to the official Jenkins installation guide for your operating system: [Jenkins Installation](https://www.jenkins.io/doc/book/installing/) or these articles  [Linux](https://www.digitalocean.com/community/tutorial-collections/how-to-install-jenkins), [Windows](https://phoenixnap.com/kb/install-jenkins-on-windows) and [macOS](https://www.jenkins.io/download/lts/macos/) 
2. Follow the instructions to install Jenkins.
3. Once installed, open your web browser and go to `http://localhost:8080` to access Jenkins.

### Step 3: Create a Jenkins Freestyle Project
1. On the Jenkins dashboard, click on **New Item**.
2. Enter a name for your project (e.g., `TodoListApp`) and select **Freestyle project**.
3. Click **OK**.

### Step 4: Configure the Job
1. **Source Code Management**:
   - Under the **Source Code Management** section, select **Git**.
   - In the **Repository URL** field, enter the URL of your forked repository (e.g., `https://github.com/yourusername/todo-list-app.git`).
   
2. **Build Triggers**:
   - Check the option **GitHub hook trigger for GITScm polling** to enable automatic builds when changes are pushed to the repository.

3. **Build Steps**:
   - Click on **Add build step** and select **Execute shell** or **Execute Windows batch command** (depending on your OS).
   - Enter the following commands:
     ```bash
     # Install dependencies
     npm install
     
     # Run tests
     npm test
     
     # Build the application (if applicable)
     npm run build
     ```
   - To archive the build artifacts, click on **Add post-build action** and select **Archive the artifacts**. Specify the files or directories you want to archive (e.g., `dist/**` or any other output folder).

### Step 5: Save and Build
1. Click **Save** to save your configuration.
2. To test your job, click on **Build Now** on the left sidebar.

---

## Part 2: Jenkins Pipeline for Counter App

### Step 1: Fork the Repository
1. Go to [counter app](https://github.com/zach7815/JavaScript-Counter).
2. Click on the **Fork** button to create a copy in your GitHub account.

### Step 2: Create a Dockerfile
1. In the root directory of your counter app repository (where your package.json file is located), create a file named Dockerfile with a sample content:
 ```groovy
FROM node:14

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD [ "npm", "start" ]

```
2. Test locally before pushing your changes, you can test the `Dockerfile` locally by running:
```bash
docker build -t yourusername/counter-app .
docker run -p 3000:3000 yourusername/counter-app
```
Make sure to update `yourusername` with your actual Docker Hub username.

### Step 3: Create a Jenkinsfile
1. Clone your forked counter app repository to your local machine:
   ```bash
   git clone https://github.com/yourusername/counter-app.git
   cd counter-app
   ```
2. Create a file named `Jenkinsfile` in the root directory of your repository with a sample pipeline like below:
   ```groovy
   pipeline {
       agent any
       stages {
           stage('Checkout') {
               steps {
                   checkout scm
               }
           }
           stage('Install Dependencies') {
               steps {
                   sh 'npm install' // Use 'bat' for Windows
               }
           }
           stage('Run Tests') {
               steps {
                   sh 'npm test' // Use 'bat' for Windows
               }
           }
           stage('Build') {
               steps {
                   sh 'npm run build' // Use 'bat' for Windows
               }
           }
           stage('Docker Build') {
               steps {
                   sh 'docker build -t yourusername/counter-app:latest .' // Use 'bat' for Windows
               }
           }
           stage('Docker Push') {
               steps {
                   withCredentials([string(credentialsId: 'dockerhub-credentials', variable: 'DOCKERHUB_CREDENTIALS')]) {
                       sh 'echo "$DOCKERHUB_CREDENTIALS" | docker login -u yourusername --password-stdin'
                       sh 'docker push yourusername/counter-app:latest'
                   }
               }
           }
       }
   }
   ```

### Step 3: Create a Jenkins Pipeline Job
1. In Jenkins, click on **New Item**.
2. Enter a name for your pipeline job (e.g., `CounterAppPipeline`) and select **Pipeline**.
3. Click **OK**.
4. In the pipeline configuration:
   - Under **Pipeline**, set **Definition** to **Pipeline script from SCM**.
   - Select **Git** as your SCM and enter the URL of your forked repository.
   - Set the **Branch Specifier** to `*/main` (or the default branch name you use).
   - In **Script Path**, set it to `Jenkinsfile`.
5. Click **Save**.

### Step 4: Build the Pipeline
1. To run your pipeline, click on **Build Now** in the sidebar.

### Additional Documentation
- [Jenkins Docker Pipeline](https://www.jenkins.io/doc/book/pipeline/docker/)
- [Node.js and npm Installation Guide](https://nodejs.org/en/download/)
- [Docker Installation Guide](https://docs.docker.com/get-docker/)
- [Docker Hub Documentation](https://docs.docker.com/docker-hub/)


## Submission Requirements:

In your forked repositories, create a `jenkins-assignment` folder and include the following:

1. For the Todo List App (Freestyle job):
   - Screenshots of your Jenkins job configuration
   - A screenshot of a successful build
   - The console output of a successful build (saved as a text file)

2. For the Counter App (Pipeline job):
   - Your Jenkinsfile
   - Screenshots of your Jenkins pipeline configuration
   - A screenshot of a successful pipeline run
   - The console output of a successful pipeline run (saved as a text file)

3. A `README.md` file in the `jenkins-assignment` folder of each repository, containing a short summary of what you did

## Note
This project would actually need you to conduct some research outside the instructions provided so make sure you work together and reach out for help with blockers only if they persist.

### Goodluck! 💪🏽🚀
