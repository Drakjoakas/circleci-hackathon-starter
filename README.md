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

Five deployment configurations in the `examples/` folder - pick the one that fits your project

### Helper Scripts

- **`scripts/setup.sh`** - Run this FIRST! Checks everything and tells you what to do next
- **`scripts/validate.sh`** - Quick check: "Is my CircleCI config file valid?"

---

## ☁️ Deployment (Optional)

The default config just runs tests. Want to deploy? Pick one based on your experience:

### ⭐ Easiest (Recommended for Getting Started)
```bash
cp examples/deploy-to-docker.yml .circleci/config.yml          # Docker Hub
```

### ⭐⭐ Easy (If You Have Cloud Experience)
```bash
cp examples/deploy-to-gcp.yml .circleci/config.yml             # Google Cloud Run
```

### ⭐⭐⭐ Intermediate (Requires Cloud Setup)
```bash
cp examples/deploy-to-azure-container.yml .circleci/config.yml # Azure Container Instances
cp examples/deploy-to-aws-ecs.yml .circleci/config.yml         # AWS ECS
```

### ⭐⭐⭐⭐ Advanced (Requires Kubernetes Knowledge)
```bash
cp examples/deploy-to-aws-eks.yml .circleci/config.yml         # AWS EKS (Kubernetes)
```

Then: Set environment variables in CircleCI (Project Settings → Environment Variables) and push to `main`.

**Need Lambda, Functions, or other services?** Check [CircleCI deployment docs](https://circleci.com/docs/deployment-overview/).

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

