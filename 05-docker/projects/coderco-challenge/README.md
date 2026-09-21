# CoderCo Containers Challenge

A multi-container Flask + Redis app with an Nginx reverse proxy, built with Docker Compose as part of the CoderCo DevOps Academy Docker module.

## What It Does

- `/` — welcome message
- `/count` — visit counter backed by Redis, persisted with a Docker volume

Nginx proxies requests to Flask, which supports running multiple scaled instances.

## Stack

Flask · Redis · Nginx · Docker Compose

## How to Run

```bash
docker-compose up --build
```

Visit `http://localhost:5002` and `http://localhost:5002/count`.

Scale the app:
```bash
docker-compose up --scale web=3 --build
```

## What I Learned

- Docker Compose networking — containers reach each other by service name automatically
- Persistent storage with named volumes
- Configuring apps via environment variables instead of hardcoding
- Nginx as a reverse proxy in front of a scaled service
- `depends_on` needs mapping syntax (not a list) when using `--scale`

## Key Debugging

- Stale image kept running old code after a file rename — fixed by force-removing the image and rebuilding
- Redis connection errors from swapped `REDIS_HOST`/`REDIS_PORT` env vars
- YAML indentation bug in the `nginx` service block

## Screenshots

<img width="1400" height="858" alt="image" src="https://github.com/user-attachments/assets/ea7013ee-d200-4b8a-b781-9f42a334f1cd" />
<img width="1400" height="854" alt="image" src="https://github.com/user-attachments/assets/f51a6bc4-b582-4b52-b9d9-77c5d0569499" />

