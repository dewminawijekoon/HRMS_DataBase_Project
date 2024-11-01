import React, { useEffect, useState } from 'react';
import { AgGridReact } from 'ag-grid-react';
import 'ag-grid-community/styles/ag-grid.css';
import 'ag-grid-community/styles/ag-theme-alpine.css';

const EmployeeTable = () => {
  const [employees, setEmployees] = useState([]); // Local state to store employee data

  const fetchEmployees = async () => {
    try {
      const response = await fetch('http://localhost:8000/search_all', {
        method: 'GET',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${localStorage.getItem('token')}`, // Assuming you have a token for authorization
        },
      });

      if (response.ok) {
        const employeeData = await response.json();
        setEmployees(employeeData); // Set the fetched employee data to state
      } else {
        console.error('Failed to fetch employee data:', response.status);
        setEmployees([]); // Set as empty array in case of an error
      }
    } catch (error) {
      console.error('Error fetching employee data:', error);
      setEmployees([]); // Set as empty array in case of an error
    }
  };

  useEffect(() => {
    fetchEmployees(); // Fetch employee data when the component mounts
  }, []);

  const columnDefs = [
    { field: 'employee_id', filter: 'agNumberColumnFilter' },
    { field: 'first_name', filter: 'agTextColumnFilter' },
    { field: 'last_name', filter: 'agTextColumnFilter' },
    { field: 'birthday', filter: 'agDateColumnFilter' },
    { field: 'employee_nic', filter: 'agTextColumnFilter' },
    { field: 'gender', filter: 'agTextColumnFilter' },
    { field: 'marital_status', filter: 'agTextColumnFilter' },
    { field: 'number_of_dependents', filter: 'agNumberColumnFilter' },
    { field: 'address', filter: 'agTextColumnFilter' },
    { field: 'contact_number', filter: 'agTextColumnFilter' },
    { field: 'business_email', filter: 'agTextColumnFilter' },
    { field: 'job_title', filter: 'agTextColumnFilter' },
    { field: 'department_id', filter: 'agNumberColumnFilter' },
    { field: 'branch_id', filter: 'agNumberColumnFilter' },
  ];

  return (
    <div className="ag-theme-alpine" style={{ height: 600, width: '100%' }}>
      <AgGridReact
        rowData={employees} // Use the state to populate row data
        columnDefs={columnDefs}
        pagination={true}
        paginationPageSize={100}
        defaultColDef={{
          sortable: true,
          filter: true,
        }}
      />
    </div>
  );
};

export default EmployeeTable;
