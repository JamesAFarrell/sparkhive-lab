# sparkhive-lab

A local development environment for working with Apache Spark, Delta Lake, and Hive using Docker.
It includes Apache Spark 3.5, Delta Lake 3.2, a Hive Metastore backed by MySQL, and a JupyterLab notebook interface.

## Overview

`sparkhive-lab` provides a portable and beginner-friendly workspace for experimenting with PySpark and Delta Lake locally. It is ideal for users working in secure data environments who want to prototype or train with Spark technologies.

### Key Features

- Familiar **Jupyter Notebook** interface via Jupyter Lab or VS Code Jupyter extention
- Integrated **Delta Lake** support for transactional tables
- Hive Metastore with MySQL for managing **database + table metadata**
- Docker volumes to persist workspace notebooks/scripts, Delta tables and database metadata
- Simple Docker Compose setup

## Architecture

| Service         | Description                                              |
|-----------------|----------------------------------------------------------|
| **spark-notebook** | Jupyter + PySpark + Delta Lake environment                 |
| **hive-metastore** | Apache Hive service managing metadata via MySQL            |
| **metastore-db**   | MySQL database storing Hive metastore metadata             |

All configuration files, including `docker-compose.yml`, are located in the `docker/` folder for separation from user workspace.

## Getting Started

- See [Quickstart Guide](/docs/quickstart.md) for detailed setup instructions, usage options, and VS Code integration.
- Explore the [Demo Notebooks](/docs/demos.md) for example notebooks showcasing the environment and common Pyspark workflows.
- Check [Troublshooting](/docs/troubleshoot.md) for help with common startup errors or Jupyter connection problems.

## Local Service URLs

- **Jupyter Lab:** [http://localhost:8888](http://localhost:8888)  
- **Spark UI:** [http://localhost:4040/jobs/](http://localhost:4040/jobs/)

## Support

For issues or questions, please open an issue on the GitHub repository.

## Security Disclaimer

This project opens local ports (e.g., `8888` for Jupyter, `4040–4042` for Spark UI, `9083` for Hive Metastore, and `3306` for MySQL) as part of how its services interconnect.

By default, these services are only accessible from your own machine (e.g., `http://127.0.0.1:8888`) and do not expose data to the internet. However, if your firewall or network configuration allows external access, other devices on the same network may be able to reach these ports — potentially exposing data or enabling code execution.

Do not use this project on untrusted networks or with sensitive data. The developers are not responsible for any security issues resulting from insecure setup or misuse.

---

## License

Licensed under the [MIT License](/LICENSE) — free to use, modify, and distribute with attribution.




