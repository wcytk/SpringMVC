# SpringMVC
This is a WebStie Using SpringMVC framework.  
The Environment: Jdk 1.8, Apache Tomcat 9.0.12, Intellij Idea.  

## *The Website have fallowing features.*

### 1. Admin

For admin, the ability to add, delete, change and find user and goods.

### 2. User

For user, only the ability to add, delete, change and find goods.

### 3. Goods

A waterfall designed page for goods review.(We haven't finished the shopping cart)

## **The functions we have realized**

### Register

Using Ajax for databases check if there are same username or email.  
Using MailSender to send identify code.  

### Login

Tow Types of user, admin and ordinary user.

### Interceptor

Using INtercepter to check for session. Without Login, the pages cannont be acheived.(Also the differences between Admin and User)

### Log

Using Log4j2 to record logs, defaults logs path is in D://logs/user

## ***The functions to be realized***

### The Shopping cart

To build a real shopping website we need a real Shopping cart.

### Difference user goods

We haven't split up different users, which means the goods in databases are shared. So any user can modify evey goods, which is obvious not our intention.

## ***Default Value***

Databases: Username: root Password: 666  
Default Mail: wcytk@outlook.com

Notice: You should change to your own database and Email in applicationContext.xml

### ***Contact Me: wcytk@outlook.com***
