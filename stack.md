# GPT Management System - Current Stack

## Infrastructrue

Linux VPS

## Database: PostgreSQL

PostgreSQL was deployed as a standalone database (ie, not as a Docker container).

Postgres was chosen for its excellent scalability.

## Database Management - NocoDB

NocoDB is used for easy visual management of the underlying database and the generation of API endpoints.

## Backups

- Nightly incremental backup of the Postgres to object storage
- Nighly incremental backups of the VPS to object storage