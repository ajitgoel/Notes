==**What does the volume parameter do in a `docker run` command?**==

==The volume parameter syncs a directory in a container with a host directory.==

For example: docker run -v nginx-sites:/etc/nginx/sites-available nginx

This command mounts the `nginx-sites` directory in the host to the `/etc/nginx/sites-available` directory. In this way, you can sync nginx sites without restarting the container they’re in. Also, you can protect your data that is generated in your container using a directory in the host. Otherwise, if you delete your container, your data that was generated and stored in your container will naturally be deleted.

When you use the `volume` parameter, you can use the same data that was generated in a previous container using the same command.

**What is the use of the `docker save` and `docker load` commands?**

A Docker image can be exported as an archive via the `docker save` command. For example:

```sh
docker save -o <container-export-path>.tar <container-name>
```

The exported Docker image can then be imported to another Docker host via the `docker load` command:

```sh
docker load -i <container-path>.tar
```

Note that this does not export data from any containers that were based on the image, just the image itself.

**What is the main difference between the approaches of Docker and standard hypervisor virtualization?**

With standard virtualization using a hypervisor like vSphere, an operating system is necessary for each app. A host operating system is at the bottom of your infrastructure, and a hypervisor has to be installed on your host OS. Then on top of the hypervisor, you install operating systems for each of your applications.

With Docker, the Docker daemon sits between your host operating system and your Docker images, in place of a hypervisor. Docker images reuse parts of the host operating system—thus a separate OS is not necessary for each app—but your apps are still isolated like they would be with a standard hypervisor.

**What is the default Docker network driver, and how can you change it when running a Docker image?**

Docker provides different network drivers like `bridge`, `host`, `overlay`, and `macvlan`. `bridge` is the default.

Sometimes you might want to use Docker Swarm or connect your containers to your host network directly. In these cases, you’ll need to change your default network driver.

First, you have to create a new network with the new network driver by using the `--driver` or `-d` parameter with your `docker network create` command. Then you’ll need to run your Docker image with the `--network` parameter to use your newly-created network.

**What are a Docker container’s possible states, and what do they mean?**

**Created**: If your docker container is newly created, you will see this state for your container. In this state, the container is not yet started.

**Restarting**: When you restart your docker container—or container restarts itself due to a problem—you will see this state.

Docker has four different restart policies. The default is called `no`. With this policy, the Docker daemon will never try to restart your container (unless you tell it to manually.)

The second policy is `on-failure`. With this policy, the Docker daemon will try to restart containers if any problem exists, that is, if any startup script returns a non-zero exit code.

The third policy is `always`. With this policy, the Docker daemon will try restart containers if:

1. Any problem exists,
2. You stop them manually, or
3. The docker daemon was itself stopped and restarted

The fourth policy is `unless-stopped`, where the Docker daemon will always try to restart containers unless you stop them manually.

**Running**: Running is the main state you’ll see for containers. It means it has started, and there is no problem detected with the container itself.

**Paused**: If you temporarily stop your running Docker container via `docker pause`, this is what you’ll see until you unpause it.

**Exited**: If your container has stopped because of a problem or you stopped your container manually, you will see your container in this state, depending on your restart policy as described above.

**What is a Docker image? What is a Docker image registry?**

==A Docker image consists of many layers. Each layer corresponds to a command in an image’s Dockerfile. This image provides isolation for an application when you run a Docker image as a container. You can run many containers from a single Docker image. Docker images can be built from a Dockerfile.==

==A Docker image registry is a storage area for Docker images. You can get images from them instead of building them.==

An image registry is either public or private. The best-known public registry is Docker Hub.

==**What is container orchestration and why should we use it?**==

==When you have to manage large and dynamic environments, the `docker` command alone does not suffice. You will face many problems automating scaling and health checks for containers. In this case, software teams use container orchestration tools like Kubernetes.== Such software enables another level of automation:

- Deploy or scale your containers easily, securely, and with high availability
- Provide a service (internally or externally) from a container group
- Move your containers from one host to another when there’s a host-specific problem
- Manage your configuration data—like environment variables—easily

**What features are provided by Docker Enterprise Edition instead of Docker Community Edition?**

Docker Enterprise Edition provides certified Docker images and plugins. With this certification, Docker Inc. ensures that the images in question pass security and best-practice checks. In other words, they guarantee a certain baseline of reliability.

Docker Enterprise Edition also provides Active Directory or LDAP user integration, continuous vulnerability and security scans, and container app and image management features.

**Is there any problem with just using the `latest` tag in a container orchestration environment? What is considered best practice for image tagging?**

If you’re running your image via the `latest` tag with a container orchestration environment like Kubernetes, it may cause a problem.

The problem is if you push a new image with just the `latest` tag, you lose your old image and your deployments will use the new image. If the new image has any problem, your deployments might fail, resulting in downtime.

When you use explicit version numbers to tag Docker images instead, you can roll back to old images easily. Also, when you push a new image to your private registry, your deployments will continue to use the old version number due to your tag until you’re ready to switch each of them over.

The best practice of Docker image tagging is to use both types of tagging. First, tag your Docker images with `latest` and a version number, then push twice, separately for each tag. For example:

```sh
docker tag nginx:latest nginx:0.0.1

docker push nginx:latest
docker push nginx:0.0.1
```

==**What is Docker Swarm and which network driver should be used with it?**==

==Docker Swarm is an open-source container orchestration tool that is integrated with the Docker engine and CLI.==If you want to use Docker Swarm, you should use the `overlay` network driver. Using an overlay network enables the Swarm service by connecting multiple docker host daemons together.

**What are the possible ways of using insecure Docker image registries?**

In some projects, you might choose private Docker registries rather than Docker Hub or any cloud provider’s registry. This might take the form of deploying a Docker registry server, or perhaps a third-party on-premise registry server like Nexus.

When you want to connect these private registries, your registry should be secured with an SSL certificate in accordance with best practices.

You can also elect to use a private registry insecurely if you want to use self-signed SSL certificates—note, this should only be done for testing purposes. To do this, add your private test registry to an array as the value for the `"insecure-registries"` key in your `daemon.json` config file.

==**What is Docker Compose? What can it be used for?**==

==Docker Compose is a tool that lets you define multiple containers and their configurations via a YAML or JSON file.==

The most common use for Docker Compose is when your application has one or more dependencies, e.g., MySQL or Redis. Normally, during development, these dependencies are installed locally—a step that then needs re-doing when moving to a production setup. You can avoid these installation and configuration parts by using Docker Compose.

Once set up, you can bring all of these containers/dependencies up and running with a single `docker-compose up` command.