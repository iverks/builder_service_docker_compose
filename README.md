# Builder service example in docker compose

In this example, the base service builds a mock application `program.sh`.
The frontend and backend services both copy this program because they depend on it.
In addition a timestamp is generated to demonstrate that the work is not repeated.
As we can see below, the build script is only run once, and the artifacts are reused in all the services.

## Important parts

The most important parts are the following: 

compose.yml

```yml
services:
  frontend:
    build:
      additional_contexts:
        application_builder: "service:base"
  base:
```

Dockerfile:

```Dockerfile
COPY --from=application_builder /app/* .
```

Here the key in additional_contexts must correspond to the argument passed to `--from`, namely 'application_builder'.
The value "service:base" refers to the service named "base" in the `compose.yml` file.


## Example of running it:

```
$ docker compose up -d --build
...

$ docker compose exec base ls
15:26:09.294973156  program.sh

$ docker compose exec frontend ls
15:26:09.294973156  program.sh

$ docker compose exec backend ls
15:26:09.294973156  program.sh
```