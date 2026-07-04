# Application Commands

# Access Application Services (Minikube)

## Get the Frontend Service URL

```bash
minikube service frontend-svc --url
```

> Prints the URL for the frontend service without opening a browser.

Example Output:

```text
http://127.0.0.1:43217
```

Open the URL in your browser to access the frontend application.

---

## Get the Backend Service URL

```bash
minikube service backend-svc --url
```

> Prints the URL for the backend service.

Example Output:

```text
http://127.0.0.1:39761
```

---

This project can be run locally using **Docker Compose** or deployed to **Kubernetes (Minikube)**.

---

# Frontend

## Navigate to the frontend directory

```bash
cd frontend
```

> Changes the current working directory to the frontend project.

---

## Install dependencies

```bash
npm install
```

> Installs all frontend dependencies listed in `package.json`.

---

## Start the frontend locally

```bash
npm run dev
```

> Starts the Vite development server.

Default URL:

```
http://localhost:5173
```

---

## Build the frontend

```bash
npm run build
```

> Creates the production-ready build inside the `dist/` directory.

---

## Preview the production build

```bash
npm run preview
```

> Runs the built frontend locally for testing.

---

# Backend

## Navigate to the backend directory

```bash
cd backend
```

> Opens the backend project directory.

---

## Install dependencies

```bash
npm install
```

> Installs backend dependencies.

---

## Start the backend

```bash
npm start
```

> Starts the Express server.

Default URL:

```
http://localhost:8080
```

---

## Verify backend health

Open:

```
http://localhost:8080/health
```

Expected Response:

```json
{
  "status": "ok"
}
```

---

# Database

## Start PostgreSQL using Docker

```bash
docker compose up postgres_db
```

> Starts only the PostgreSQL database container.

---

## View PostgreSQL logs

```bash
docker logs postgres_db
```

> Displays PostgreSQL logs.

---

## Connect to PostgreSQL

```bash
docker exec -it postgres_db psql -U assessment_user -d assessment_db
```

> Opens the PostgreSQL terminal.

---

## List all tables

```sql
\dt
```

---

## Exit PostgreSQL

```sql
\q
```

---

# Docker Compose

## Start the complete application

```bash
docker compose up --build
```

> Builds all images and starts the frontend, backend, and PostgreSQL.

---

## Start in detached mode

```bash
docker compose up -d --build
```

> Runs all containers in the background.

---

## Stop all containers

```bash
docker compose down
```

> Stops and removes all containers.

---

## View running containers

```bash
docker ps
```

---

## View application logs

```bash
docker compose logs
```

---

## Follow logs continuously

```bash
docker compose logs -f
```

---

# Kubernetes (Minikube)

## Start Minikube

```bash
minikube start
```

> Starts the local Kubernetes cluster.

---

## Configure Docker to use Minikube

```bash
eval $(minikube docker-env)
```

> Ensures Docker builds images directly inside Minikube.

---

## Build Backend Image

```bash
docker build -t devops-assessment-backend:latest ./backend
```

---

## Build Frontend Image

```bash
docker build -t devops-assessment-frontend:latest ./frontend
```

---

## Verify Docker Images

```bash
docker images
```

---

# Deploy to Kubernetes

Navigate to the Kubernetes directory.

```bash
cd k8s
```

---

## Create Kubernetes Secret

```bash
kubectl apply -f db-secret.yaml
```

> Creates the PostgreSQL credentials Secret.

---

## Create ConfigMap

```bash
kubectl apply -f frontend-config.yaml
```

> Creates the frontend ConfigMap.

---

## Deploy Backend and PostgreSQL

```bash
kubectl apply -f backend-deployment.yaml
```

---

## Create Backend and PostgreSQL Services

```bash
kubectl apply -f backend-service.yaml
```

---

## Deploy Frontend

```bash
kubectl apply -f frontend-deployment.yaml
```

---

## Create Frontend Service

```bash
kubectl apply -f frontend-service.yaml
```

---

# Verify Kubernetes Resources

## List all Pods

```bash
kubectl get pods
```

---

## List all Services

```bash
kubectl get svc
```

---

## List Deployments

```bash
kubectl get deployments
```

---

## List Secrets

```bash
kubectl get secrets
```

---

## List ConfigMaps

```bash
kubectl get configmaps
```

---

## View Endpoints

```bash
kubectl get endpoints
```

---

# Describe Resources

## Backend Deployment

```bash
kubectl describe deployment backend
```

---

## Frontend Deployment

```bash
kubectl describe deployment frontend
```

---

## PostgreSQL Deployment

```bash
kubectl describe deployment postgres-db
```

---

## Backend Service

```bash
kubectl describe svc backend-svc
```

---

## Frontend Service

```bash
kubectl describe svc frontend-svc
```

---

## PostgreSQL Service

```bash
kubectl describe svc postgres-db
```

---

# View Logs

## Backend Logs

```bash
kubectl logs deployment/backend
```

---

## Frontend Logs

```bash
kubectl logs deployment/frontend
```

---

## PostgreSQL Logs

```bash
kubectl logs deployment/postgres-db
```

---

# Restart Deployments

## Restart Backend

```bash
kubectl rollout restart deployment/backend
```

---

## Restart Frontend

```bash
kubectl rollout restart deployment/frontend
```

---

## Restart PostgreSQL

```bash
kubectl rollout restart deployment/postgres-db
```

---

# Check Rollout Status

## Backend

```bash
kubectl rollout status deployment/backend
```

---

## Frontend

```bash
kubectl rollout status deployment/frontend
```

---

## PostgreSQL

```bash
kubectl rollout status deployment/postgres-db
```

---

# Access the Application

## Open Frontend

```bash
minikube service frontend-svc
```

> Opens the frontend application in your default browser.

---

## Get Frontend URL

```bash
minikube service frontend-svc --url
```

> Prints the frontend service URL.

---

## Open Backend

```bash
minikube service backend-svc
```

---

## Get Backend URL

```bash
minikube service backend-svc --url
```

---

# Execute Commands Inside Pods

## Open Backend Shell

```bash
kubectl exec -it deployment/backend -- sh
```

---

## Open Frontend Shell

```bash
kubectl exec -it deployment/frontend -- sh
```

---

## Open PostgreSQL Shell

```bash
kubectl exec -it deployment/postgres-db -- sh
```

---

# Delete the Application

## Delete all Kubernetes resources

```bash
kubectl delete -f .
```

> Deletes all resources defined in the current `k8s/` directory.

---

# Stop Minikube

```bash
minikube stop
```

> Stops the local Kubernetes cluster.

---

# Delete Minikube Cluster

```bash
minikube delete
```

> Deletes the entire Minikube cluster and all deployed resources.
