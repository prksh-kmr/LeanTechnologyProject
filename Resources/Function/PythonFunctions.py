import random
import string
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.remote.webelement import WebElement
from selenium.common.exceptions import NoSuchElementException
from selenium.webdriver.common.by import By
from datetime import timedelta, datetime, date
import string
import random

try:
    from robot.libraries.BuiltIn import BuiltIn
    from robot.libraries.BuiltIn import _Misc
    import robot.api.logger as logger
    from robot.api.deco import keyword

    ROBOT = False
except Exception:
    ROBOT = False

@keyword("Return Current Driver Instance")
def return_current_driver_instance():
    # returns current driver instance
    se2lib = BuiltIn().get_library_instance('SeleniumLibrary')
    return se2lib.driver

@keyword("Convert Web Elements Into String List")
def convert_web_elements_into_string_list(web_elements: list[WebElement]):
    string_list = []
    for ele in web_elements:
        string_list.append(ele.text.strip())
    return string_list

@keyword("Extract Random Item From List")
def extract_random_item(lst):
    item = random.choice([x for x in lst if x != "None"])
    return str(item)

@keyword("Click Using Actions")
def click_using_actions(ele):
    driver = return_current_driver_instance()
    ActionChains(driver).move_to_element(ele).click(ele).perform()

@keyword("Verify Element In Page")
def verify_element_in_page(xpath: str):
    if xpath.__contains__("xpath:"):
        xpath = xpath.replace("xpath:", "").strip()
    driver = return_current_driver_instance()
    try:
        driver.find_element(By.XPATH, xpath)
    except NoSuchElementException:
        return False
    return True

@keyword("Check if String Contains Substring")
def check_if_string_contains_substring(string, substring):
    return substring in string

@keyword("Count List Items")
def count_items(input_list):
    return len(input_list)

@keyword("Generate Custom String")
def generate_custom_string(length=10):
    letters_and_digits = string.ascii_letters + string.digits
    return ''.join(random.choice(letters_and_digits) for i in range(length))

@keyword("Process Text")
def process_text(input_text, text_to_remove):
    # Remove the specified text
    cleaned_text = input_text.replace(text_to_remove, "").strip()
    # Remove newlines and split into words
    words = cleaned_text.splitlines()
    # Return the list of words, ensuring each word is stripped of extra spaces
    return [word.strip() for word in words if word.strip()]