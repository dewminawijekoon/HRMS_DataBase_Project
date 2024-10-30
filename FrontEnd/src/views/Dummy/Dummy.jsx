import React, { useState, useEffect } from 'react';
import { Form, Row, Col } from 'react-bootstrap';
import { AgGridReact } from 'ag-grid-react';
import 'ag-grid-community/styles/ag-grid.css';
import 'ag-grid-community/styles/ag-theme-alpine.css';

const EmployeeSearchGrid = () => {
    const [rowData, setRowData] = useState([]); // Holds all data from /search_all
    const [gridApi, setGridApi] = useState(null); // Store the AG Grid API instance

    // Sample data for dropdowns, replace with your actual data or API calls
    const genders = ['Male', 'Female', 'Other'];
    const departments = ['HR', 'IT', 'Finance', 'Marketing'];
    const maritalStatuses = ['Single', 'Married', 'Divorced', 'Widowed'];
    const branches = ['Head Office', 'Branch A', 'Branch B'];

    // Function to fetch all data from the backend with token authorization
    const fetchData = async () => {
        try {
            const response = await fetch('http://127.0.0.1:8000/search_all', {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Bearer ${localStorage.getItem('token')}`,
                },
            });

            if (response.ok) {
                const data = await response.json();
                setRowData(data);
                console.log('Employee data:', data);
            } else {
                console.error('Failed to fetch employee data:', response.status);
            }
        } catch (error) {
            console.error('Error fetching employee data:', error);
        }
    };

    useEffect(() => {
        fetchData();
    }, []);

    // Define columns for the grid
    const columnDefs = [
        { headerName: "Employee ID", field: "employee_id", sortable: true, filter: true },
        { headerName: "First Name", field: "first_name", sortable: true, filter: true },
        { headerName: "Last Name", field: "last_name", sortable: true, filter: true },
        { headerName: "Gender", field: "gender", sortable: true, filter: 'agSetColumnFilter' },
        { headerName: "Marital Status", field: "marital_status", sortable: true, filter: 'agSetColumnFilter' },
        { headerName: "Job Title", field: "job_title", sortable: true, filter: true },
        { headerName: "Department", field: "department_name", sortable: true, filter: 'agSetColumnFilter' },
        { headerName: "Branch", field: "branch_name", sortable: true, filter: 'agSetColumnFilter' },
        { headerName: "Contact", field: "contact_number", sortable: true, filter: true },
    ];

    // Function to handle grid ready event to get the grid API
    const onGridReady = (params) => {
        setGridApi(params.api);
    };

    // Function to clear filters
    const clearFilters = () => {
        gridApi?.setFilterModel(null); // Clear all filters
    };

    return (
        <div>
            <Form.Group as={Row} className="mb-3" controlId="typeOfLeave">
                <Form.Label column sm={4}>Type of Leave</Form.Label>
                <Col sm={8}>
                    <Form.Select>
                        <option value="">Select Leave Type</option>
                        <option value="Annual">Annual Leave</option>
                        <option value="Sick">Sick Leave</option>
                        <option value="Casual">Casual Leave</option>
                        <option value="Maternity">Maternity Leave</option>
                        <option value="Paternity">Paternity Leave</option>
                        <option value="Other">Other</option>
                    </Form.Select>
                </Col>
            </Form.Group>

            {/* Gender Dropdown */}
            <Form.Group as={Row} className="mb-3" controlId="genderSelect">
                <Form.Label column sm={4}>Gender</Form.Label>
                <Col sm={8}>
                    <Form.Select onChange={(e) => gridApi?.setFilterModel({
                        gender: {
                            filter: e.target.value,
                            filterType: 'set'
                        }
                    })}>
                        <option value="">Select Gender</option>
                        {genders.map((g) => (
                            <option key={g} value={g}>{g}</option>
                        ))}
                    </Form.Select>
                </Col>
            </Form.Group>

            {/* Department Dropdown */}
            <Form.Group as={Row} className="mb-3" controlId="departmentSelect">
                <Form.Label column sm={4}>Department</Form.Label>
                <Col sm={8}>
                    <Form.Select onChange={(e) => gridApi?.setFilterModel({
                        department_name: {
                            filter: e.target.value,
                            filterType: 'set'
                        }
                    })}>
                        <option value="">Select Department</option>
                        {departments.map((d) => (
                            <option key={d} value={d}>{d}</option>
                        ))}
                    </Form.Select>
                </Col>
            </Form.Group>

            {/* Marital Status Dropdown */}
            <Form.Group as={Row} className="mb-3" controlId="maritalStatusSelect">
                <Form.Label column sm={4}>Marital Status</Form.Label>
                <Col sm={8}>
                    <Form.Select onChange={(e) => gridApi?.setFilterModel({
                        marital_status: {
                            filter: e.target.value,
                            filterType: 'set'
                        }
                    })}>
                        <option value="">Select Marital Status</option>
                        {maritalStatuses.map((status) => (
                            <option key={status} value={status}>{status}</option>
                        ))}
                    </Form.Select>
                </Col>
            </Form.Group>

            {/* Branch Dropdown */}
            <Form.Group as={Row} className="mb-3" controlId="branchSelect">
                <Form.Label column sm={4}>Branch</Form.Label>
                <Col sm={8}>
                    <Form.Select onChange={(e) => gridApi?.setFilterModel({
                        branch_name: {
                            filter: e.target.value,
                            filterType: 'set'
                        }
                    })}>
                        <option value="">Select Branch</option>
                        {branches.map((b) => (
                            <option key={b} value={b}>{b}</option>
                        ))}
                    </Form.Select>
                </Col>
            </Form.Group>

            <div className="filter-buttons">
                <button onClick={clearFilters}>Clear Filters</button>
            </div>

            <div className="ag-theme-alpine" style={{ height: 500, width: '100%' }}>
                <AgGridReact
                    rowData={rowData}
                    columnDefs={columnDefs}
                    onGridReady={onGridReady} // Set the grid API on ready
                />
            </div>
        </div>
    );
};

export default EmployeeSearchGrid;
