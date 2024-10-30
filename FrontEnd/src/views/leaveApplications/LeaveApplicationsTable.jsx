import React, { useState, useEffect } from 'react';
import { Row, Col, Card, Table, Button } from 'react-bootstrap';
import { useNavigate } from 'react-router-dom';

let leaveRequestDetails = [
  { request_id: '111', employee_id: '001A', request_date: '12/12/2021', leave_start_date: '13/12/2012', period_of_absence: '2', reason: 'Sick Leave', type_of_leave: 'Annual', Name: 'Bhanuka' },
  { request_id: '112', employee_id: '001B', request_date: '12/12/2021', leave_start_date: '13/12/2012', period_of_absence: '2', reason: 'Sick Leave', type_of_leave: 'Annual', Name: 'Umesha' },
];

const LeaveApplications = () => {
  let navigate = useNavigate();
  const [isSubmitting, setIsSubmitting] = useState(false);

  useEffect(() => {
    getApprovalList();
  }, []);

  const getApprovalList = async () => {
    setIsSubmitting(true);
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
        leaveRequestDetails = data;
        console.log('succuess');
        console.log(data); // Handle the fetched data here
      } else {
        console.error('Failed to fetch leave requests:', response.status);
      }
    } catch (error) {
      console.error('Error fetching leave requests:', error);
    } finally {
      setIsSubmitting(false);
    }
  };

  const viewLeaveRequest = (data) => {
    console.log("Viewed", data);
    console.log('this is view function',data)
    navigate('./leave-request-form', { state:  { details_list:data } });
  };

  return (
    <React.Fragment>
      <Row>  
        <Card className="Recent-Users widget-focus-lg">
          <Card.Header>
            <Card.Title as="h5">Leave Applications</Card.Title>
          </Card.Header>

          <Card.Body className="px-0 py-2">
            <Table responsive hover className="recent-users">
              <thead>
                <tr>
                  <th><h6 className="mb-1">first name</h6></th>
                  <th><h6 className="mb-1">last name</h6></th>
                  <th><h6 className="mb-1">Leave Start Date</h6></th>
                  <th><h6 className="mb-1">type of leave</h6></th>
                  <th></th>
                </tr>
              </thead>
              <tbody>
                {leaveRequestDetails.map((data, index) => {
                  //const { request_id, employee_id, leave_start_date, Name } = data;
                  return (
                    <tr key={index} className="unread">
                      <td><h6 className="mb-1">{data.first_name || ''}</h6></td>
                      <td><h6 className="mb-1">{data.last_name || ''}</h6></td>
                      <td><h6 className="mb-1">{data.leave_start_date || ''}</h6></td>
                      <td><h6 className="mb-1">{data.type_of_leave || ''}</h6></td>
                      <td>
                        <Button
                          variant="primary"
                          size="sm"
                          style={{ marginLeft: '50px', background: '#47b9ff' }}
                          onClick={() => viewLeaveRequest(data)}
                        >
                          View
                        </Button>
                      </td>
                    </tr>
                  );
                })}
              </tbody>
            </Table>
          </Card.Body>
        </Card>
      </Row>
    </React.Fragment>
  );
};

export default LeaveApplications;
