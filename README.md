# Human Resource Management System (HRMS)

## Overview
This Human Resource Management System (HRMS) is a software solution designed to streamline HR operations specifically for large organizations. The initial phase focuses on **Personal Information Management (PIM)** and **Absence Management**. The system is tailored to meet the requirements of **Jupiter Apparels**, a multinational apparel company with branches across Sri Lanka, Bangladesh, and Pakistan. This product aims to simplify HR management while providing the flexibility to add more functionalities in the future, such as payroll and inventory management.

## Key Features

1. **Personal Information Management (PIM):**
   - Employee details storage including name, birthdate, marital status, emergency contact, and dependent details.
   - Employee attributes (job title, pay grade, employment status) are defined independently, allowing easy customization.
   - Hierarchical structure with employees, supervisors, and subordinates.
   - Customizable employee attributes (e.g., Nationality) for flexibility across different organizations.

2. **Absence Management:**
   - Supports four leave types: Annual, Casual, Maternity, and No-pay leave.
   - Mandatory 50 no-pay leaves for every employee, with leave quotas configurable per pay grade.
   - Leave requests require supervisor approval, ensuring compliance and efficient tracking.
   - Leaves are deducted from the employee’s balance only upon supervisor approval.

3. **Reporting Module:**
   - Comprehensive reports on employees, including:
     - Employees by department.
     - Total leaves taken over a specified period by department.
     - Employee reports grouped by job title, department, pay grade, etc.
     - Reports on custom fields added by the organization.

4. **User Management & Access Control:**
   - Fine-grained access control based on employee role.
   - Restricts Level 1 employees to view-only access to personal information, while managerial employees have edit access.

## Entity Relationships and Database Design

The HRMS is designed with a modular database structure, ensuring data integrity and flexibility to support future growth. Key entities include:

- **Organization**: Stores company-specific details.
- **Employee**: Main table storing employee information, linked to Job Title, Pay Grade, and Employment Status.
- **Leave**: Tracks leave types and quotas, with supervisor approval for tracking leave requests.
- **Custom Attributes**: Allows organizations to add specific attributes as needed.
  
### Database ACID Compliance
To ensure data integrity, the database employs:

- **Primary Keys** and **Foreign Keys** to maintain relational integrity.
- **Procedures and Triggers** to enforce ACID properties during insert, update, and delete operations.
- **Indexing** on frequently accessed columns (such as employee ID, department) to enhance performance.

### Sample Organization Structure
Employees are structured with various positions and statuses:

| Position           | Employment Status |
|--------------------|-------------------|
| Accountant         | Full-time         |
| Cleaner            | Part-time         |
| HR Assistant       | Full-time         |
| HR Manager         | Full-time         |
| QA Engineer        | Full-time         |
| Software Engineer  | Full-time         |
| Worker             | Full-time         |

## Getting Started

### Prerequisites
- Database: MySQL or any SQL-compliant RDBMS.
- Sample data: Initial employee and organization data included in SQL scripts.

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/dewminawijekoon/HRMS_DataBase_Project.git

## Create FrontEnd Server
```
cd FrontEnd
npm install
npm start
```

## Create BackEnd Server
```
//Creating Python Environment
cd BackEnd
python -m venv .venv

//Entering created environment
.venv\Scripts\Activate.ps1

//Installing dependancies
pip install -r requirements.txt

//Run server
uvicorn main:app --reload
```

