## Environment Setup
1. **Prerequisites:** Ensure Docker and Docker Compose are installed on your virtual machine.
2. **Configuration:** Map your local IP to `aaitabde.42.fr` in your `/etc/hosts` file[cite: 1].
3. **Secrets:** Create a `.env` file in `srcs/` for environment variables[cite: 1]. Store passwords in local files (e.g., `db_password.txt`) and configure them as Docker secrets in `docker-compose.yml`[cite: 1].

## Building and Launching
* The `Makefile` at the repository root drives the deployment[cite: 1].
* Run `make` to execute `docker-compose.yml`, which triggers the building of custom Dockerfiles for each service and launches the network[cite: 1]. Pre-built application images (except the Alpine/Debian base) are strictly prohibited[cite: 1].

## Container and Volume Management
* Build images: `docker compose build`
* Start containers: `docker compose up -d`
* View logs: `docker compose logs -f`
* Stop containers: `docker compose down -v`

## Data Storage and Persistence
Data persists using Docker named volumes configured to store files in `/home/aaitabde/data` on the host machine[cite: 1].
* **WordPress Database Volume:** Stores MariaDB files[cite: 1].
* **WordPress Files Volume:** Stores website assets and PHP files[cite: 1].
Bind mounts are not allowed; volumes must be strictly managed as Docker named volumes[cite: 1].
