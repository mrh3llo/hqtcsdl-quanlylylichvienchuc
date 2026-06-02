# HTCSDL_Quan_ly_Lich_vien_Chuc

## Project Report

### Overview
This repository contains the database design and implementation for a civil servant personnel record management system. It includes schema definitions, initialization scripts, stored procedures, triggers, data import utilities, and a PHP web application interface.

### Objectives
- Build a normalized MySQL database for managing personnel records.
- Provide database views, triggers, and stored procedures for business logic.
- Support bulk data import from CSV sources.
- Make the system runnable in a Docker-based PHP + MySQL environment.

## Features
- MySQL database schema and initialization scripts
- Database views and triggers for data consistency
- Stored procedures for HR operations
- Data import script for batch CSV upload
- PHP web application entry point at `src/index.php`
- Docker Compose orchestration for MySQL, PHP/Apache, and importer services

## Repository Structure
- `docker-compose.yaml` — defines MySQL, PHP web server, and importer containers
- `dockerfile` — builds the PHP/Apache container with PDO MySQL support
- `DB/` — SQL scripts for schema, views, triggers, roles, and procedures
- `src/` — PHP application source code
- `src/Data/importdata.php` — script to import CSV data into the database
- `src/Data/csv/` — imported CSV dataset organized by categories
- `src/include/db.inc.php` — database connection helper
- `test/` — test artifacts and MySQL command examples

## Requirements
- Docker Engine
- Docker Compose
- Optional: local PHP and MySQL for manual execution

## Setup

### 1. Clone the repository
```bash
git clone https://link-to-project
cd hqtcsdl-quanlylichvienchuc
```

### 2. Configure environment variables
Create a `.env` file or export variables for Docker Compose. Required variables:
- `MYSQL_ROOT_PASSWORD` — root password for MySQL
- `MYSQL_PORT` — local port for MySQL access (for example `3306`)
- `PHP_PORT` — local port for the PHP web server (for example `8080`)

Example `.env` file:
```ini
MYSQL_ROOT_PASSWORD=your_root_password
MYSQL_PORT=3306
PHP_PORT=8080
```

### 3. Start the application with Docker Compose
```bash
docker compose up -d
```

This starts three services:
- `mysql` — MySQL 8.4 database server
- `php` — PHP/Apache web server hosting `src/`
- `importer` — imports CSV data once the database is available

### 4. Verify the services
```bash
docker compose ps
```

### 5. Access the web application
Open a browser and visit:
```text
http://localhost:8080
```

## Usage

### Database initialization
MySQL is initialized automatically by Docker Compose using SQL files mounted into `/docker-entrypoint-initdb.d/`.
Included scripts are:
- `DB/DB_innit.sql`
- `DB/DB_views.sql`
- `DB/DB_triggers.sql`
- `DB/DB_roles.sql`
- `DB/HR_procedure.sql`

### Data import
The `importer` service runs `php /var/www/html/Data/importdata.php` after the database is ready. It loads CSV data from `src/Data/csv/` into the database.

### Manual database access
If you need to connect manually:
```bash
mysql -h 127.0.0.1 -P ${MYSQL_PORT} -u root -p
```

## Notes
- The PHP application root is `src/index.php`.
- Database connection settings are maintained in `src/include/db.inc.php`.
- The importer container waits briefly before executing the import script to ensure MySQL is ready.

## Conclusion
This project is a complete proof-of-concept for managing civil servant records with a MySQL backend and PHP frontend. It is designed for local development and testing using Docker Compose.
