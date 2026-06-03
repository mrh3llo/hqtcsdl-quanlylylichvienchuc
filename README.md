# 📋 HTCSDL_Quan_ly_Lich_vien_Chuc

> **Civil Servant Personnel Record Management System** A comprehensive, normalized MySQL database system wrapped in a Dockerized PHP web application to efficiently manage civil servant records, automate HR workflows, and support seamless bulk data operations.
- **Language:** [![vietnamese](https://img.shields.io/badge/lang-vi-red.svg)](https://github.com/mrh3llo/hqtcsdl-quanlylylichvienchuc/blob/master/README.vi.md)
---

## 📌 Overview & Objectives

This repository contains the complete database design and containerized implementation for a civil servant personnel record management system. 

### 🎯 Key Objectives:
* **Structured Storage:** Build a highly normalized MySQL database to minimize redundancy and guarantee data integrity for institutional HR records.
* **Automated Business Logic:** Implement robust database-level logic using **Views**, **Triggers**, and **Stored Procedures**.
* **Streamlined Data Ingestion:** Enable robust batch data uploads from structured CSV formats.
* **Isolated Deployment:** Provide an enterprise-ready, local development runtime environment powered by **Docker Compose**.

---

## ✨ Features

* 🛠️ **Robust MySQL Schema:** Fully initialized relational database handling complex civil servant profiles.
* 📊 **Optimized Views:** Pre-compiled database views for fast, secure, and aggregated data reporting.
* ⚡ **Automated Triggers:** Real-time data validation and integrity constraints executed directly at the database layer.
* 💼 **HR Stored Procedures:** High-performance procedural scripts handling standard CRUD, promotions, and organizational shifts.
* 📥 **Automated Batch Importer:** Specialized PHP ingestion utility to automatically parse and seed datasets into MySQL.
* 🐳 **Docker-First Architecture:** Microservices setup orchestration (`MySQL 8.4`, `PHP/Apache`, and an ephemeral `Importer` service).

---

## 📂 Repository Structure

```text
├── 🐳 docker-compose.yaml      # Multi-container Docker orchestration manifest
├── 📦 dockerfile               # Custom PHP-Apache build with PDO MySQL extensions
├── 🗄️ DB/                     # Core Database Layer
│   ├── DB_innit.sql           # Core DDL schema definitions & tables
│   ├── DB_views.sql           # Relational view layers for clean reporting
│   ├── DB_triggers.sql        # Event-driven integrity rules
│   ├── DB_roles.sql           # User privileges & RBAC configuration
│   └── HR_procedure.sql       # High-level administrative operations
├── 🌐 src/                    # Web Application Layer
│   ├── index.php              # Application web entry point
│   ├── include/
│   │   └── db.inc.php         # PDO abstraction & database connection pool
│   └── Data/                  # Seeding & Data Utilities
│       ├── importdata.php     # Batch parsing execution engine
│       └── csv/               # Raw categorized datasets
└── 🧪 test/                   # Verification tools & testing scripts
```

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

💡 Usage & Maintenance Manual

### ⚙️ Automated Database Initialization Execution Order
When the containers start up, the relational schema builds deterministically using this exact execution layer order:
- `DB_innit.sql` (Tables & Primary Relationships)
- `DB_views.sql` (Aggregated Representation Layers)
- `DB_triggers.sql` (Automated Operational Validation Rules)
- `DB_roles.sql` (Security Context Clearances & Roles mappings)
- `HR_procedure.sql` (Functional API Layer endpoints)

### Data import
The `importer` service runs `php /var/www/html/Data/importdata.php` after the database is ready. It loads CSV data from `src/Data/csv/` into the database.

### 🔌 Manual Database Connectivity Debugging
If you need to enter the database engine directly via your host terminal context to review constraints:
```bash
mysql -h 127.0.0.1 -P ${MYSQL_PORT} -u root -p
```
## 📝 Architecture Guidelines
Database Credentials Config: Managed in centralized architecture inside src/include/db.inc.php. Keep synced with changes to the .env settings.

Race Condition Countermeasures: The database importer container uses a built-in delay script logic layer ensuring the mysql runtime loops have finalized table setups before data injection attempts begin.

## Notes
- The PHP application root is `src/index.php`.
- Database connection settings are maintained in `src/include/db.inc.php`.
- The importer container waits briefly before executing the import script to ensure MySQL is ready.

## 📐 System Architecture & Database Design
### 🗺️ Entity-Relationship Diagram (ERD)
Pleasae check out the file DRG for detail, as for the Database have too many entity to keep track of in a single picture.

## Conclusion
This project is a complete proof-of-concept for managing civil servant records with a MySQL backend and PHP frontend. It is designed for local development and testing using Docker Compose.
