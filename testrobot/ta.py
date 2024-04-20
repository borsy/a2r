""""

M A GY A R Á Z A T

A ta.py fájl elindítható parancssorból, és a telepített Selenium csomag lehetővé teszi a weboldal automatikus tesztelését felhasználói környezetben, a Chrome webböngészőn keresztül.
Rögzített parancsok által a felhasználói interakciókat szimulálja az admin oldalon, ahol a megrendeléseket tartjuk számon.

"""
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
import time


#navigáció

driver = webdriver.Chrome()
driver.get("http://127.0.0.1:8000/")

#bejelentkezés 
time.sleep(2)
login_button = driver.find_element(By.XPATH, '//*[@id="login-button"]')
login_button.click()
time.sleep(2)
    
login_input = driver.find_element(By.XPATH, '//*[@id="username"]')
login_input.send_keys("admin")
time.sleep(1)

pw_input = driver.find_element(By.XPATH, '//*[@id="password"]')
pw_input.send_keys("admin")

submit_button = driver.find_element(By.XPATH, '//*[@id="loginForm"]/div/button')
submit_button.click()
time.sleep(4)

#átirányítás

driver.get("http://127.0.0.1:8000/megrendelesek")
time.sleep(4)

#weboldal interakciók

active_button = driver.find_element(By.XPATH, '/html/body/div[1]/div[2]/a[1]')
active_button.click()
time.sleep(4)

active_order_button = driver.find_element(By.XPATH, '/html/body/div[2]/div[1]/a')
active_order_button.click()
time.sleep(4)

history_button = driver.find_element(By.XPATH, '/html/body/div[1]/div[2]/a[2]')
history_button.click()
time.sleep(8)

home_button = driver.find_element(By.XPATH, '/html/body/div[1]/div[2]')
home_button.click()
driver.get("http://127.0.0.1:8000/")
time.sleep(10)

#zárás

about_button = driver.find_element(By.XPATH, '//*[@id="about-button"]')
about_button.click()
time.sleep(120)

divs = driver.find_elements(By.XPATH, "//div[@class='about-container']//div")

actions = webdriver.ActionChains(driver)


for div in divs:
    actions.move_to_element(div).perform()


time.sleep(4)
driver.quit()