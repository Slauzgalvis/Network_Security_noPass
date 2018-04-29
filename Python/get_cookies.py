#!/usr/bin/python3
from selenium import webdriver
from bs4 import BeautifulSoup

auth_username = 'tesotest22@gmail.com'
auth_password = 'super1234'

LOGIN_URL = 'http://www.fxwebsolution.com//demo/arthi/multivendor/sign-in.php'
SELENIUM_PATH = '/usr/local/share/phantomjs-1.9.8-linux-x86_64/bin/phantomjs'
driver = webdriver.PhantomJS(executable_path=SELENIUM_PATH)

def login_session():
    driver.get(LOGIN_URL)
    username = driver.find_element_by_id('exampleInputEmail1')
    password = driver.find_element_by_id('exampleInputPassword1')
    username.send_keys(auth_username)
    password.send_keys(auth_password)
    driver.find_element_by_name('loginuser').click()

login_session()

cookies = driver.get_cookies()[0]
f = open("cookies.txt","w+")
f.write(cookies['value'])
f.close()

