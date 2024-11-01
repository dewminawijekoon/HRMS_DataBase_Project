import React, { useState, useEffect } from 'react';
import { Row, Col, Card, Table, Button } from 'react-bootstrap';
import { useNavigate } from 'react-router-dom';
import avatar1 from '../../assets/images/user/avatar-1.jpg';
import avatar2 from '../../assets/images/user/avatar-2.jpg';


const Employees = () => {
  const navigate = useNavigate();
  const [adminList, setAdminList] = useState([]);
  const [employeeWithSup, setEmployeeWithSup] = useState([]);

  useEffect(() => {
    fetchAdminList();
    fetchSupervisorsWithEmployees();
  }, []);

  const fetchAdminList = async () => {
    try {
      const response = await fetch('http://localhost:8000/all_admins', {
        method: 'GET',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${localStorage.getItem('token')}`,
        },
      });
      if (response.ok) {
        const data = await response.json();
        setAdminList(data);
        console.log("Admin fetch recive",data);
      } else {
        console.error('Failed to fetch admin list');
      }
    } catch (error) {
      console.error('Error fetching admin list:', error);
    }
  };

  const fetchSupervisorsWithEmployees = async () => {
    try {
      const response = await fetch('http://localhost:8000/supervisors-with-teams', {
        method: 'GET',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${localStorage.getItem('token')}`,
        },
      });
      if (response.ok) {
        const data = await response.json();
        setEmployeeWithSup(data);
        console.log("sup with team",data);
      } else {
        console.error('Failed to fetch supervisor data');
      }
    } catch (error) {
      console.error('Error fetching supervisor data:', error);
    }
  };

  const handleAddEmployee = () => navigate('./add-employee');
  const handleViewEmployee = (employeeId) => navigate('./profile', { state: { employee_id: employeeId } });

  const handleDeleteEmployee = async (employeeId) => {
    try {
      const response = await fetch(`http://localhost:8000/employee/${employeeId}`, {
        method: 'DELETE',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${localStorage.getItem('token')}`,
        },
      });
      if (response.ok) {
        console.log('Employee deleted successfully');
        navigate(0);
        fetchSupervisorsWithEmployees();
      } else {
        console.error('Failed to delete employee:', response.status);
      }
    } catch (error) {
      console.error('Error deleting employee:', error);
    }
  };

  return (
    <React.Fragment>
      <Row>
        <Col xl={12}>
          <Card className="widget-focus-lg">
            <Card.Body>
              <Button variant="primary" className="centered-button" onClick={handleAddEmployee}>
                Add Employee
              </Button>
            </Card.Body>
          </Card>

          <Card className="mb-4">
            <Card.Header>
              <Card.Title as="h5">Admin</Card.Title>
            </Card.Header>
            <Card.Body>
              <Table responsive hover className="recent-users">
                <tbody>
                  {adminList.map((admin, index) => (
                    <EmployeeTableRow
                      key={index}
                      data={admin}
                      avatar={avatar1}
                      onView={handleViewEmployee}
                      onDelete={handleDeleteEmployee}
                    />
                  ))}
                </tbody>
              </Table>
            </Card.Body>
          </Card>

          <Card className="widget-focus-lg">
            <Card.Header>
              <Card.Title as="h5">Supervision with Team</Card.Title>
            </Card.Header>
            <Card.Body>
              {employeeWithSup.map((group, index) => (
                <SupervisionGroup
                  key={index}
                  supervisor={group[0]}
                  employees={group.slice(1)}
                  onView={handleViewEmployee}
                  onDelete={handleDeleteEmployee}
                />
              ))}
            </Card.Body>
          </Card>
        </Col>
      </Row>
    </React.Fragment>
  );
};

const EmployeeTableRow = ({ data, avatar, onView, onDelete }) => {
  const { first_name, last_name, employee_id } = data;
  return (
    <tr className="unread">
      <td>
        <img className="rounded-circle avatar" src={avatar} alt="user" />
      </td>
      <td>
        <h6 className="employee-name">{`${first_name} ${last_name}`}</h6>
      </td>
      <td>
        <Button variant="primary" className="action-button view-button" onClick={() => onView(employee_id)}>
          View
        </Button>
      </td>
      <td>
        <Button variant="primary" className="action-button delete-button" onClick={() => onDelete(employee_id)}>
          Delete
        </Button>
      </td>
    </tr>
  );
};

const SupervisionGroup = ({ supervisor, employees, onView, onDelete }) => (
  <Card className="widget-focus-lg">
    <Card.Header>
      <Card.Title as="h5">{supervisor.name}</Card.Title>
    </Card.Header>
    <Card.Body>
      <Table responsive hover className="recent-users">
        <tbody>
          {employees.map((employee, index) => (
            <EmployeeTableRow
              key={index}
              data={employee}
              avatar={employee.gender === 'Male' ? avatar2 : avatar1}
              onView={onView}
              onDelete={onDelete}
            />
          ))}
        </tbody>
      </Table>
    </Card.Body>
  </Card>
);

export default Employees;

