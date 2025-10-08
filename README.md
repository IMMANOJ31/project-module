# 🧩 Project Modules

This repository contains the common modules used across multiple Spring MVC-based applications.  
The goal of this project is to centralize reusable functionalities such as email configuration, OTP generation, and data encryption — built using Spring MVC architecture for modularity and scalability.

---

## 🚀 Key Features

### 🔐 Encryption Module
- Provides secure encryption and decryption utilities for sensitive data (e.g., passwords, tokens).
- Uses standard Java encryption libraries integrated into Spring components.

### ✉️ Mail Configuration
- Centralized mail setup for sending transactional or verification emails.
- Configurable SMTP properties via `application.properties`.
- Supports HTML-based email templates.

### 🔢 OTP Generation
- Dynamically generates secure.
- Useful for authentication, verification, and password reset flows.

---

## 🏗️ Architecture Overview

This project follows the Spring MVC architecture, which ensures:
- Separation of Concerns: Controllers, Services, and DAOs are logically separated.
- Dependency Injection via Spring Beans.

