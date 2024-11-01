# Inception 42

A work-in-progress project aimed at deploying a WordPress website with a MariaDB database using Docker. This project leverages **Docker Compose** for managing containers and setting Wordpress website.

---

## About the Project

**Inception 42** is 42 school projects that consist of making a system that uses docker to deploy a WordPress application with a MariaDB backend using nginx. This setup is an ideal process of development and deployment of Wordpress.

### Technologies
- **Docker**: For containerizing the application and services.
- **Docker Compose**: For defining and managing multi-container Docker applications.
- **WordPress**: The content management system (CMS) running in the application container.
- **MariaDB**: A relational database management system (RDBMS) running in the database container.
- **Nginx**: A HTTP server that server the Wordpress site to browser clients.

---

## Installation

### Prerequisites
Ensure you have **Docker** and **Docker Compose** installed:
- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

### Steps

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/inception-42.git
2. **Lunch the Docker Compose with Makefile**:
   ```bash
   make
