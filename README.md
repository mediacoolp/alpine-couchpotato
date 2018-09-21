# About

This repository contains artifacts for building a Couchpotato Docker Image on Alpine Linux.

It is kept as minimal as possible and uses volumes.

- Built from Official Alpine Docker Image

Published to Dockerhub.

## Usage

To run the docker container ensure your run command has the required volumes you want. E.g.,

`docker run -it -v /datahost-couchpotato:/data -v /movieshost:/movies -p 5050:5050 `

- You can add existing data and configuration files to the /datahost-xx folder locally, or let the app build new ones on first launch.

## History

- 9-20-2018: First release, alpine edge
