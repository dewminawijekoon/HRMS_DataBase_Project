import React, { useState, useEffect } from 'react';
import { useLocation, useNavigate } from 'react-router-dom';
import { Row, Col, Card, Button, Form } from 'react-bootstrap';
import { Toaster, toast } from 'sonner';

const LeaveRequestForm = (props) => {
  const location = useLocation();
  const navigate = useNavigate();
  const [errors, setErrors] = useState({});
  const [seebutton, setseebutton] = useState(false);
  const { details_list } = location.state || {};

  // Use useEffect to set seebutton based on request_status
  useEffect(() => {
    if (details_list.request_status === 'p' ) {
      setseebutton(true);
    } else {
      setseebutton(false);
    }
  }, [details_list]);

  const ApproveLeave = async (value) => {
    try {
      const response = await fetch('http://localhost:8000/leavings/status', {
        method: 'PUT',
        headers: {
          'Content-Type': 'application/json',
          Authorization: `Bearer ${localStorage.getItem('token')}`,
        },
        body: JSON.stringify({
          leave_request_id: value,
          status_: 'a',
        }),
      });

      if (response.ok) {
        console.log('Leave Request Approved');
        toast.success('Approve Done');
        navigate(-1);
      } else {
        console.error('Approve failed:', response.status);
      }
    } catch (error) {
      console.log('Error occurred:', error);
      setErrors({ submit: error.message });
    }
  };

  const ApproveReject = async (value) => {
    try {
      const response = await fetch('http://localhost:8000/leavings/status', {
        method: 'PUT',
        headers: {
          'Content-Type': 'application/json',
          Authorization: `Bearer ${localStorage.getItem('token')}`,
        },
        body: JSON.stringify({
          leave_request_id: value,
          status_: 'r',
        }),
      });

      if (response.ok) {
        console.log('Reject Done');
        toast.error('Leave Request Rejected');
        navigate(-1);
      } else {
        console.error('Reject failed:', response.status);
      }
    } catch (error) {
      console.log('Error occurred:', error);
      setErrors({ submit: error.message });
    }
  };

  return (
    <React.Fragment>
      <Toaster richColors />
      <div
        className="auth-wrapper d-flex justify-content-center align-items-center"
        style={{ minHeight: '100vh' }}
      >
        <div className="auth-content">
          <div className="auth-bg">
            <span className="r" />
            <span className="r s" />
            <span className="r s" />
            <span className="r" />
          </div>
          <Card className="d-flex justify-content-center align-items-center min-vh-100">
            <Card.Header>Leave Request Details</Card.Header>
            <Card.Body>
              <Form>
                <Form.Group as={Row} className="mb-3" controlId="requestId">
                  <Form.Label column sm={4}>Request ID</Form.Label>
                  <Col sm={8}>
                    <Form.Control
                      type="text"
                      value={details_list?.leave_request_id || ''}
                      readOnly
                    />
                  </Col>
                </Form.Group>

                <Form.Group as={Row} className="mb-3" controlId="employeeId">
                  <Form.Label column sm={4}>Employee ID</Form.Label>
                  <Col sm={8}>
                    <Form.Control
                      type="text"
                      value={details_list?.employee_id || ''}
                      readOnly
                    />
                  </Col>
                </Form.Group>

                <Form.Group as={Row} className="mb-3" controlId="requestDate">
                  <Form.Label column sm={4}>Request Date</Form.Label>
                  <Col sm={8}>
                    <Form.Control
                      type="date"
                      value={details_list?.request_date || ''}
                      readOnly
                    />
                  </Col>
                </Form.Group>

                <Form.Group as={Row} className="mb-3" controlId="leaveStartDate">
                  <Form.Label column sm={4}>Leave Start Date</Form.Label>
                  <Col sm={8}>
                    <Form.Control
                      type="date"
                      value={details_list?.leave_start_date || ''}
                      readOnly
                    />
                  </Col>
                </Form.Group>

                <Form.Group as={Row} className="mb-3" controlId="periodOfAbsence">
                  <Form.Label column sm={4}>Period of Absence</Form.Label>
                  <Col sm={8}>
                    <Form.Control
                      type="number"
                      value={details_list?.period_of_absence || ''}
                      readOnly
                    />
                  </Col>
                </Form.Group>

                <Form.Group as={Row} className="mb-3" controlId="reason">
                  <Form.Label column sm={4}>Reason</Form.Label>
                  <Col sm={8}>
                    <Form.Control
                      type="text"
                      value={details_list?.reason_for_absence || ''}
                      readOnly
                    />
                  </Col>
                </Form.Group>

                <Form.Group as={Row} className="mb-3" controlId="typeOfLeave">
                      <Form.Label column sm={4}>Type of Leave</Form.Label>
                      <Col sm={8}>
                        <Form.Control
                          type="text"
                          value={details_list?.type_of_leave || ''}
                          readOnly
                        />
                      </Col>
                    </Form.Group>

                    <Form.Group as={Row} className="mb-3" controlId="status">
                      <Form.Label column sm={4}>Request Status</Form.Label>
                      <Col sm={8}>
                        <Form.Control
                          type="text"
                          value={details_list?.request_status || ''}
                          readOnly
                        />
                      </Col>
                    </Form.Group>
                    {seebutton ? (
                        <>
                          <Row className="mt-4">
                            <Col>
                              <Button
                                variant="primary"
                                size="sm"
                                className="w-100"
                                onClick={() => ApproveLeave(details_list?.leave_request_id)}
                              >
                                Approve
                              </Button>
                            </Col>
                            <Col>
                              <Button
                                variant="danger"
                                size="sm"
                                className="w-100"
                                onClick={() => ApproveReject(details_list?.leave_request_id)}
                                style={{ background: '#b861ff' }}
                              >
                                Reject
                              </Button>
                            </Col>
                          </Row>
                        </>
                      ) : (
                        <p className="text-center mt-4">This request is approved</p>
                      )}


                
              </Form>
            </Card.Body>
          </Card>
        </div>
      </div>
    </React.Fragment>
  );
};

export default LeaveRequestForm;