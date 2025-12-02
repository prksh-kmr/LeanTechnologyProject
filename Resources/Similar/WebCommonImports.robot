*** Settings ***
Library     SeleniumLibrary
Library     Collections
Library     String
Library     ../../../LeanTechnologyProject/Driver_Resources/webdriver.py
Library     ../../../LeanTechnologyProject/Resources/Function/PythonFunctions.py
Resource    ../../../LeanTechnologyProject/Driver_Resources/DriverResource.robot
Resource    WebAppKeywords.robot
Resource    WebAppVariables.robot
# Resource    ${CURDIR}/WebAppKeywords.robot
# Resource    ${CURDIR}/WebAppVariables.robot

#sauce demo
Resource    ../../../LeanTechnologyProject/Resources/SauceLab/SauceDemoWebAppKeywords.robot
Resource    ../../../LeanTechnologyProject/Resources/SauceLab/SauceDemoWebAppVariables.robot