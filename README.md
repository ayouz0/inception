*This project has been created as part of the 42 curriculum by aaitabde.*[cite: 1]

## Description
This project aims to broaden system administration knowledge by virtualizing several Docker images within a personal virtual machine[cite: 1]. The infrastructure consists of specific services (NGINX, WordPress + php-fpm, and MariaDB) running in dedicated containers, built from Alpine or Debian, and orchestrated via Docker Compose[cite: 1].

### Design Choices & Comparisons
* **Virtual Machines vs Docker:** Virtual machines virtualize the entire hardware and require a full guest operating system, making them resource-heavy. Docker virtualizes the OS kernel, allowing lightweight containers to share the host OS while remaining isolated.
* **Secrets vs Environment Variables:** Environment variables are stored in plain text (e.g., in a `.env` file) and can be exposed in logs or system states[cite: 1]. Docker secrets encrypt sensitive information and mount it securely in a temporary filesystem, making them safer for credentials[cite: 1].
* **Docker Network vs Host Network:** The host network mode shares the host's networking namespace, exposing all container ports directly. A custom Docker network provides DNS resolution between containers and isolates them, only exposing specific ports (like 443 for NGINX) to the outside[cite: 1]. 
* **Docker Volumes vs Bind Mounts:** Bind mounts map a specific host path to a container, heavily depending on the host's directory structure. Docker named volumes are managed entirely by Docker, abstracting the host filesystem and providing better portability for persistent data like databases and website files[cite: 1].

## Instructions
1. Ensure your `.env` and secret files are correctly placed in the `srcs` directory[cite: 1].
2. Run `make` at the root of the repository to build the Docker images and start the containers[cite: 1].
3. The application will be available at `https://aaitabde.42.fr`[cite: 1].

## Resources
* Docker documentation
* NGINX, MariaDB, and WordPress configuration guides
* **AI Usage:** [ai was used in making this readme and for pulling docker and nginx documentation][cite: 1].
