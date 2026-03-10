# node-devops-app

Simple production-ready Node.js + Express application for CI/CD pipeline testing.

## Project Structure

```text
node-devops-app
|-- server.js
|-- package.json
|-- Dockerfile
`-- README.md
```

## Endpoints

- `GET /` -> `Welcome to DevOps CI/CD Pipeline`
- `GET /health` -> `{ "status": "OK", "message": "Application Running" }`

## Local Run

```bash
npm install
npm start
```

App runs on `http://localhost:3000`.

## Docker Run

```bash
docker build -t node-devops-app .
docker run -d -p 3000:3000 --name node-devops-app node-devops-app
```

## Jenkins + EC2 Deployment Notes

Typical CI/CD flow:

1. Jenkins pulls source from Git.
2. Jenkins builds Docker image.
3. Jenkins pushes image to a registry (Docker Hub or ECR).
4. Jenkins deploys on EC2 (pull new image, stop old container, run new container on port `3000`).

Example deploy commands on EC2:

```bash
docker pull <registry>/node-devops-app:latest
docker stop node-devops-app || true
docker rm node-devops-app || true
docker run -d --name node-devops-app -p 3000:3000 <registry>/node-devops-app:latest
```
