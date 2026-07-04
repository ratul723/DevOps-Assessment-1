# Backend

## Navigate to the backend directory

```bash
cd backend
```

---

## Install dependencies

```bash
npm install
```

---

## Start Backend

```bash
npm start
```

Backend runs on:

```
http://localhost:8080
```

---

## Backend Health Check

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

## Build Docker Image

Run from the project root:

```bash
docker build -t devops-assessment-backend:latest ./backend
```

---

## View Backend Logs (Kubernetes)

```bash
kubectl logs deployment/backend
```

---

## Restart Backend

```bash
kubectl rollout restart deployment/backend
```

---

## Open Backend Shell

```bash
kubectl exec -it deployment/backend -- sh
```

---

# PostgreSQL

## View PostgreSQL Logs

```bash
kubectl logs deployment/postgres-db
```

---

## Restart PostgreSQL

```bash
kubectl rollout restart deployment/postgres-db
```

---

## Open PostgreSQL Container

```bash
kubectl exec -it deployment/postgres-db -- sh
```

---

## Connect to PostgreSQL (Docker Compose)

```bash
docker exec -it postgres_db psql -U assessment_user -d assessment_db
```

---

## List Tables

```sql
\dt
```

---

## Exit PostgreSQL

```sql
\q
```
