# AWS_AppSync_QuizApp
This project is created to build a quiz app based on AWS App Sync and DynamoDB

## Setup

1. Check node version: `node -v` should be more than v8.12

2. Install Amplify 
    `npm install -g @aws-amplify/cli`

3. Check Amplify
    `which amplify`

4. Launch Amplify
    `amplify`

### Frontend App

1. npx create-react-app quizbiz

2. cd quizbiz

3. npm add lodash async-retry semantic-ui-css semantic-ui-react aws-amplify aws-amplify-react

4. npm run start

### Apmplify Setup
1. amplify init
    - Please note that build location, you should pass quizbiz\build instead of build, otherwise publish will fail with error `Cannot find the distribution folder.` Distribution folder is currently set as: D:\Tech\AWSLearning\AWS_AppSync_QuizApp\build
    
2. cd quizbiz
3. amplify status
4. amplify hosting add
5. amplify publish

#### API setup
1. amplify api add
    - please select  Do you want to configure advanced settings for the GraphQL API Yes and then in further question provide schema file name with path.
2. 