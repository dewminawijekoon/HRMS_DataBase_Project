import React, { useEffect, useState } from 'react';
import { Row, Col, Card, Table, Tabs, Tab, Button, CardBody } from 'react-bootstrap';
import { Link, useNavigate } from 'react-router-dom';

import avatar1 from '../../assets/images/user/avatar-1.jpg';
import avatar2 from '../../assets/images/user/avatar-2.jpg';
import avatar3 from '../../assets/images/user/avatar-3.jpg';


//

const dashSalesData = [
  { title: 'On Leave', icon: 'icon-arrow-up text-c-green', value: 13, class: 'progress-c-theme' },
  { title: 'Working Format : Full Time', icon: 'icon-arrow-down text-c-red', value: 85, class: 'progress-c-theme2' },
  { title: 'Working Format : Part Time', icon: 'icon-arrow-up text-c-green', value: 15, color: 'progress-c-theme' }
];

//Array of employee details
const employeeDetails = [
  { employee_id: '001A', first_name: 'Niduni', last_name: 'Kasige' },
  { employee_id: '002A', first_name: 'Isurumuni', last_name: 'Wijesooriya' },
  { employee_id: '003A', first_name: 'Bhanuka', last_name: 'Botheju' },
  { employee_id: '004A', first_name: 'Umesha', last_name: 'Jayakodi' },
  { employee_id: '005A', first_name: 'Dewmina', last_name: 'Wijekoon' },
];

const Employees = () => {
  
  const navigate = useNavigate();
  
  const [employees, setEmployees] = useState(employeeDetails);

  // Function to view employee details
  const viewEmployee = async (employee_id) => {
    console.log("Viewed employee");
    navigate('./profile',{state:{employee_id: employee_id}});
  };

  const fetchEmployees = async () => {
    try {
      let response = await fetch('http://127.0.0.1:8000/supervisor/team/', {
        method: 'GET',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${localStorage.getItem('token')}`,
        },
      });

      // If the response is okay, convert it to JSON
      if (response.ok) {
        const data = await response.json();
        const employees = data.length ? data : []; // Use empty array if no data
        
        if (!employees || employees.length === 0) {
          console.log("No data received");
        } else {
          console.log("Employees received:", employees);
          setEmployees(employees); // Update this as per your React state handler
          
        }
      } else {
        console.error('Error fetching employees:', response.status);
      }
    } catch (error) {
      console.error('Error fetching employees:', error);
    }
  };

  useEffect(() => {
    fetchEmployees();
  }, []);

  return (
    <React.Fragment>
      <Row >
        <Row>
          <Col key={0} xl={13}>
            <Card className="Recent-Users widget-focus-lg">
              <Card.Header>
                <Card.Title as="h5">Employees Under Supervision</Card.Title>
              </Card.Header>

              {/* Need to update using the data from the database */}
              <Card.Body className="px-0 py-2">
                <Table responsive hover className="recent-users">
                  <tbody>
                    {employees.map((data, index) => {
                      
                      const { employee_id, first_name, last_name } = data;
                      return(
                        <tr className="unread">
                          <td>
                            <img className="rounded-circle avatar" src={avatar2} alt="user" />
                          </td>
                          <td>
                            <h6 className="employee-name">{first_name} {last_name}</h6>
                          </td>
                          <td>
                            <Button variant="primary" className="action-button view-button" onClick={() => viewEmployee(employee_id)}>
                              View
                            </Button>
                          </td>
                        </tr>
                      )
                    }
                  )}
                  </tbody> 
                </Table>
              </Card.Body>
            </Card>
          </Col>
        </Row>
      </Row>
    </React.Fragment>
  );
};

export default Employees;