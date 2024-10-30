import useTokenAuth from '../../auth/TokenAuth.jsx';
import React, { useState, useEffect } from 'react';
import { Row, Col, Card, Table, Tabs, Tab } from 'react-bootstrap';
import { Link, useNavigate } from 'react-router-dom';
import avatar1 from '../../assets/images/user/avatar-1.jpg';
import avatar2 from '../../assets/images/user/avatar-2.jpg';
import { toast } from 'sonner';

const DashDefault = () => {
  useTokenAuth();
  const [userName, setUserName] = useState('');
  let navigate = useNavigate();

  const birthdaylist = [
    { name: 'Bhanuka Botheju', dept: 'HR' },
    { name: 'Kasun Chamara', dept: 'HR' },
    { name: 'Dinushka Attanayaka', dept: 'HR' },
    { name: 'Eshin Menusha', dept: 'HR' },
  ];

  const [getemloyeemonth, setgetemloyeemonth] = useState([
    { name: 'Bhanuka Botheju', dept: 'HR' },
    { name: 'Kasun Chamara', dept: 'HR' },
    { name: 'Dinushka Attanayaka', dept: 'HR' },
    { name: 'Eshin Menusha', dept: 'HR' },
  ]);

  const [dashboard,setdashboard] = useState([
    { title: 'On Leave', amount: '201', value: 10 },
    { title: 'Working format : Full Time', amount: '589', value: 50 },
    { title: 'Working format : Part Time', amount: '105', value: 90 },
  ]);

  const [approvalList, setApprovalList] = useState([
    {
      first_name: 'first_name',
      last_name: 'last_name',
      gender: 'Male',
      leave_request_id: 'none',
      employee_id: 'none',
      request_date: 'none',
      leave_start_date: 'none',
      period_of_absence: 'none',
      reason_for_absence: 'none',
      type_of_leave: 'none',
      request_status: 'P',
    },
  ]);

  useEffect(() => {
    getApprovalList();
    getsetdashboarddata();
    console.log("this is a token", localStorage.getItem('token'));
    const storedName = localStorage.getItem('username');
    setUserName(storedName);
  }, []);

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
  
  

  const getApprovalList = async () => {
    console.log("Token:", localStorage.getItem('token'));
    try {
      const response = await fetch('http://localhost:8000/admin_leaves', {
        method: 'GET',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${localStorage.getItem('token')}`,
        },
      });

      if (response.ok) {
        const data = await response.json();
        setApprovalList(data);
        console.log('this is a Approval List:', data);
      } else {
        console.error('Failed to fetch leave requests:', response.status);
      }
    } catch (error) {
      console.error('Error fetching leave requests:', error);
    }
  };

  const getEmployeeofthemonth = async() => {
    try {
      const response = await fetch('http://localhost:8000/employee_of_month', {
        method: 'GET',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${localStorage.getItem('token')}`,
        },
      });

      if (response.ok) {
        const data = await response.json();
        setgetemloyeemonth(data);
      } else {
        console.error('Failed to fetch leave requests:', response.status);
      }
    } catch (error) {
      console.error('Error fetching leave requests:', error);
    }
  }

  const handleApprove = (index) => {
    navigate('./leave-request-form', { state: { details_list: approvalList[index] } });
  };

  const renderTabContent = () => (
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

  const renderbirthdaycontent = () => {
  return (
    <React.Fragment>
      {getemloyeemonth.map((data, index) => (
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
};

  return (
    <React.Fragment>
      <Row>
        <Col>
          <Card className="mb-4">
            <Card.Body>
              <h4>Welcome Admin, {userName}!</h4>
            </Card.Body>
          </Card>
        </Col>
      </Row>

      <Row>
        {dashboard.map((data, index) => (
          <Col key={index} xl={6} xxl={4}>
            <Card>
              <Card.Body>
                <h6 className="mb-4">{data.title}</h6>
                <div className="row d-flex align-items-center">
                  <div className="col-9">
                    <h3 className="f-w-300 d-flex align-items-center m-b-0">
                      {data.amount} {/* Display the amount */}
                    </h3>
                  </div>
                  <div className="col-3 text-end">
                    <p className="m-b-0">{(data.value * 100).toFixed(2)}%</p> {/* Display value as a percentage */}
                  </div>
                </div>
                <div className="progress m-t-30" style={{ height: '7px' }}>
                  <div
                    className="progress-bar progress-c-theme"
                    role="progressbar"
                    style={{ width: `${(data.value * 100).toFixed(2)}%` }} // Convert to percentage for the progress bar
                    aria-valuenow={data.value * 100}
                    aria-valuemin="0"
                    aria-valuemax="100"
                  />
                </div>
              </Card.Body>
            </Card>
          </Col>
        ))}

        
        <Col md={6} xl={8}>
          <Card className="Recent-Users widget-focus-lg">
            <Card.Header>
              <Card.Title as="h5">Pending Approvals</Card.Title>
            </Card.Header>
            <Card.Body className="px-0 py-2">
              <Table responsive hover className="recent-users">
                <tbody>
                  {approvalList.map((data, index) => (
                    <tr key={index} className='unread'>
                      <td>
                        <img className="rounded-circle" style={{ width: '40px' }} src={data.gender === 'Male' ? avatar2 : avatar1} alt="activity-user" />
                      </td>
                      <td>
                        <h6 className="mb-1" style={{ cursor: 'pointer' }}>{data.first_name}</h6>
                        <p className="m-0">{data.type_of_leave}</p>
                      </td>
                      <td>
                        <h6 className="text-muted">
                          <i className="fa fa-circle text-c-green f-10 m-r-15" />
                          {data.leave_start_date}
                        </h6>
                      </td>
                      <td>
                      <button
                          className="label theme-bg text-white f-12"
                          onClick={() => handleApprove(index,data.name)}
                        >
                          View
                        </button>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </Table>
            </Card.Body>
          </Card>
        </Col>
        <Col md={6} xl={4} className="user-activity">
          <Card>
            <Tabs defaultActiveKey="today" id="uncontrolled-tab-example">
              <Tab eventKey="today" title="Celebration">
              {renderTabContent()}
              </Tab>
              <Tab eventKey="week" title="Achievement">
                {renderTabContent()}
              </Tab>
              <Tab eventKey="all" title="All">
                {renderTabContent()}
              </Tab>
            </Tabs>
          </Card>
        </Col>
      </Row>
    </React.Fragment>
  );
};

export default DashDefault;

