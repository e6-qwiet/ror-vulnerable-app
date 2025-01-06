# Gem Shop Self Guided

This document assumes the reader is already familiar with web application security, and is able to find security bugs independently.

## Exercises

### 1. Cross site scripting (XSS)

Find the stored XSS vulnerability, trigger a JavaScript `alert(1)`, and write a brief explanation of how an attacker would use this vulnerability to harm users.


### 2. SQL injection

Find the SQL injection vulnerability, and use it to view the secret product. What else can an attacker do to cause harm to the application? 


### 3. Broken access control

Gem Shop has multiple instances of broken access control. Perform the following:

3.1. Lower the price of a product and then order it.

3.2. Remove a product from a different user's cart.

3.3. View an order placed by a different user.

### 4. Cross site request forgery (CSRF)

Find the CSRF vulnerability that allows an attacker to perform an action as a victim user. 


