# Task: Jenkins CI/CD for JavaScript Applications

**Deadline: October 26th, 2024**

## Jenkins Freestyle Project for Todo List App

### Step 1: Fork the Repository
1. Go to [todo-list app](https://github.com/sanoojes/simple-todo-app).
2. Click on the **Fork** button in the top right corner to create a copy in your GitHub account.

### Step 2: Install Jenkins
1. Refer to the official Jenkins installation guide for your operating system: [Jenkins Installation](https://www.jenkins.io/doc/book/installing/) or these articles  [Linux](https://www.digitalocean.com/community/tutorial-collections/how-to-install-jenkins), [Windows](https://phoenixnap.com/kb/install-jenkins-on-windows) and [macOS](https://www.jenkins.io/download/lts/macos/) 
2. Follow the instructions to install Jenkins.
3. Once installed, open your web browser and go to `http://localhost:8080` to access Jenkins.
   
### Step 3: Create a Jenkins Freestyle Project
1. Click on "New Item".
2. Choose "Freestyle project".
3. Name your job (e.g., "Build Todo App").
   
### Step 4: Configure Source Control
1. Source Code Management:
2. Choose "Git".
3. Enter the URL of your forked repository

### Step 5: Add Build Steps
1. Add an "Execute shell" build step.
2. In the command box, add the commands to build your app.
Example commands might look like this:

```bash
echo "Building the app..."
```
### Step 6: Archive the Build Artifacts
1. Post-build Actions:
2. Add a post-build action to "Archive the artifacts".
3. Specify the files to archive. For example:
```plaintext
**/*   # This will archive all files in the workspace
```
### Step 7: Save and Verify Build
1. Save the Job.
2. Build Now: Click on "Build Now" to run the job and build your application.
3. After the build completes, check the console output for any errors.
4. Access the archived artifacts from the build's page in Jenkins to see the files generated during the build process.


## Submission Requirements:

In your forked repositories, create a `jenkins-assignment` folder and include the following:

1. For the Todo List App (Freestyle job):
   - Screenshots of your Jenkins job configuration
   - A screenshot of a successful build
   - The console output of a successful build (saved as a text file)

3. A `README.md` file in the `jenkins-assignment` folder containing a short summary of what you did


### Goodluck! 💪🏽🚀
