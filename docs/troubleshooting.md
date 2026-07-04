# Troubleshooting Guide

## 1. Pod is in CrashLoopBackOff. What do you check?

- Check pod logs using `kubectl logs`.
- Describe the pod with `kubectl describe pod`.
- Verify environment variables and Secrets.
- Check if the application is crashing due to configuration or dependency issues.
- Confirm resource limits are not causing OOMKilled events.

---

## 2. Deployment is successful, but the app is not reachable. What do you check?

- Verify the Service is pointing to the correct pods.
- Check Service selectors and labels.
- Confirm Ingress configuration.
- Ensure the application is listening on the correct port.
- Test connectivity from inside the cluster.

---

## 3. Difference between Readiness and Liveness Probe?

- **Readiness Probe:** Checks if the application is ready to receive traffic.
- **Liveness Probe:** Checks if the application is still healthy. If it fails repeatedly, Kubernetes restarts the container.

---

## 4. Docker build works locally but fails in the pipeline. Why?

- Because of different Docker versions.
- Missing environment variables or secrets.
- Required files are excluded by `.dockerignore`.
- Wrong build context or file paths.
- Dependency installation issues.

---

## 5. Pipeline fails during Docker build. What do you check?

- Review the build logs.
- Verify the Dockerfile.
- Check image tags and registry credentials.
- Confirm all required files exist.
- Ensure the runner has enough disk space.

---

## 6. Certificate renewal failed. What do you check?

- Check certificate controller logs.
- Verify DNS records.
- Confirm the certificate issuer is healthy.
- Ensure HTTP/HTTPS validation is working.
- Check certificate expiration status.

---

## 7. Ingress returns 502 or 504. What do you check?

- Verify backend pods are healthy.
- Check Service endpoints.
- Confirm backend port matches the Service.
- Review Ingress controller logs.
- Test backend Service directly inside the cluster.

---

## 8. Vendor SFTP connection to port 22 times out. What do you check?

- Verify the server is running.
- Check Security Group or firewall rules.
- Confirm port 22 is open.
- Verify network routing.
- Review SSH service logs.

---

## 9. Terraform plan wants to recreate the cluster. What do you check?

- Review the execution plan carefully.
- Check for changes to immutable resources.
- Verify Terraform state is up to date.
- Ensure variables haven't changed unexpectedly.
- Confirm no manual infrastructure changes were made.

---

## 10. How would you upgrade AKS/EKS safely?

- Back up important data.
- Upgrade worker nodes in stages.
- Test in a non-production environment first.
- Monitor application health during the upgrade.
- Roll back if any critical issue appears.

---

## 11. Frontend loads, but backend API calls fail. What do you check?

- Verify the backend Service is reachable.
- Check API endpoint configuration.
- Inspect browser Network logs.
- Check CORS settings.
- Review backend application logs.

---

## 12. Backend pod is running, but database connection times out. What do you check?

- Verify database hostname and port.
- Check Security Groups or firewall rules.
- Confirm database is running.
- Test network connectivity from the pod.
- Verify database credentials.

---

## 13. Private DNS is not resolving the database hostname. What do you check?

- Verify the private DNS zone is configured.
- Check VPC/VNet DNS settings.
- Confirm the DNS record exists.
- Test DNS resolution from a pod.
- Ensure the cluster is linked to the private DNS zone.

---

## 14. How would you rotate database credentials safely?

- Create new credentials.
- Update the Secret securely.
- Restart or reload the backend application.
- Verify the new credentials work.
- Remove the old credentials after confirmation.

---

## 15. Secrets were accidentally committed to GitHub. What do you do?

- Revoke the exposed credentials immediately.
- Generate new credentials.
- Remove the secrets from Git history.
- Update the repository with the new secrets.
- Store future secrets using GitHub Secrets or a secret manager.
