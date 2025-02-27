## Overview

The Budget Tracker Website is a web-based platform designed to complement the Kotlin Spending Tracker app, providing users with a seamless way to manage their finances from any device with a browser. Built with Ruby on Rails, Embedded Ruby for dynamic HTML, and Hotwire for enhanced interactivity, the website leverages AWS Aurora for secure and reliable backend storage.

---

## Features

### Core Features:
- **Expense Tracking:** Log and manage your expenses with a clean and user-friendly interface.
- **Data Visualization:** View spending patterns through graphs and charts rendered dynamically.
- **Cross-Platform Accessibility:** Access your financial data from any device, synchronized with the mobile app.
- **Secure Storage:** Data is securely stored and managed in AWS Aurora.
- **Interactive UI:** Hotwire provides a fast, real-time experience without full-page reloads.

### Additional Highlights:
- **Responsive Design:** Optimized for both desktop and mobile browsers.
- **Robust Backend:** Powered by Ruby on Rails and APIs for efficient data handling.
- **Synchronization:** Automatically syncs with the mobile app using the shared backend.

---

## Tech Stack

### Frontend
- **Framework:** Ruby on Rails (Embedded Ruby for dynamic views)
- **JavaScript Framework:** Hotwire for real-time interactivity
- **Styling:** Responsive design using modern CSS

### Backend
- **Database:** AWS Aurora PostgreSQL
- **APIs:** Custom REST APIs to interact with the cloud database

---

## Installation

### Prerequisites
- **Ruby Version:** Ensure you have Ruby 3.x or later installed.
- **Rails Version:** Rails 7.x or later.
- **Database:** Set up an AWS Aurora PostgreSQL instance.
- **AWS Account:** Configure credentials for AWS access.

### Steps
1. Clone the repository:
   ```bash
   git clone https://github.com/peterzdhuang/BudgetTrackerWebsite
   ```
2. Navigate to the project directory:
   ```bash
   cd BudgetTrackerWebsite
   ```
3. Install dependencies:
   ```bash
   bundle install
   ```
4. Set up the database:
   ```bash
   rails db:setup
   ```
5. Configure AWS credentials in `config/secrets.yml` or use environment variables.
6. Start the Rails server:
   ```bash
   rails server
   ```

Access the website at `http://localhost:3000`.

---

## Usage

### Initial Setup
1. Register an account or log in with existing credentials.
2. Begin logging your expenses and viewing financial data.

### Synchronization
- All data is synchronized with the mobile app through shared APIs and stored securely in AWS Aurora.

---

## Configuration

### AWS Aurora
1. Set up an AWS Aurora PostgreSQL instance.
2. Update `config/database.yml` with your database details.
3. Ensure the app has the necessary IAM permissions to interact with the database.

### Secrets Management
Use environment variables or Rails credentials to store sensitive information securely.

---

## Contributing

### Guidelines
1. Fork the repository.
2. Create a feature branch:
   ```bash
   git checkout -b feature/<feature-name>
   ```
3. Commit changes and push to your fork.
4. Open a pull request.

---

## Contact
For inquiries or support, please reach out to peterzdhuang@gmail.com.
```

Let me know if you'd like to add or modify any section!
