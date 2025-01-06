# Gem Shop

![Gem Shop](./app/assets/images/gem_shop.jpg)

Gem Shop is an intentionally vulnerable Ruby on Rails 8 project for teaching developers about web application security. It is vulnerable to common security issues such as SQL injection, cross site scripting, and broken access control.

## Warning

Do not deploy this project on your production network. Attackers can exploit vulnerabilities in Gem Shop to access the underlying server, and can use this access to further compromise servers on your network. 

## Setup

Requirements:

```
Ruby >= 3.2.0 (for Rails 8)
sqlite3
```

## How to use this project

If you are already familiar with security issues such as SQL injection and XSS, you should be able to:

1. Find and exploit the vulnerabilities in this project
2. Fix the vulnerability 

See [self_guided.md](./docs/self_guided.md) if you want some guidance on where to get started. To simulate a real security assessment, do not look at the document and see how many security problems you can find. 

If you are not familiar with web application security, a full tutorial writeup is coming soon with recommended study material. 

Please feel free to open an issue if there is a vulnerability you would like to see included. 


## Project sponsor

Gem Shop is sponsored by [Paraxial.io](https://paraxial.io/), which helps developers secure their web applications. If you would like to improve the security of your own project, but don't know where to start, Paraxial.io can guide you through a roadmap to implement and automate common security controls. 
