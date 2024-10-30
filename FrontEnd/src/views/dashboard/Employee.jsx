import React, { useState, useEffect } from 'react';
import { Row, Col, Card } from 'react-bootstrap';
import { Link, useNavigate } from 'react-router-dom';
import avatar1 from '../../assets/images/user/avatar-1.jpg';
import useTokenAuth from '../../auth/TokenAuth.jsx';
import { toast } from "sonner";

const birthdaylist = [
  { name: 'Bhanuka Botheju', dept: 'HR' },
  { name: 'Kasun Chamara', dept: 'HR' },
  { name: 'Dinushka Attanayaka', dept: 'HR' },
  { name: 'Eshin Menusha', dept: 'HR' }
];

const DashEmployee = () => {
  useTokenAuth();
  const [userName, setUserName] = useState(''); // State for storing the user's name

  useEffect(() => {
    // Fetch the user's name (from localStorage or API)
    const storedName = localStorage.getItem('username');
    setUserName(storedName);
  }, []);

  const navigate = useNavigate();

  const getsetdashboarddata = async () => {
    try {
      const response = await fetch('http://localhost:8000/dashboard_data', {
        method: 'GET',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${localStorage.getItem('token')}`,
        },
      });
  
      if (response.ok) {
        const responseData = await response.json();
        const data = responseData.data; // Access the data property
  
        // Ensure data is an array before setting it to dashboard
        setdashboard(Array.isArray(data) ? data : []);
        console.log("dashboard data received", data);
      } else {
        console.error('Failed to fetch dashboard data:', response.status);
        setdashboard([]); // Set as empty array in case of an error
      }
    } catch (error) {
      console.error('Error fetching dashboard data:', error);
      setdashboard([]); // Set as empty array in case of an error
    }
  };



  const tabContent = (
    <React.Fragment>
      {birthdaylist.map((data, index) => (
        <div className="d-flex friendlist-box align-items-center justify-content-center m-b-20" key={index}>
          <div className="m-r-10 photo-table flex-shrink-0">
            <Link to="#">
              <img className="rounded-circle" style={{ width: '40px' }} src={avatar1} alt="activity-user" />
            </Link>
          </div>
          <div className="flex-grow-1 ms-3">
            <h6 className="m-0 d-inline">{data.name}</h6>
            <span className="float-end d-flex align-items-center">
              <i className="fa fa-caret-up f-22 m-r-10 text-c-green" />
              {data.dept}
            </span>
          </div>
        </div>
      ))}
    </React.Fragment>
  );

  return (
    <React.Fragment>
      {/* Welcome message */}
      <Row>
        <Col>
          <Card className="mb-4">
            <Card.Body>
              <h4>Welcome Employee, {userName}!</h4>
            </Card.Body>
          </Card>
        </Col>
      </Row>

      {/* Dashboard content */}
      <Row>
        <Col md={6} xl={4} className="user-activity">
          <Card>
            <Card.Header>
              <Card.Title as="h5">Birthdays</Card.Title>
            </Card.Header>
            <Card.Body>
              {tabContent}
            </Card.Body>
          </Card>
        </Col>
      </Row>
    </React.Fragment>
  );
};

export default DashEmployee;
