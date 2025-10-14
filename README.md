# CircleCI Hackathon Starter

**Redesign the SDLC with CircleCI** - Build an AI-powered solution that fundamentally reimagines 1-2 phases of the Software Development Lifecycle, with CircleCI as the orchestration backbone.

This starter repository helps you quickly deploy your hackathon project using CircleCI with minimal configuration.

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

Three complete deployment configurations in the `examples/` folder:

- `deploy-to-aws.yml` - Deploy to AWS Lambda
- `deploy-to-gcp.yml` - Deploy to Google Cloud Run  
- `deploy-to-azure.yml` - Deploy to Azure Functions

### Helper Scripts

- `scripts/setup.sh` - Validates your config and shows required environment variables
- `scripts/validate.sh` - Quick validation of your CircleCI configuration

---

## ☁️ How to Choose Your Deployment Target

Pick the cloud platform that fits your project:

| Platform | Best For | Deployment Type |
|----------|----------|-----------------|
| **AWS Lambda** | Serverless functions, event-driven apps | Function as a Service |
| **GCP Cloud Run** | Containerized apps, microservices | Container as a Service |
| **Azure Functions** | Azure ecosystem, enterprise integration | Function as a Service |

### To Deploy:

1. Copy the example config to `.circleci/config.yml`:
   ```bash
   cp examples/deploy-to-aws.yml .circleci/config.yml
   ```

2. Set environment variables in CircleCI (see next section)

3. Push to the `main` branch - deployment happens automatically!

---

## 🔐 Environment Variables You'll Need

Set these in your CircleCI project settings (**Project Settings → Environment Variables**):

### For AWS Lambda

| Variable | Description | Example |
|----------|-------------|---------|
| `AWS_ACCESS_KEY_ID` | AWS access key | `AKIAIOSFODNN7EXAMPLE` |
| `AWS_SECRET_ACCESS_KEY` | AWS secret key | `wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY` |
| `AWS_LAMBDA_FUNCTION_NAME` | Lambda function name | `my-hackathon-app` |
| `AWS_REGION` | AWS region | `us-east-1` |

### For GCP Cloud Run

| Variable | Description | Example |
|----------|-------------|---------|
| `GCP_PROJECT_ID` | GCP project ID | `my-project-12345` |
| `GCP_REGION` | GCP region | `us-central1` |
| `GCP_SERVICE_ACCOUNT_KEY` | Base64-encoded service account JSON | `eyJ0eXBlIjoi...` |

### For Azure Functions

| Variable | Description | Example |
|----------|-------------|---------|
| `AZURE_FUNCTION_APP_NAME` | Function app name | `my-hackathon-func` |
| `AZURE_RESOURCE_GROUP` | Resource group | `hackathon-rg` |
| `AZURE_SP_APP_ID` | Service principal app ID | `12345678-1234-1234-1234-123456789012` |
| `AZURE_SP_PASSWORD` | Service principal password | `your-password` |
| `AZURE_SP_TENANT` | Azure tenant ID | `87654321-4321-4321-4321-210987654321` |

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

Before submitting your project:

1. **Add a CircleCI badge** to your README showing build status
2. **Provide API proof** of deployment via CircleCI status endpoint
3. **Document your SDLC redesign** - explain how CircleCI orchestrates your solution

See `SUBMISSION_TEMPLATE.md` for the complete submission format.

### Prizes

Prizes to be announced - may include online learning memberships and gift cards!

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

Remember: The goal is to **redesign the SDLC with CircleCI**. Think about:

- How can CI/CD improve development workflows?
- What manual processes can be automated?
- How can CircleCI orchestrate complex AI pipelines?
- What new SDLC phases are enabled by intelligent automation?

**Now go build something amazing!** 🚀

