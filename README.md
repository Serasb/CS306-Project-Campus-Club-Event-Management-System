# 🎓 CS306 — Campus Club Event Management System

A database-driven web application developed for the **CS306 Database Systems** course at **Sabancı University**.

The project provides a centralized platform for managing university clubs, students, events, venues, memberships, sponsors, donations, event registrations, and support tickets.

The system was developed using **PHP** and **MySQL/MariaDB**, with a focus on relational database design, SQL operations, stored procedures, triggers, and referential integrity.

---

## 📌 Project Overview

University club activities involve many different entities such as students, clubs, events, venues, sponsors, and registrations.

The purpose of this project is to bring these components together in a structured relational database and provide a web-based interface for interacting with the system.

The database models relationships between:

* 👨‍🎓 Students
* 🏫 Schools
* 🎭 Campus Clubs
* 📅 Events
* 📍 Venues
* 🤝 Club Memberships
* 🎟️ Event Registrations
* 💰 Sponsors & Donations
* 🎫 Support Tickets
* 💬 Ticket Comments

---

## ✨ Main Features

### 🎭 Club & Event Management

Campus clubs and their events are stored and managed through the database.

Each event is associated with a **club** and a **venue**, allowing the system to organize event information such as:

* Event name
* Date
* Time
* Organizing club
* Venue

A stored procedure is also provided to retrieve all events organized by a specific club.

---

### 👨‍🎓 Student & Membership Management

Students are stored with information such as their:

* Student ID
* Name
* Email
* Department

The system keeps track of both **school registrations** and **club memberships**, allowing students to be associated with universities and campus clubs.

---

### 🎟️ Event Registration

Students can register for events through the event registration system.

Registrations connect students and events while also storing the registration date.

A dedicated stored procedure is included to handle student event registrations.

---

### 📍 Venue Management

Events are connected to venues stored in the database.

Each venue contains information about:

* Venue name
* Capacity
* Location

This allows event information to remain connected to the physical locations where activities take place.

---

### 💰 Sponsors & Donations

The system also models the financial relationship between campus clubs and external sponsors.

Sponsors have their own budgets, while donations connect a **sponsor** to a **club** and record:

* Donation amount
* Donation date

A database trigger automatically prevents newly inserted sponsor budgets from being negative by converting negative values to `0`.

---

### 🎫 Support Ticket System

The application includes a support ticket module where users can submit problems or questions.

Each ticket stores:

* Username
* Message
* Status
* Creation time

Administrators can respond through a separate **ticket comments** system.

Comments are linked directly to their corresponding tickets, and deleting a ticket automatically removes its related comments through `ON DELETE CASCADE`.

---

## 🗄️ Database Structure

The relational database contains the following main tables:

| Table             | Description                              |
| ----------------- | ---------------------------------------- |
| `student`         | Stores student information               |
| `school`          | Stores university/school information     |
| `club`            | Stores campus clubs                      |
| `event`           | Stores club events                       |
| `venue`           | Stores event venues and capacities       |
| `membership`      | Connects students with clubs             |
| `s_registration`  | Connects students with schools           |
| `e_registration`  | Stores student event registrations       |
| `sponsor`         | Stores sponsor information and budgets   |
| `donation`        | Records donations from sponsors to clubs |
| `tickets`         | Stores support requests                  |
| `ticket_comments` | Stores responses to support tickets      |

---

## 🔗 Database Relationships

The database uses **primary keys, composite keys, and foreign keys** to maintain relationships between entities.

Some of the main relationships are:

```text
School ──────< Club
   │
   └──────< School Registration >────── Student

Student ────< Membership >───────────── Club

Club ───────< Event >────────────────── Venue

Student ────< Event Registration >───── Event

Sponsor ────< Donation >─────────────── Club

Ticket ─────< Ticket Comments
```

These relationships help maintain **referential integrity** throughout the system.

---

## ⚙️ Stored Procedures

The database includes stored procedures for commonly used operations.

### `list_club_events`

Returns the events organized by a specified club together with their venue information.

### `register_student_to_event`

Registers a student for a selected event and stores the registration date.

Using stored procedures allows frequently used database operations to be encapsulated directly inside the database.

---

## ⚡ Database Triggers

The project also demonstrates automatic database-side validation using triggers.

### `trg_sponsor_budget_fix`

Executed before inserting a sponsor.

If the entered sponsor budget is negative:

```sql
IF NEW.budget < 0 THEN
    SET NEW.budget = 0;
END IF;
```

This prevents newly inserted sponsor records from starting with an invalid negative budget.

### `trg_student_name_default`

Executed before inserting a student.

If the student's name is empty or `NULL`, the database automatically assigns:

```text
Unknown
```

This provides a default value instead of leaving the student name empty.

---

## 🔐 Data Integrity

Several mechanisms are used to maintain database consistency:

* 🔑 Primary Keys
* 🔗 Foreign Keys
* 🧩 Composite Primary Keys
* ⚡ Triggers
* ⚙️ Stored Procedures
* 🔄 Referential Integrity
* 🗑️ Cascading Deletes

For example, `ticket_comments` references `tickets`, and the relationship uses **ON DELETE CASCADE**, ensuring that comments belonging to a deleted ticket are removed automatically.

---

## 🛠️ Technologies Used

| Technology             | Purpose                                       |
| ---------------------- | --------------------------------------------- |
| 🐘 **PHP**             | Server-side web development                   |
| 🐬 **MySQL / MariaDB** | Relational database management                |
| 🗃️ **SQL**            | Queries, procedures, triggers and constraints |
| 🌐 **HTML / CSS**      | Web interface                                 |
| 🖥️ **XAMPP / MAMP**   | Local development environment                 |
| 🛠️ **phpMyAdmin**     | Database administration                       |

---

## 🚀 Running the Project

The project requires a local PHP and MySQL/MariaDB environment.

### 1️⃣ Install XAMPP or MAMP

Install a local web development environment such as **XAMPP** or **MAMP**.

### 2️⃣ Start the Services

Start:

```text
Apache
MySQL
```

### 3️⃣ Import the Database

Open **phpMyAdmin** or another MySQL-compatible database administration tool.

Create/import the database using:

```text
CS06.sql
```

The SQL file contains the database schema, sample data, stored procedures, triggers, indexes, and foreign-key relationships.

### 4️⃣ Add the Project Files

Place the PHP project files inside your local web server directory.

For XAMPP, this is typically:

```text
htdocs/
```

### 5️⃣ Open the Application

Open the project through your browser using your local server:

```text
http://localhost/
```

---

## 🧠 Database Concepts Demonstrated

The project applies several concepts covered throughout **CS306 Database Systems**:

* Relational database modeling
* Entity relationships
* SQL queries
* Primary and foreign keys
* Composite keys
* Referential integrity
* Stored procedures
* Database triggers
* Many-to-many relationships
* Cascading operations
* Database-backed web development

---

## 📂 Project Structure

```text
CS306-Campus-Club-Event-Management-System/
│
├── CS06.sql
├── README.md
├── PHP files
└── Other web application resources
```

---

## 🎯 Project Purpose

The main objective of this project is to demonstrate how a relational database can support a real-world campus club management scenario.

Instead of treating the database only as data storage, the project uses **relationships, constraints, stored procedures, and triggers** to organize data and enforce database-side behavior.

---

## 📚 Course Information

**Course:** CS306 — Database Systems
**University:** Sabancı University
