# Blood Bank and Donor Management System Portal

## Overview
LifeLine is a responsive Blood Bank and Donor Management System designed around the requested 3-month roadmap. The included browser demo is dependency-free: open `index.html` directly and use the demo accounts.

The ZIP also contains an industry-style PHP/MySQL-ready folder structure, SQL schema, controller/model placeholders, configuration guidance, and documentation placeholders.

## Demo accounts
- Admin: `admin@lifeline.test` / `admin123`
- Donor: `donor@lifeline.test` / `donor123`
- Hospital: `hospital@lifeline.test` / `hospital123`

## Implemented browser-demo features
- Role-based demo login: Admin, Donor, Hospital
- Dashboard cards and blood-group distribution
- Donor CRUD: add, edit, delete, search and blood-group filter
- Blood inventory tracking, expiry dates and low-stock indicators
- Blood request workflow: create, approve/reject, inventory deduction
- Appointment scheduling and cancellation
- Hospital records
- Blood camp management
- Notifications for requests, stock and appointments
- Reports with CSV export and JSON backup
- Print / Save as PDF through the browser
- Responsive layout
- LocalStorage persistence
- Form validation and confirmation prompts
- No external CDN or package dependency for the browser demo

## Run the demo
1. Extract the ZIP.
2. Open `index.html` in Chrome, Edge or Firefox.
3. Sign in with one of the demo accounts.
4. Data changes are stored in the browser's LocalStorage.

For PHP/MySQL deployment, use XAMPP/WAMP/LAMP and import `database/blood_bank.sql`.

## Production architecture
Frontend: HTML5 + CSS3 + JavaScript
Backend: PHP
Database: MySQL
Version control: Git/GitHub
Optional production libraries: Bootstrap 5 and Chart.js

## Important production security work
The standalone HTML is an educational/demo implementation. Before real deployment:
- Move authentication and authorization to PHP.
- Store passwords using `password_hash()` and verify with `password_verify()`.
- Use PHP sessions and server-side role checks.
- Use MySQL prepared statements/PDO.
- Add CSRF protection.
- Validate and sanitize every server-side input.
- Restrict upload MIME types and file sizes.
- Add audit logs, backups and database constraints.
- Do not store real medical records or donor credentials in browser LocalStorage.

## Folder structure
```text
BloodBankManagementSystem/
├── index.php
├── index.html
├── login.php
├── register.php
├── logout.php
├── admin/
├── donor/
├── hospital/
├── assets/
│   ├── css/
│   ├── js/
│   ├── images/
│   └── uploads/
├── config/
├── includes/
├── controllers/
├── models/
├── database/
├── reports/
├── documentation/
└── README.md
```

## Roadmap mapping
Month 1: planning, UI, authentication, donor management.
Month 2: inventory, blood requests, appointments, search/filter.
Month 3: dashboard, notifications, reports, testing and deployment.

## Database
See `database/blood_bank.sql` for tables:
users, admins, donors, hospitals, blood_inventory, donations, blood_requests, appointments, notifications, blood_camps, reports.

## License
Educational project template. Add your institution/company license before public distribution.
