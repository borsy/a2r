""""

M A GY A R Á Z A T

A tia.py fájl elindítható parancssorból, és a telepített Selenium csomag lehetővé teszi a weboldal automatikus tesztelését felhasználói környezetben, a Chrome webböngészőn keresztül.
Rögzített parancsok által a felhasználói interakciókat szimulálja az oldalon történő regisztrálás, belépés, próbavásárlás mintája szerint.

"""
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from datetime import datetime
import time




driver = webdriver.Chrome()
driver.get("http://127.0.0.1:8000/")

#regisztráció

time.sleep(3)
current_date = datetime.now()
formatted_date = current_date.strftime("%Y\t%m%d")
reg_button = driver.find_element(By.XPATH, '//*[@id="register"]')
reg_button.click()
time.sleep(2)


username_fill = driver.find_element(By.XPATH, '//*[@id="username"]')
username_fill.send_keys("roborob")
time.sleep(1)

lastname_fill = driver.find_element(By.XPATH, '//*[@id="lastName"]')
lastname_fill.send_keys("robo")
time.sleep(1)

firstname_fill = driver.find_element(By.XPATH, '//*[@id="firstName"]')
firstname_fill.send_keys("rob")
time.sleep(2)

    
bdate_field = driver.find_element(By.ID,'birthdate')
bdate_field.send_keys(formatted_date)

postal_fill = driver.find_element(By.XPATH, '//*[@id="postal"]')
postal_fill.send_keys("4032")
time.sleep(1)

city_fil = driver.find_element(By.XPATH, '//*[@id="city"]')
city_fil.send_keys("Debrecen")

city_fil = driver.find_element(By.XPATH, '//*[@id="address"]')
city_fil.send_keys("Piac utca 6")

email_fill = driver.find_element(By.XPATH, '//*[@id="email"]')
email_fill.send_keys("roborob@test.com")
time.sleep(1)

pw_fill = driver.find_element(By.XPATH, '//*[@id="newPassword"]')
pw_fill.send_keys("asd123456789asd")
time.sleep(1)
pwc_fill = driver.find_element(By.XPATH, '//*[@id="password"]')
pwc_fill.send_keys("asd123456789asd")
#'//*[@id="registrationForm"]/div[3]/label'

cb_apr = driver.find_element(By.XPATH, '//*[@id="acceptPrivacyRegistration"]')
cb_apr.click()
time.sleep(4)

submit_button = driver.find_element(By.XPATH, '//*[@id="registrationForm"]/button')
submit_button.click()
time.sleep(4)

message_ok = driver.find_element(By.XPATH, '/html/body/div[2]/div/div[3]')
message_ok.click()

#bejelentkezés 

login_button = driver.find_element(By.XPATH, '//*[@id="login-button"]')
login_button.click()
time.sleep(2)
    
login_input = driver.find_element(By.XPATH, '//*[@id="username"]')
login_input.send_keys("roborob")
time.sleep(1)

pw_input = driver.find_element(By.XPATH, '//*[@id="password"]')
pw_input.send_keys("asd123456789asd")

submit_button = driver.find_element(By.XPATH, '//*[@id="loginForm"]/div/button')
submit_button.click()
time.sleep(1)
#próbavásárlás

time.sleep(1)
webshop_button = driver.find_element(By.XPATH, '//*[@id="webshop-button"]')
webshop_button.click()
time.sleep(2)

product1 = driver.find_element(By.XPATH, '/html/body/div/div[2]/div[1]/div[4]')
product1.click()
time.sleep(1)

product1 = driver.find_element(By.XPATH, '/html/body/div/div[2]/div[1]/div[4]')
product1.click()
time.sleep(1)

cat_change = driver.find_element(By.XPATH, '/html/body/div/div[1]/div[2]/div[2]/div[2]')
cat_change.click()
time.sleep(1)

product2 = driver.find_element(By.XPATH, '/html/body/div/div[2]/div[2]/div[4]')
product2.click()
time.sleep(1)

cat_change = driver.find_element(By.XPATH, '/html/body/div/div[1]/div[2]/div[2]/div[3]')
cat_change.click()
time.sleep(1)
product3 = driver.find_element(By.XPATH, '/html/body/div/div[2]/div[2]/div[4]')
product3.click()
time.sleep(2)

cart_button = driver.find_element(By.ID, 'cart')
cart_button.click()
time.sleep(4)

cir = driver.find_element(By.XPATH, '//*[@id="cart-container"]/div[1]/div[3]')
cir.click()
time.sleep(4)

order_button = driver.find_element(By.XPATH, '//*[@id="buy-cart-button"]')
order_button.click()

time.sleep(10)

# admin test