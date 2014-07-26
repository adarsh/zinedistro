# Zine Distro in a Box

### What is it?

A rails application to facilitate creating a [zine](https://en.wikipedia.org/wiki/Zine) distro. It includes a complete application to get started sharing zines online.

### Is It Good?

Yes.

### Is It "Production Ready™"?

Nope.

## Setup instructions

Install [docker](https://docs.docker.com/installation/).

Start it.

On Linux:
```console
docker -d
```

On Mac OS:
```console
boot2docker up
```

### Download and start a PostgreSQL database

```console
RUN_COMMAND="bin/rake db:create db:schema:load db:migrate db:seed" bin/start 
```

### Start the application

```console
bin/start 
```
