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
   git clone <repository-url>
   ```
2. Navigate to the project directory:
   ```bash
   cd LeanTechnologyProject
   ```
3. Install the dependencies:
   ```bash
   pip install -r requirements.txt
   ```

## Running Tests
To execute the test cases, run the following command:
```bash
robot Tests/SauceLab/SauceDemo.robot
```

## Project Features
- Automated login and checkout flow for Sauce Demo.
- Random product selection and price verification.
- End-to-end test coverage with detailed logs and reports.
