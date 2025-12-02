import os
import time

from selenium import webdriver


def get_chromedriver_path():
    driver_path = "/Users/prakash/Documents/WebAppAutomation/TestingWebApps/TestingWebApps/Driver/chromedriver"
    print(driver_path)
    return driver_path


def get_firefox_driver_path():
    driver_path = "/Users/prakash/Documents/WebAppAutomation/TestingWebApps/TestingWebApps/Driver/gecodriver"
    print(driver_path)
    return driver_path


def get_edge_driver_path():
    driver_path = "/Users/prakash/Documents/WebAppAutomation/TestingWebApps/TestingWebApps/Driver/msedgedriver"
    print(driver_path)
    return driver_path

def get_safari_driver_path():
    driver_path = "/Users/prakash/Documents/WebAppAutomation/TestingWebApps/TestingWebApps/Driver/safaridriver"
    print(driver_path)
    return driver_path


def get_chrome_options(headless_flag: bool, extension_path: str = None):
    options = webdriver.ChromeOptions()
    options.headless = headless_flag
    options.add_argument('--no-sandbox')
    options.add_argument('--disable-setuid-sandbox')
    options.add_argument("window-size=1400,600")
    options.add_argument('--safebrowsing-disable-download-protection')
    options.add_argument("ignore-certificate-errors")
    options.add_argument("--use-fake-ui-for-media-stream")
    # Enable microphone
    options.add_argument("--allow-file-access-from-files")
    # Disable automation info bar
    options.add_argument("--disable-infobars")
    # Disable Chrome being detected as automated
    options.add_argument("--disable-blink-features=AutomationControlled")
    # Disable any image verification popups if Chrome displays them
    options.add_argument("--disable-notifications")
    # Disable extensions which sometimes cause popups
    options.add_argument("--disable-extensions")

    options.add_argument("--disable-infobars")
    # Disable "AutomationControlled" to make the bot harder to detect
    # Use incognito mode (sometimes reduces tracking and detection)
    options.add_argument("--incognito")
    # Disable extensions, which can help reduce unwanted popups
    options.add_argument("--disable-extensions")
    # Run in headless mode (optional, may help avoid some detections)
    
    # Turn off GPU to reduce system resources in headless mode
    options.add_argument("--disable-gpu")
    # Set a user-agent string (use a common, realistic one)
    options.add_argument("user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.198 Safari/537.36")
    
    Current_dir = os.path.abspath(os.curdir) + os.sep + "TestingWebApps" + os.sep + "Downloads"
    chrome_pref = {}
    chrome_pref["download.default_directory"] = Current_dir
    chrome_pref["safebrowsing.enabled"] = True
    chrome_pref["profile.default_content_setting_values.automatic_downloads"] = 1
    chrome_pref["prompt_for_download"] = False
    options.add_experimental_option("prefs", chrome_pref)
    if extension_path:
        options.add_extension(extension_path)
    return options

def get_firefox_options(headless_flag: bool):
    options = webdriver.FirefoxOptions()
    options.headless = headless_flag
    options.add_argument('--no-sandbox')
    options.add_argument('--disable-setuid-sandbox')
    options.set_preference("browser.download.useDownloadDir", True)
    options.set_preference("browser.download.folderList", 2)
    Current_dir = os.path.abspath(os.curdir) + os.sep + "TestingWebApps" + os.sep + "Downloads"
    options.set_preference("browser.download.dir", Current_dir)
    return options


def get_edge_options(headless_flag: bool):
    options = webdriver.EdgeOptions()
    options.headless = headless_flag
    options.add_argument('--no-sandbox')
    options.add_argument('--disable-setuid-sandbox')
    Current_dir = os.path.abspath(os.curdir) + os.sep + "TestingWebApps" + os.sep + "Downloads"
    edge_pref = {}
    edge_pref["download.default_directory"] = Current_dir
    edge_pref["safebrowsing.enabled"] = False
    edge_pref["profile.default_content_setting_values.automatic_downloads"] = 1
    edge_pref["prompt_for_download"] = False
    options.add_experimental_option("prefs", edge_pref)
    return options

def get_safari_options(headless_flag: bool):
    options = webdriver.SafariOptions()
    options.headless = headless_flag
    options.add_argument('--no-sandbox')
    options.add_argument('--disable-setuid-sandbox')
    Current_dir = os.path.abspath(os.curdir) + os.sep + "TestingWebApps" + os.sep + "Downloads"
    edge_pref = {}
    edge_pref["download.default_directory"] = Current_dir
    edge_pref["safebrowsing.enabled"] = False
    edge_pref["profile.default_content_setting_values.automatic_downloads"] = 1
    edge_pref["prompt_for_download"] = False
    # options.add_experimental_option("prefs", edge_pref)
    return options
