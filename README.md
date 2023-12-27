# Flutter Base Structure

### This base structure includes following features

- Bloc Pattern Architecture
- Google Font to support the App level font
- Dio for Networking (API Calling)
- Shared Preferences
- Connectivity Check
- CI/CD integration with use of GitHub Action

## References

### Google Font : https://pub.dev/packages/google_fonts
### Bloc Pattern : https://pub.dev/packages/flutter_bloc
### Dio : https://pub.dev/packages/dio
### Shared Preference : https://pub.dev/packages/shared_preferences
### Connectivity : https://pub.dev/packages/connectivity_plus

## How to implement CI/CD with GitHub Action and send build on Slack channel

### Up project on GitHub
- Create a sample Flutter application
- Enable VCS Integration
- Upload the project on Github
- Now you have a master branch created for your project

### CI/CD
- Create .github folder under your project main dir.
- Ex. flutter_base_structure/.github
- Create workflows folder under .github folder.
- Create yml file for CI/CD
- Ex. flutter-workflow.yml under workflows folder
- So, your structure be like: <Project>/.github/workflows/<XYZ.yml>

## Define the Repository secrets on GitHub
- To integrate CI with third party tools (Slack/Telegram/Whatsapp), GitHub Actions needs to use some private credentials.
- The safe way to add those credentials inside your repository is to use the secrets of repository.
- Using the secrets, it is possible to store private credentials that are not going to visible on our CI instruction file (.yml)
- Also store the secrets using cryptography.

### How to define secrets on GitHub repository?
- Go to your GitHub repository
- Go to settings
- Go to Secrets and variables / Actions
- You will find two Tabs. 1. Secrets and 2. Variables
- Select Secrets
- Define your secrets here. (Stored with encryption.)
- Ex. secrets.SLACK_WEBHOOK_URL / secrets.SLACK_BOT_TOKEN / secrets.SLACK_CHANNEL_ID
- Which will be reference to your .yml file.

## Integrating with Slack
- Go to https://slack.com/
- Create a new workspace
- Ex. Spec India
- Create a channel dedicated for our CI
- Ex. flutter-cicd
- Channel is used for communication.
- We can integrate this channel with the Slack App "Incoming WebHooks"


## What is Incoming WebHooks
- Incoming Webhooks are a simple way to post messages from external sources into Slack.
- This Incoming Webhook URL is used by GitHub Actions to send messages on Slack channel

## To do this
- Go to your workspace. (Spec India)
- Select the slack channel (#flutter-cicd)
- Select the arrow on the side of the channel name
- Select "integrations" on the menu
- Search for and select “Incoming WebHooks”
- Select "Add to Slack"
- Select the target channel
- Generate Webhook URL
- Copy it and store in GitHub repo Actions name like SLACK_WEBHOOK_URL

## Update .yml file

```
name: Flutter CI

on:
  push:
    branches: [ master ]
  pull_request:
    branches: [ master ]

jobs:

  messageSlack:
    runs-on: ubuntu-latest
    steps:
    - name: Slack Notification
      uses: rtCamp/action-slack-notify@v2
      env:
        SLACK_CHANNEL: flutter-cicd
        SLACK_TITLE: Post title
        SLACK_USERNAME: nrup.parikh
        SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK_URL }}
        SLACK_MESSAGE: "New release app available."
```