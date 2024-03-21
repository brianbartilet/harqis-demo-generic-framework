# HARQIS Demo Generic Framework

## Introduction

- This is a demo project for [HARQIS-core](https://github.com/brianbartilet/harqis-core). 
- This can be used as a template for creating new projects and provide knowd.
- Please see the generated [README.md](demo/README.md) for detailed documentation of features and operations.

To get started with demo, follow these steps:

**Setup and Installation**:
   - Runs on Python 3.10 or greater.
   - Clone the repository
      ```sh
      git https://github.com/brianbartilet/harqis-core.git
      ```
   - Set up and activate virtual environment
      ```sh
      python -m venv venv
      source venv/bin/activate
      ```
   - Install the required packages using the requirements file for [HARQIS-core](https://github.com/brianbartilet/harqis-core) package
      ```sh
      pip install --upgrade pip
      pip install -r requirements.txt
      ```
- Run the demo script, this will copy files to the current directory from the `demo` directory:
     ```sh
     python get_started.py
     ```
- Run all available tests:
   ```sh
   pytest
   ```
## Full Documentation
- After successfully running `get_started.py` please see the generated [README.md](demo/README.md) for detailed documentation of features and operations.

## Getting Updates

- If you need to update the `harqis-core` package, run the following commands:
   ```bash
   pip uninstall harqis-core
   pip install -r requirements.txt
   ```
## Contact

For questions or feedback, please contact [brian.bartilet@gmail.com](mailto:brian.bartilet@gmail.com).

## License

**HARQIS-demo-generic-framework** is distributed under the [MIT License](LICENSE).