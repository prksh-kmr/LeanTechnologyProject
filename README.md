# Lean Technology Project

## Overview
This project automates the end-to-end flow of the Sauce Demo application using Robot Framework and Selenium.

## Project Structure
```
LeanTechnologyProject/
├── Resources/
│   ├── Function/
│   ├── SauceLab/
│   └── Similar/
├── Tests/
│   └── SauceLab/
├── Driver_Resources/
├── WebReports/
└── requirements.txt
```

## Requirements
- Python 3.x
- Robot Framework
- Selenium

## Installation
1. Clone the repository:
   ```bash
   `git clone https://github.com/prksh-kmr/LeanTechnologyProject.git`
   ```
2. Navigate to the project directory:
   ```bash
   `cd LeanTechnologyProject`
   ```
3. Install the dependencies:
   ```bash
   `pip install -r requirements.txt`
   ```

## Running Tests
1. Open a terminal and navigate to the project directory.
2. Run the test suite using the following command:
```bash
robot Tests/SauceLab/SauceDemo.robot
```
3. After execution, reports will be generated in the `WebReports/` folder:
   - `log.html`: Detailed execution log.
   - `report.html`: Summary report.
   - `output.xml`: XML output for further processing.

## Project Features
- Automated login and checkout flow for Sauce Demo.
- Random product selection and price verification.
- End-to-end test coverage with detailed logs and reports.
