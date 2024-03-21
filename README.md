# HARQIS Demo Generic Framework

## Introduction

- This is a demo project for [HARQIS-core](https://github.com/brianbartilet/harqis-core). 
- This can be used as a template for creating new projects and provide knowledge of basic operations of fixtures and templates.
- Please see the generated [README.md](demo/README.md) for detailed documentation of features and operations.

## Getting Started
**Setup and Installation**:
   - Runs on Python 3.10 or greater.
   - Clone the repository
      ```sh
      git https://github.com/brianbartilet/harqis-core.git
      ```
   - Set up and activate the virtual environment.
      ```sh
      python -m venv venv
      source venv/bin/activate
      ```
   - Install the required packages using the requirements file for [HARQIS-core](https://github.com/brianbartilet/harqis-core) package.
      ```sh
      pip install --upgrade pip
      pip install -r requirements.txt
      ```
- Run all available tests.
     ```sh
     pytest
     ```
**Generate The Demo**:     
- Run the `get_started.py` script, this will add the `demo` directory along with templates and docs.
     ```sh
     python get_started.py
     ```
- The `demo` directory is added in the `.gitignore` file.
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
