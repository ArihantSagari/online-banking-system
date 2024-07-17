![online banking ss](https://github.com/user-attachments/assets/7321f894-9681-4f86-b4a0-f537dd65131b)
# Online Banking System

## Overview
This is an online banking system designed to manage banking operations such as user registration, login, account management, and transactions. The project includes features such as user dashboards, transaction history, and an admin panel for managing users and accounts. The goal is to create a realistic banking web application.

## Features
- **User Registration and Login**
- **Automatic Account Number Generation**
- **User Dashboard**
  - Change Password
  - View Account Information
  - Perform Transactions (Deposit, Withdrawal, Transfer, Debit)
- **Transaction History**
- **Responsive Design**

## Technologies Used
- **Java**
- **Servlets**
- **MySQL**
- **HTML, CSS, JavaScript, Bootstrap**

## Setup Instructions

1. **Clone the repository:**
    ```bash
    git clone https://github.com/yourusername/online-banking-system.git
    ```

2. **Navigate to the project directory:**
    ```bash
    cd online-banking-system
    ```

3. **Setup the database:**
    - Create a MySQL database named `OnlineBankingSystem`.
    - Run the SQL scripts provided in the `db` folder to set up the tables.

4. **Configure the application:**
    - Update the `application.properties` file with your MySQL database credentials.

5. **Deploy the application:**
    - Deploy the application on a servlet container like Apache Tomcat.

## Usage
- Access the application at `http://localhost:8080`.
- Register a new user or log in with an existing account.
- Use the dashboard to manage your account and perform transactions.
- Admin can log in to the admin panel to manage users and accounts.

## Contributing
Contributions are welcome! Please open an issue or submit a pull request for any improvements.

## License
This project is licensed under the MIT License.
