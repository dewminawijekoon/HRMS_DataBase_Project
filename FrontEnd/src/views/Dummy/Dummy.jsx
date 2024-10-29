// EmployeeTable.jsx
import React from 'react';
import { AgGridReact } from 'ag-grid-react';
import 'ag-grid-community/styles/ag-grid.css';
import 'ag-grid-community/styles/ag-theme-quartz.css';
import EmployeeChart from './Chart'; // Import the chart component

// Dummy employee data
const employeeData = [
  {
    employee_id: "0d4056f8-0302-43c4-94eb-b773de55ac51",
    first_name: "Bhanuka",
    last_name: "Perera",
    birthday: "1985-06-15",
    nic: "200223223123",
    gender: "Male",
    marital_status: "Single",
    number_of_dependents: 2,
    address: "12, Kandy Road, Peradeniya.",
    contact_number: "07757004278",
    business_email: "bhanuka.perera@company.com",
    job_title: "Worker",
    employee_status: "Full-time",
    department_name: "IT",
    branch_name: "Branch A",
    profile_photo: "http://images.company.com/amaya123",
    emergency_contact_name: "Aamal Perera",
    emergency_contact_nic: "67345s9222V",
    emergency_contact_address: "12, Kandy Road, Peradeniya",
    emergency_contact_number: "012551634279"
  },
  {
    employee_id: "1d4056f8-0302-43c4-94eb-b773de55ac52",
    first_name: "Nimal",
    last_name: "Rajapaksha",
    birthday: "1990-03-25",
    nic: "200323223124",
    gender: "Male",
    marital_status: "Married",
    number_of_dependents: 3,
    address: "45, Main Street, Kandy.",
    contact_number: "07767005478",
    business_email: "nimal.rajapaksha@company.com",
    job_title: "Engineer",
    employee_status: "Full-time",
    department_name: "Engineering",
    branch_name: "Branch B",
    profile_photo: "http://images.company.com/nimal456",
    emergency_contact_name: "Sumantha Rajapaksha",
    emergency_contact_nic: "67345s9222X",
    emergency_contact_address: "45, Main Street, Kandy",
    emergency_contact_number: "012551634280"
  },
  {
    employee_id: "2d4056f8-0302-43c4-94eb-b773de55ac53",
    first_name: "Lakmal",
    last_name: "Fernando",
    birthday: "1988-05-10",
    nic: "200123223125",
    gender: "Male",
    marital_status: "Single",
    number_of_dependents: 0,
    address: "10, Hill Road, Galle.",
    contact_number: "07757004578",
    business_email: "lakmal.fernando@company.com",
    job_title: "Manager",
    employee_status: "Part-time",
    department_name: "Sales",
    branch_name: "Branch C",
    profile_photo: "http://images.company.com/lakmal789",
    emergency_contact_name: "Ravi Fernando",
    emergency_contact_nic: "67345s9222Y",
    emergency_contact_address: "10, Hill Road, Galle",
    emergency_contact_number: "012551634281"
  },
  {
    employee_id: "3d4056f8-0302-43c4-94eb-b773de55ac54",
    first_name: "Tharindu",
    last_name: "Mendis",
    birthday: "1995-08-30",
    nic: "200623223126",
    gender: "Male",
    marital_status: "Single",
    number_of_dependents: 1,
    address: "32, Sea View Road, Colombo.",
    contact_number: "07757004678",
    business_email: "tharindu.mendis@company.com",
    job_title: "Trainee",
    employee_status: "Intern",
    department_name: "HR",
    branch_name: "Branch A",
    profile_photo: "http://images.company.com/tharindu012",
    emergency_contact_name: "Malini Mendis",
    emergency_contact_nic: "67345s9222Z",
    emergency_contact_address: "32, Sea View Road, Colombo",
    emergency_contact_number: "012551634282"
  },
  {
    employee_id: "4d4056f8-0302-43c4-94eb-b773de55ac55",
    first_name: "Sanjay",
    last_name: "Kumar",
    birthday: "1982-12-22",
    nic: "200723223127",
    gender: "Male",
    marital_status: "Married",
    number_of_dependents: 4,
    address: "123, Main Street, Colombo.",
    contact_number: "07757004778",
    business_email: "sanjay.kumar@company.com",
    job_title: "Developer",
    employee_status: "Full-time",
    department_name: "IT",
    branch_name: "Branch B",
    profile_photo: "http://images.company.com/sanjay345",
    emergency_contact_name: "Anjali Kumar",
    emergency_contact_nic: "67345s9222A",
    emergency_contact_address: "123, Main Street, Colombo",
    emergency_contact_number: "012551634283"
  },
];

const EmployeeTable = () => {
  const columnDefs = [
    { headerName: "Employee ID", field: "employee_id", sortable: true },
    { headerName: "First Name", field: "first_name", sortable: true },
    { headerName: "Last Name", field: "last_name", sortable: true },
    { headerName: "Birthday", field: "birthday", sortable: true },
    { headerName: "NIC", field: "nic", sortable: true },
    { headerName: "Gender", field: "gender", sortable: true },
    { headerName: "Marital Status", field: "marital_status", sortable: true },
    { headerName: "Dependents", field: "number_of_dependents", sortable: true },
    { headerName: "Address", field: "address", sortable: true },
    { headerName: "Contact Number", field: "contact_number", sortable: true },
    { headerName: "Business Email", field: "business_email", sortable: true },
    { headerName: "Job Title", field: "job_title", sortable: true },
    { headerName: "Employee Status", field: "employee_status", sortable: true },
    { headerName: "Department", field: "department_name", sortable: true },
    { headerName: "Branch", field: "branch_name", sortable: true },
    { headerName: "Profile Photo", field: "profile_photo", sortable: true },
    { headerName: "Emergency Contact Name", field: "emergency_contact_name", sortable: true },
    { headerName: "Emergency Contact NIC", field: "emergency_contact_nic", sortable: true },
    { headerName: "Emergency Contact Address", field: "emergency_contact_address", sortable: true },
    { headerName: "Emergency Contact Number", field: "emergency_contact_number", sortable: true }
  ];

  return (
    <div>
      <div className="ag-theme-alpine" style={{ height: '400px', width: '100%' }}>
        <AgGridReact
          columnDefs={columnDefs}
          rowData={employeeData}
          pagination={true}
          paginationPageSize={10}
          filter={true}
          sorting={true}
        />
      </div>
      <h2>Employee Distribution Chart</h2>
      <EmployeeChart employeeData={employeeData} />
    </div>
  );
};

export default EmployeeTable;
