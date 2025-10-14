# Troubleshooting Guide

Common issues and how to fix them.

## CircleCI Configuration Issues

### "Config file not found"

**Problem**: CircleCI can't find your configuration file.

**Solution**: 
- Ensure `.circleci/config.yml` exists in your repository root
- Check that the file is committed and pushed to GitHub
- Verify file name is exactly `config.yml` (not `config.yaml`)

### "Invalid configuration"

**Problem**: YAML syntax error or invalid CircleCI configuration.

**Solution**:
```bash
# Validate locally
./scripts/validate.sh

# Or use CircleCI CLI directly
circleci config validate .circleci/config.yml
```

Common YAML issues:
- Check indentation (use spaces, not tabs)
- Ensure quotes match (single or double)
- Verify no trailing spaces
- Check for special characters

### "No workflows found"

**Problem**: CircleCI doesn't know which jobs to run.

**Solution**: Ensure you have a `workflows` section in your config that references your jobs.

## Deployment Issues

### AWS Lambda: "Access Denied"

**Problem**: Insufficient AWS permissions.

**Solution**:
- Verify `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` are set in CircleCI
- Check IAM user has Lambda update permissions
- Ensure Lambda function exists and name matches `AWS_LAMBDA_FUNCTION_NAME`

### GCP: "Service account authentication failed"

**Problem**: Invalid service account key.

**Solution**:
- Ensure `GCP_SERVICE_ACCOUNT_KEY` is base64-encoded
- Verify service account has Cloud Run permissions
- Check project ID matches `GCP_PROJECT_ID`

To encode service account key:
```bash
cat service-account.json | base64
```

### Azure: "Service principal login failed"

**Problem**: Invalid Azure credentials.

**Solution**:
- Verify all Azure variables are set correctly
- Check service principal has appropriate permissions
- Ensure tenant ID is correct

## Testing Issues

### "pytest: command not found"

**Problem**: pytest is not installed.

**Solution**: 
- Ensure `pytest==7.4.3` is in `requirements.txt`
- Verify dependencies are installed in CircleCI job:
  ```yaml
  - run: pip install -r requirements.txt
  ```

### "ModuleNotFoundError: No module named 'app'"

**Problem**: Python can't find your application module.

**Solution**:
- Ensure `app.py` is in the repository root
- Check that code is checked out in CircleCI:
  ```yaml
  - checkout
  ```

### Tests pass locally but fail in CircleCI

**Problem**: Different environments.

**Solution**:
- Check Python version matches (3.11 in this starter)
- Verify all dependencies are in `requirements.txt`
- Look for hardcoded paths or environment-specific code

## Environment Variable Issues

### "Environment variable not set"

**Problem**: Required variable missing in CircleCI.

**Solution**:
1. Go to CircleCI project settings
2. Click "Environment Variables"
3. Add the missing variable
4. Rerun the pipeline

### Variables not updating

**Problem**: Old values being used.

**Solution**:
- Variable changes take effect on next pipeline run
- Try triggering a new build (not re-running old one)
- Clear any caches if issues persist

## Git Issues

### "Permission denied" when pushing

**Problem**: SSH key or authentication issue.

**Solution**:
- Verify GitHub authentication is set up
- Check SSH keys are configured
- Try HTTPS instead of SSH URL

### Builds not triggering

**Problem**: CircleCI not detecting pushes.

**Solution**:
- Ensure project is "followed" in CircleCI
- Check webhooks in GitHub repo settings
- Verify CircleCI has repo access permissions

## Docker Issues

### "Cannot connect to Docker daemon"

**Problem**: Docker not available in job.

**Solution**: Add `setup_remote_docker` to your job:
```yaml
- setup_remote_docker:
    docker_layer_caching: true
```

### "Image not found"

**Problem**: Docker image doesn't exist or wrong name.

**Solution**:
- Check image name and tag
- Verify image is public or you're authenticated
- Use CircleCI convenience images: `cimg/python:3.11`

## Performance Issues

### Builds taking too long

**Solutions**:
- Enable Docker Layer Caching
- Use dependency caching
- Run jobs in parallel
- Use smaller Docker images

## Getting Help

If you're still stuck:

1. **Check CircleCI logs**: Read the full error message in CircleCI UI
2. **Validate config**: Run `./scripts/validate.sh`
3. **Test locally**: Try to reproduce the issue on your machine
4. **Visit CircleCI booth**: At CDMX Tech Week hackathon
5. **CircleCI docs**: https://circleci.com/docs/
6. **CircleCI community**: https://discuss.circleci.com/

## Debug Tips

### Enable verbose logging

Add to any job step:
```yaml
- run:
    command: your-command
    environment:
      DEBUG: "true"
```

### Print environment

See what's available:
```yaml
- run: env | sort
```

### Check file contents

Verify files are as expected:
```yaml
- run: cat .circleci/config.yml
- run: ls -la
```

### SSH into build

CircleCI lets you SSH into failed builds:
1. Rerun workflow with SSH
2. Use provided SSH command
3. Debug interactively

---

**Remember**: The CircleCI team is at the hackathon to help you! Don't hesitate to ask questions. 🚀

