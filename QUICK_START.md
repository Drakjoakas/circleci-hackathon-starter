# CircleCI Hackathon - Quick Start

## Get Running in 5 Minutes

### 1. Fork the Repository
```bash
# Using GitHub CLI
gh repo fork AwesomeCICD/circleci-hackathon-starter

# Or click "Fork" on GitHub at:
# https://github.com/AwesomeCICD/circleci-hackathon-starter
```

### 2. Sign Up for CircleCI
https://circleci.com/signup/

Connect your GitHub account

### 3. Follow Your Project
In CircleCI dashboard, click "Follow Project"

### 4. Push Your Code
```bash
git push origin main
```

Watch your first build pass! ✓

### 5. Choose Deployment (Optional)

**Easy Option**: Uncomment in `.circleci/config.yml`
- Open `.circleci/config.yml`
- Uncomment `deploy-to-gcp` (Cloud Run - recommended) or `deploy-to-ecs` (AWS ECS)
- Uncomment the corresponding workflow section
- Set environment variables in CircleCI project settings

**Advanced Option**: Copy from `examples/` folder
- See `examples/deploy-to-docker.yml`, `deploy-to-aws-eks.yml`, or `deploy-to-azure-container.yml`
- Follow copy instructions in each file

## Need Help?

**CircleCI Booth** - General Prim, CDMX
**Mentorship Sessions** - October 21, Playground 2
**Documentation** - https://circleci.com/docs/

---

*CDMX Tech Week - October 21-22, 2025*

