import React, { useState, useEffect } from 'react';
import { AgGridReact } from 'ag-grid-react'; // React Data Grid Component
import "ag-grid-community/styles/ag-grid.css"; // Mandatory CSS required by the Data Grid
import "ag-grid-community/styles/ag-theme-alpine.css"; // Optional Theme applied to the Data Grid

const EmployeeTable = () => {
  const [rowData, setRowData] = useState([]); // Data displayed in the grid
  const [originalData, setOriginalData] = useState([]); // To hold the original data for filtering
  const [filters, setFilters] = useState({
    maritalStatus: '',
    gender: ''
  });

  // Dummy employee data
  const dummyData = [
    {
      employee_id: 'E001',
      first_name: 'John',
      last_name: 'Doe',
      pay_grade: 5,
      gender: 'Male',
      marital_status: 'Married',
      job_title: 'Software Engineer',
      employee_status: 'Active',
      department_name: 'IT',
      branch_name: 'Head Office'
    },
    {
      employee_id: 'E002',
      first_name: 'Jane',
      last_name: 'Smith',
      pay_grade: 4,
      gender: 'Female',
      marital_status: 'Single',
      job_title: 'Data Analyst',
      employee_status: 'Active',
      department_name: 'Data Science',
      branch_name: 'Branch Office'
    },
    {
      employee_id: 'E003',
      first_name: 'Alice',
      last_name: 'Johnson',
      pay_grade: 6,
      gender: 'Female',
      marital_status: 'Married',
      job_title: 'Project Manager',
      employee_status: 'Inactive',
      department_name: 'Project Management',
      branch_name: 'Head Office'
    },
    {
      employee_id: 'E004',
      first_name: 'Bob',
      last_name: 'Brown',
      pay_grade: 3,
      gender: 'Male',
      marital_status: 'Single',
      job_title: 'Web Developer',
      employee_status: 'Active',
      department_name: 'IT',
      branch_name: 'Head Office'
    },
    {
      employee_id: 'E005',
      first_name: 'Charlie',
      last_name: 'Davis',
      pay_grade: 2,
      gender: 'Male',
      marital_status: 'Single',
      job_title: 'Intern',
      employee_status: 'Active',
      department_name: 'IT',
      branch_name: 'Branch Office'
    }
  ];

  // Set the dummy data when the component mounts
  useEffect(() => {
    setRowData(dummyData);
    setOriginalData(dummyData); // Store original data for filtering
  }, []);

  // Filter data based on the selected criteria
  const applyFilters = () => {
    let filteredData = originalData.filter(employee => {
      return (
        (!filters.maritalStatus || employee.marital_status === filters.maritalStatus) &&
        (!filters.gender || employee.gender === filters.gender)
      );
    });
    setRowData(filteredData);
  };

  // Handle input change for filters
  const handleFilterChange = (e) => {
    const { name, value } = e.target;
    setFilters(prevFilters => ({
      ...prevFilters,
      [name]: value
    }));
  };

  return (
    <div>
      <div style={{ marginBottom: '20px' }}>
        <label>
          Marital Status:
          <select name="maritalStatus" value={filters.maritalStatus} onChange={handleFilterChange}>
            <option value="">All</option>
            <option value="Single">Single</option>
            <option value="Married">Married</option>
          </select>
        </label>
        <label style={{ marginLeft: '20px' }}>
          Gender:
          <select name="gender" value={filters.gender} onChange={handleFilterChange}>
            <option value="">All</option>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
          </select>
        </label>
        <button onClick={applyFilters} style={{ marginLeft: '20px' }}>Apply Filters</button>
      </div>

      <div className="ag-theme-alpine" style={{ height: '500px', width: '100%' }}>
        <AgGridReact
          columnDefs={[
            { headerName: "Employee ID", field: "employee_id", sortable: true, filter: true },
            { headerName: "First Name", field: "first_name", sortable: true, filter: true },
            { headerName: "Last Name", field: "last_name", sortable: true, filter: true },
            { headerName: "Pay Grade", field: "pay_grade", sortable: true, filter: true },
            { headerName: "Gender", field: "gender", sortable: true, filter: true },
            { headerName: "Marital Status", field: "marital_status", sortable: true, filter: true },
            { headerName: "Job Title", field: "job_title", sortable: true, filter: true },
            { headerName: "Employee Status", field: "employee_status", sortable: true, filter: true },
            { headerName: "Department Name", field: "department_name", sortable: true, filter: true },
            { headerName: "Branch Name", field: "branch_name", sortable: true, filter: true },
          ]}
          rowData={rowData}
          pagination={true}
          paginationPageSize={10}
          domLayout='autoHeight'
          defaultColDef={{
            flex: 1,
            minWidth: 100,
            resizable: true,
          }}
        />
      </div>
    </div>
  );
};

export default EmployeeTable;
