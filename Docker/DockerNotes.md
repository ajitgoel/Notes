docker ps #**get list of all running docker containers**
docker exec -it <ContainerName> bash #**<u>get into a Docker container's shell</u>**
docker volume ls #**list all volumes**

**Dockerfile:**

==#Use the ASP.NET Core 2.2 image as the base image==
FROM mcr.microsoft.com/dotnet/core/aspnet:2.2
==#Execute a command to create a folder **app** in the image==
RUN mkdir app
==#Copy all files from the subfolder **docker-guide/dist** of the host to the app folder inside the image==

COPY docker-guide/dist/* /app/

==#Expose port 80==
EXPOSE 80

==#Execute **dotnet /app/docker-guide.dll** when the container is started==
ENTRYPOINT ["dotnet", "/app/docker-guide.dll"]

All commands except **ENTRYPOINT** and **CMD** are run when the image is being built.

**<u>multi-stage builds</u>**: lets you put multiple image definitions in a single Dockerfile, where later images can access the files from the ones defined earlier in the file. All images except the last one are temporary and will be removed after the build.

**<u>Find file in Linux machine:</u>**

find / -type f -iname "<Filename>" => ==star(*) before and after filename==
<u>**reboot linux machine:**</u>
sudo reboot


<u>**mount host machine folder to a folder on the image**</u> 

 docker run -v <HostMachineFolder>:<ImageFolder> <ImageName>

​	=> docker run -v /space-storage:/space-storage img-captain-webapplication:29

https://github.com/wsargent/docker-cheat-sheet

- ### Lifecycle

  - [`docker create`](https://docs.docker.com/engine/reference/commandline/create) creates a container but does not start it.
  - [`docker rename`](https://docs.docker.com/engine/reference/commandline/rename/) allows the container to be renamed.
  - [`docker run`](https://docs.docker.com/engine/reference/commandline/run) creates and starts a container in one operation.
  - [`docker rm`](https://docs.docker.com/engine/reference/commandline/rm) deletes a container.
  - [`docker update`](https://docs.docker.com/engine/reference/commandline/update/) updates a container's resource limits.

### Starting and Stopping

- [`docker start`](https://docs.docker.com/engine/reference/commandline/start) starts a container so it is running.
- [`docker stop`](https://docs.docker.com/engine/reference/commandline/stop) stops a running container.
- [`docker restart`](https://docs.docker.com/engine/reference/commandline/restart) stops and starts a container.
- [`docker pause`](https://docs.docker.com/engine/reference/commandline/pause/) pauses a running container, "freezing" it in place.
- [`docker unpause`](https://docs.docker.com/engine/reference/commandline/unpause/) will unpause a running container.
- [`docker wait`](https://docs.docker.com/engine/reference/commandline/wait) blocks until running container stops.
- [`docker kill`](https://docs.docker.com/engine/reference/commandline/kill) sends a SIGKILL to a running container.
- [`docker attach`](https://docs.docker.com/engine/reference/commandline/attach) will connect to a running container.

### Info

- ==[`docker ps`](https://docs.docker.com/engine/reference/commandline/ps) shows running containers.==
- [`docker logs`](https://docs.docker.com/engine/reference/commandline/logs) gets logs from container. (You can use a custom log driver, but logs is only available for `json-file` and `journald` in 1.10).
- [`docker inspect`](https://docs.docker.com/engine/reference/commandline/inspect) looks at all the info on a container (including IP address).
- [`docker events`](https://docs.docker.com/engine/reference/commandline/events) gets events from container.
- [`docker port`](https://docs.docker.com/engine/reference/commandline/port) shows public facing port of container.
- [`docker top`](https://docs.docker.com/engine/reference/commandline/top) shows running processes in container.
- [`docker stats`](https://docs.docker.com/engine/reference/commandline/stats) shows containers' resource usage statistics.
- [`docker diff`](https://docs.docker.com/engine/reference/commandline/diff) shows changed files in the container's FS.

### Import / Export

- [`docker cp`](https://docs.docker.com/engine/reference/commandline/cp) copies files or folders between a container and the local filesystem.
- [`docker export`](https://docs.docker.com/engine/reference/commandline/export) turns container filesystem into tarball archive stream to STDOUT.

### Executing Commands

- ==[`docker exec`](https://docs.docker.com/engine/reference/commandline/exec) to execute a command in container.==

To enter a running container, attach a new shell process to a running container called foo, use: `docker exec -it foo /bin/bash`.