from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
import time

driver = webdriver.Chrome()

driver.get("https://sso.8x8.com/v2/login")

driver.maximize_window()

user = driver.find_element(By.ID, "loginId")
user.send_keys("email")
user.send_keys(Keys.RETURN)
time.sleep(1)
password = driver.find_element(By.ID, "password")
password.send_keys("password")
password.send_keys(Keys.RETURN)
time.sleep(5)
button = driver.find_element(By.XPATH, '//*[@id="root"]/div/div[2]/div[2]/div[3]')
button.click()
time.sleep(5)


def current_window():
    x = driver.current_window_handle
    handles = driver.window_handles
    for window in handles:
        if window != x:
            driver.switch_to.window(window)
            break


current_window()

# button_dash = driver.find_element(By.XPATH, '//*[@id="root"]/div/div[2]/main/div[1]/div[1]/div[2]/div[
# 1]/div/div/div[2]/div/div/div[3]/div')

# button_dash.click()

# time.sleep(5)

# time.sleep(5)

button_side_menu = driver.find_element(By.XPATH, '//*[@id="root"]/div/div[2]/aside/div/div[1]/span/span')

button_side_menu.click()

driver.fullscreen_window()

program_running = True

# Refreshes Screen every 30 minutes as long as program is running.

while program_running is True:
    time.sleep(1800)
    driver.refresh()
    driver.maximize_window()
    time.sleep(2)
    button_side_menu = driver.find_element(By.XPATH, '//*[@id="root"]/div/div[2]/aside/div/div[1]/span/span')
    button_side_menu.click()
    driver.fullscreen_window()
