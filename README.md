# CircleCI Hackathon Starter

This starter repository helps you quickly deploy your hackathon project using CircleCI with minimal configuration.

**Goal**: Get your project building and deploying with CircleCI! 🚀

---

## 🚀 Quick Start

Get your project running in 5 minutes:

1. **Fork this repository** to your GitHub account
2. **Sign up for CircleCI** at https://circleci.com/signup/ and connect your GitHub account
3. **Follow your repository** in CircleCI to enable the pipeline
4. **Push your code** - CircleCI will automatically run tests
5. **Choose a deployment target** (optional) - Uncomment one of the cloud deployment options in `.circleci/config.yml`

Your first build should pass immediately with the default configuration!

---

## 📦 What This Repository Contains

### Working Components

- **Flask Application** (`app.py`) - A simple "Hello World" app with health check endpoint
- **CircleCI Pipeline** (`.circleci/config.yml`) - Pre-configured to run tests automatically
- **Dockerfile** - Ready for containerized deployments
- **Test Suite** - Basic validation that runs on every commit

### Deployment Examples

Two easy deployment options in the main config (just uncomment!) and three advanced examples in the `examples/` folder

### Helper Scripts

- **`scripts/setup.sh`** - Run this FIRST! Checks everything and tells you what to do next
- **`scripts/validate.sh`** - Quick check: "Is my CircleCI config file valid?"

---

## ☁️ Deployment (Optional)

The default config just runs tests. Want to deploy? We have two options:

### ⭐ Easy: Uncomment in Main Config

Open `.circleci/config.yml` and uncomment ONE deployment option:

**Option 1: Google Cloud Run** (Recommended - Free Tier)
- Best for hackathons with generous free tier
- Uses CircleCI Cloud Run orb for easy deployment
- Uncomment the `deploy-to-gcp` job and workflow section
- Set env vars: `GCP_PROJECT_ID`, `GCP_REGION`, `GCLOUD_SERVICE_KEY`

**Option 2: AWS ECS** (Container Service)
- Popular AWS container service with free tier
- Uncomment the `deploy-to-ecs` job and workflow section
- Set env vars: `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, `AWS_ACCOUNT_ID`, `AWS_REGION`, `AWS_ECS_CLUSTER`, `AWS_ECS_SERVICE`

### 📋 How to Set Environment Variables in CircleCI

1. Go to https://app.circleci.com/projects
2. Find your project and click the three dots (⋯) next to it
3. Select **"Project Settings"**
4. Click **"Environment Variables"** in the left sidebar
5. Click **"Add Environment Variable"**
6. Enter the variable name (e.g., `GCP_PROJECT_ID`) and its value
7. Click **"Add Variable"**
8. Repeat for all required variables

**Important**: Environment variables are secret - once added, you can't view their values again!

### ☁️ Cloud Provider Setup

Before deploying, you need to set up your cloud provider:

**Google Cloud Run** (Recommended for Hackathons - Quick Setup):
1. Create a GCP project at https://console.cloud.google.com/
2. Enable APIs: Cloud Run API and Cloud Build API
3. Create a service account with roles: "Cloud Run Admin" and "Cloud Build Editor"
4. Download the JSON key file
5. Base64 encode it: `cat key.json | base64 -w 0` (Linux) or `base64 -i key.json` (Mac)
6. Use the base64 string as your `GCLOUD_SERVICE_KEY` in CircleCI

**AWS ECS** (Requires More Setup):
1. Create an ECR repository named `hackathon-app` in AWS Console
2. Create an ECS cluster (Fargate or EC2)
3. Create a task definition for your app
4. Create an ECS service using your task definition
5. Find your AWS Account ID: AWS Console → Click your account name in top-right → Copy the 12-digit number
6. Add all required environment variables to CircleCI

**First time deploying to the cloud?** We recommend Cloud Run - it has the quickest setup!

Then push to `main` and watch it deploy! 🚀

### ⭐⭐⭐ Advanced: Copy from Examples

For advanced deployments, copy jobs from `examples/` folder into your config:

- **Docker Hub** - `examples/deploy-to-docker.yml` - Simplest container registry
- **AWS EKS** - `examples/deploy-to-aws-eks.yml` - Kubernetes on AWS
- **Azure Container Instances** - `examples/deploy-to-azure-container.yml` - Azure containers

Each example file has instructions on how to copy it into your main config.

**Need other services?** Check [CircleCI deployment docs](https://circleci.com/docs/deployment-overview/).

### ✅ Verifying Your Deployment

**How to know if deployment succeeded:**

1. **Check CircleCI Dashboard**: All jobs should be green ✓
2. **Check the logs**: 
   - **Cloud Run**: Look for the service URL in the last line (e.g., `https://hackathon-app-xyz.run.app`)
   - **AWS ECS**: Look for "✓ ECS service updated" message
3. **Test your app**: Visit the URL or check your cloud provider console

**Troubleshooting**:
- ❌ Red build? Click on it to see error logs
- 🔑 Authentication errors? Double-check your environment variables
- ❓ Need help? Visit the CircleCI booth!

---

## 🧪 Testing Your Pipeline

### Local Validation

Run the setup script to validate your configuration:

```bash
./scripts/setup.sh
```

Or use the quick validator:

```bash
./scripts/validate.sh
```

### Triggering Builds

CircleCI automatically runs on:
- Every push to any branch
- Every pull request

To manually trigger a build:
1. Go to your CircleCI dashboard
2. Find your project
3. Click "Trigger Pipeline"

### Viewing Build Status

- **CircleCI Dashboard**: https://app.circleci.com/pipelines/github/YOUR_USERNAME
- **Add a badge** to your README (see `SUBMISSION_TEMPLATE.md`)

---

## 🎯 Getting Help at the Hackathon

### CDMX Tech Week - CircleCI Challenge

- **Dates**: October 21-22, 2025
- **Location**: General Prim, CDMX
- **Mission Briefing**: October 21 at 9:00 AM (5 minutes)
- **Live Mentorship**: October 21 mid-day in Playground 2 (2 sessions)

### Need Help?

1. Visit the **CircleCI booth** at General Prim
2. Attend a **mentorship session** in Playground 2
3. Check **CircleCI Documentation**: https://circleci.com/docs/
4. Ask questions in the hackathon Slack channel

---

## 📝 Submission Requirements

For your hackathon submission, show off your CircleCI integration:

1. **Add a CircleCI badge** to your README (shows your build is passing!)
2. **Screenshot or link** to your CircleCI pipeline
3. **Bonus**: Tackle the optional mission - redesign part of the SDLC with AI + CircleCI

See `SUBMISSION_TEMPLATE.md` for ideas.

### Prizes

Prizes to be announced.

---

## 🛠️ Customizing for Your Project

### Replace the Sample App

1. Keep the same file structure or add your own
2. Update `requirements.txt` with your dependencies
3. Update the test job in `.circleci/config.yml` to run your tests
4. Update the Dockerfile if needed for your application

### Add More Jobs

You can add additional jobs to the CircleCI pipeline:

```yaml
jobs:
  lint:
    docker:
      - image: cimg/python:3.11
    steps:
      - checkout
      - run: pip install flake8
      - run: flake8 .
```

Then add it to the workflow:

```yaml
workflows:
  build-and-test:
    jobs:
      - lint
      - test:
          requires:
            - lint
```

---

## 📚 Additional Resources

- **CircleCI Documentation**: https://circleci.com/docs/
- **CircleCI Orbs Registry**: https://circleci.com/developer/orbs
- **Configuration Reference**: https://circleci.com/docs/configuration-reference/
- **Local CLI**: https://circleci.com/docs/local-cli/

---

## 🎉 Ready to Build?

Get your CircleCI pipeline running, then build your project! 

**Optional Challenge Mission**: *"Redesign the SDLC with CircleCI"* - Use AI + CircleCI to reimagine development workflows. Examples: AI code review, smart testing, automated docs, intelligent deployments.

**Now go build something amazing!** 🚀

