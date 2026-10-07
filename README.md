# Credentials service

A Spring Boot application exposing one public endpoint:

- `POST /credentials` persists a JSON body containing `id` and `password` and returns `201 Created` with no response body.

## Requirements

- Java 21
- Apache Ant 1.10.15
- Network access for Ivy's initial dependency resolution
- PostgreSQL, with `DATABASE_URL`, `DATABASE_USERNAME`, and `DATABASE_PASSWORD` set in the environment

## Commands

```sh
ant compile
./start.sh
```

The Ant `run` target compiles sources, resolves Ivy dependencies, and starts `com.example.credentials.CredentialsApplication`.
