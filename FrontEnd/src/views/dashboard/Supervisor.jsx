import React, { useState,useEffect } from 'react';
import { Row, Col, Card, Table, Tabs, Tab, ListGroup, Dropdown } from 'react-bootstrap';
import { Link } from 'react-router-dom';
import { useNavigate } from 'react-router-dom';
import useTokenAuth from '../../auth/TokenAuth.jsx';



import avatar1 from '../../assets/images/user/avatar-1.jpg';
import avatar2 from '../../assets/images/user/avatar-2.jpg';

let initialApprovalList = null;

  

let dashSalesData = [
  { title: 'On Leave', amount: '201', value: 10 },
  { title: 'Working format : Full Time', amount: '589',  value: 50},
  { title: 'Working format : Part Time', amount: '105',  value: 90}
];

 initialApprovalList = [
  {leave_request_id: 'none', employee_id: 'none',
    request_date: 'none',
   leave_start_date: 'you don"t have any leave request', period_of_absence: 'none',
   reason_for_absence: 'none', type_of_leave: 'none',
   request_status: 'p'},
];

let birthdaylist = [
  { name: 'Bhanuka Botheju', dept: 'HR' },
  { name: 'Kasun Chamara', dept: 'HR' },
  { name: 'Dinushka Attanayaka', dept: 'HR' },
  { name: 'Eshin Menusha', dept: 'HR' }
];

const DashDefault = () => { 

  useTokenAuth();
  const [userName, setUserName] = useState('');
  
  useEffect(() => {
    const storedName = localStorage.getItem('username');
    setUserName(storedName);
    getdelaisfrombackend();
  }, []);

  const getdelaisfrombackend = async () => {
    //getdashSalesData();
    getApprovalList();
    //getBirthdayList();
  }

  const getApprovalList = async () => {
    console.log("this is token")
    console.log(localStorage.getItem('token'));
    try {
      // Fetch data from the backend
      const response = await fetch('http://localhost:8000/supervisor/leave_requests', {
        method: 'GET',
        headers: {
          'Content-Type': 'application/json',
          // Include token for authentication, if required
          'Authorization': `Bearer ${localStorage.getItem('token')}`,
        },
      });
  
      // If the response is okay, convert it to JSON
      if (response.ok) {
        const data = await response.json();
        // Use the fetched data or set the initialApprovalList if data is empty
        const leaveRequests = data.length ? data : initialApprovalList;
        console.log(leaveRequests);
        if(leaveRequests=="null"){
          console.log("No data");
        }
        else{
          initialApprovalList = leaveRequests;
        }

        // Update state or UI with fetched data
        // Example: setLeaveRequests(leaveRequests);
      } else {
        // Handle errors (e.g., 404, 403, etc.)
        console.error('Failed to fetch leave requests:', response.status);
      }
    } catch (error) {
      // Catch any network errors
      console.error('Error fetching leave requests:', error);
    } finally {
      // Optionally, handle cleanup or UI state changes here
    }
  };
  
  const getdashSalesData = async () =>{
    //
  }
  

  const [listOpen, setListOpen] = useState(false);
  const [approvalList, setApprovalList] = useState(initialApprovalList);
  const navigate = useNavigate();

  const handleApprove = (index,name) => {
    /*
    const updatedList = approvalList.filter((_, i) => i !== index); // Remove the approved item from the list
    setApprovalList(updatedList);
    */
    navigate('./leave-request-form', {
      state: { details_list: initialApprovalList[index] }
    });       
  };

  let tabcontent = (
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
      <Row>
        <Col>
          <Card className="mb-4">
            <Card.Body>
              <h4>Welcome Supervisor, {userName}!</h4>
            </Card.Body>
          </Card>
        </Col>
      </Row>
      <Row>
        {dashSalesData.map((data, index) => {
          return (
            <Col key={index} xl={6} xxl={4}>
              <Card>
                <Card.Body>
                  <h6 className="mb-4">{data.title}</h6>
                  <div className="row d-flex align-items-center">
                    <div className="col-9">
                      <h3 className="f-w-300 d-flex align-items-center m-b-0">
                        <i className={`feather ${data.icon} f-30 m-r-5`} /> {data.amount}
                      </h3>
                    </div>
                    <div className="col-3 text-end">
                      <p className="m-b-0">{data.value}%</p>
                    </div>
                  </div>
                  <div className="progress m-t-30" style={{ height: '7px' }}>
                    <div
                      className={`progress-bar progress-c-theme`}
                      role="progressbar"
                      style={{ width: `${data.value}%` }}
                      aria-valuenow={data.value}
                      aria-valuemin="0"
                      aria-valuemax="100"
                    />
                  </div>
                </Card.Body>
              </Card>
            </Col>
          );
        })}
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
                        <img className="rounded-circle" style={{ width: '40px' }} src={data.gender === 'M' ? avatar2 : avatar1}  alt="activity-user" />
                      </td>
                      <td>
                      <h6 className="mb-1" style={{cursor:'pointer'}}>{data.employee_id}</h6>  
                      
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
                {tabcontent}
              </Tab>
              <Tab eventKey="week" title="Achievement">
                {tabcontent}
              </Tab>
              <Tab eventKey="all" title="All">
                {tabcontent}
              </Tab>
            </Tabs>
          </Card>
        </Col>
      </Row>
    </React.Fragment>
  );
};

export default DashDefault;