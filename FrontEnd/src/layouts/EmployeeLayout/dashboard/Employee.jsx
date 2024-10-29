import React, { useState, useEffect } from 'react';
import { Row, Col, Card } from 'react-bootstrap';
import { Link, useNavigate } from 'react-router-dom';
import avatar1 from '../../assets/images/user/avatar-1.jpg';

const birthdaylist = [
  { name: 'Bhanuka Botheju', dept: 'HR' },
  { name: 'Kasun Chamara', dept: 'HR' },
  { name: 'Dinushka Attanayaka', dept: 'HR' },
  { name: 'Eshin Menusha', dept: 'HR' }
];

const DashDefault = () => {
  const [userName, setUserName] = useState(''); // State for storing the user's name

  useEffect(() => {
    // Fetch the user's name (from localStorage or API)
    const storedName = localStorage.getItem('username') || 'User';
    setUserName(storedName);
  }, []);

  const navigate = useNavigate();

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
              <h4>Welcome, {userName}!</h4>
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

export default DashDefault;
