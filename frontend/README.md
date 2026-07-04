# React + Vite

This template provides a minimal setup to get React working in Vite with HMR and some ESLint rules.

Currently, two official plugins are available:

- [@vitejs/plugin-react](https://github.com/vitejs/vite-plugin-react/blob/main/packages/plugin-react) uses [Oxc](https://oxc.rs)
- [@vitejs/plugin-react-swc](https://github.com/vitejs/vite-plugin-react/blob/main/packages/plugin-react-swc) uses [SWC](https://swc.rs/)

## React Compiler

The React Compiler is not enabled on this template because of its impact on dev & build performances. To add it, see [this documentation](https://react.dev/learn/react-compiler/installation).

## Expanding the ESLint configuration

If you are developing a production application, we recommend using TypeScript with type-aware lint rules enabled. Check out the [TS template](https://github.com/vitejs/vite/tree/main/packages/create-vite/template-react-ts) for information on how to integrate TypeScript and [`typescript-eslint`](https://typescript-eslint.io) in your project.

## Application build and run- Frontend

---

# Frontend

## Navigate to the frontend directory

```bash
cd frontend
```

---

## Install dependencies

```bash
npm install
```

---

## Run Development Server

```bash
npm run dev
```

Application runs at:

```
http://localhost:5173
```

---

## Build Production Files

```bash
npm run build
```

Creates the production build inside:

```
dist/
```

---

## Preview Production Build

```bash
npm run preview
```

---

## Build Docker Image

Run this command from the project root:

```bash
docker build -t devops-assessment-frontend:latest ./frontend
```

---

## View Frontend Logs (Kubernetes)

```bash
kubectl logs deployment/frontend
```

---

## Restart Frontend Deployment

```bash
kubectl rollout restart deployment/frontend
```

---

## Open Frontend Shell

```bash
kubectl exec -it deployment/frontend -- sh
```
