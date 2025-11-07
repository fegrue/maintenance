# Project Overview

This project contains a set of scripts to automate the setup of a development environment. It is designed to be run within a Docker container to ensure a consistent and reproducible environment.

The main technologies used are:
*   **Docker:** For containerization.
*   **Shell scripting (bash & zsh):** For the setup automation.
*   **Python:** For a more user-friendly TUI to run the setup scripts.
*   **oh-my-zsh with powerlevel10k:** For shell customization.

The project is structured as follows:
*   `data/`: Contains user-specific configuration files.
*   `setup/`: Contains the individual setup scripts.
*   `tools/`: Contains helper scripts.
*   `Dockerfile` and `docker-compose.yml`: Define the Docker environment.
*   `GEMINI.md`: This documentation file.
*   `requirements.txt`: Python dependencies.
*   `setup.sh`: A bash script to run the setup.

## Building and Running

To build and run the environment, you can use Docker Compose:

```bash
docker compose up
```

This will build the Docker image and start a container. You will be dropped into a shell inside the container.

To run the setup, you have two options:

1.  **Interactive Python TUI:**
    ```bash
    python3 tools/setup.py
    ```
2.  **Bash script:**
    ```bash
    ./setup.sh
    ```

## Development Conventions

*   All scripts should be made executable. The `tools/make_executable.sh` script can be used for this.
*   New setup scripts should be placed in the `setup/` directory and have a `.sh` extension.
