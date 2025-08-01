# Quickstart Guide

## Prerequisites

- Docker (20.10+)
- Docker Compose (v1.29+ or Compose v2 plugin)

## Recommended

- [Docker Desktop](https://www.docker.com/products/docker-desktop/)  
  *Includes Docker and Docker Compose plus a GUI for managing containers.*

- [VS Code](https://code.visualstudio.com/) (recommended for integrated development)  
  If you plan to work with notebooks inside VS Code, install these extensions:  
  - [Jupyter](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter)  
  - [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python)  
  - [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)


---

## 1. Clone the Repository

You can clone using git in a terminal:

```bash
git clone https://github.com/JamesAFarrell/sparkhive-lab.git
cd sparkhive-lab
```

Or download the ZIP archive from GitHub, extract it, and open the extracted folder in VS Code.

> **Opening a Terminal in VS Code:**  
> You can open an integrated terminal in VS Code by pressing one of the following shortcuts depending on your system and keyboard:  
> - ``Ctrl + ` `` (backtick)  
> - `Ctrl + J`  
> - `Ctrl + Shift + '`  
> - `View` > `Terminal` menu  

---

## 2. Build the Docker Images

Make sure Docker Desktop is running before building. You will only need to build once.

```bash
docker-compose build
```

---

## 3. Start the Environment

Run the environment in foreground:

```bash
docker-compose up
```

Or run in detached mode (in the background):

```bash
docker-compose up -d
```

## 4. Using the Environment

Once the environment is running, you have two main ways to interact with your PySpark notebooks:

### 4.1 Using Jupyter Lab in the Browser

- Open your browser and navigate to: [http://localhost:8888](http://localhost:8888)  
- You will see the Jupyter Lab interface where you can create and run notebooks.  
- No token is required by default.  
- This is the fastest way to get started.

### 4.2 Using VS Code to Connect to the Jupyter Kernel

For a more integrated experience, you can connect VS Code directly to the running Jupyter kernel inside Docker.

#### How to connect:

1. Open **VS Code** in the repository folder.
2. Ensure the **Jupyter** and **Python** extensions are installed.  
3. Open or create a `.ipynb` notebook.  
4. Click **Select kernel** (top right of the notebook).
5. Choose **Select another kernel** → **Existing Jupyter Server**
6. Enter the following URL and press `Enter`:
```
http://localhost:8888
```
7. If prompted about connecting without a token over HTTP, click `Yes`.
8. Optionally enter a display name (e.g., `localhost`) or leave it blank which defaults to the URL.
9. Select `Python 3 (ipykernel)` from the list.
10. Run notebook cells with the Spark and Hive environment inside Docker.

> **Note:** Ensure Docker Desktop and containers are running before connecting. If issues occur, restart Docker or VS Code.

## 5. Stopping the Environment

- If running in foreground mode, press `Ctrl + C` in the terminal twice to stop.
- If running in detached mode, stop containers with:

```bash
docker-compose down
```

Alternatively, you can stop and manage containers visually using Docker Desktop by clicking the stop button under the `Containers` tab.

---


