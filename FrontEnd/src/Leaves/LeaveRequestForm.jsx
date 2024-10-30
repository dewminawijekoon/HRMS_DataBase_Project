import { color } from 'd3';
import React, { useState } from 'react';
import { Row, Col, Card, Button, Form } from 'react-bootstrap';
import { Toaster, toast } from 'sonner';

const LeaveForm = () => {
  const [employeeId, setEmployeeId] = useState('');
  const [leaveStartDate, setLeaveStartDate] = useState('');
  const [periodOfAbsence, setPeriodOfAbsence] = useState('');
  const [reason, setReason] = useState('');
  const [typeOfLeave, setTypeOfLeave] = useState('');

  const handleSubmit = (e) => {
    e.preventDefault();
  
    const formattedDate = new Date(leaveStartDate).toISOString().split('T')[0];
  
    fetch('http://127.0.0.1:8000/leave/request', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${localStorage.getItem('token')}`,
      },
      body: JSON.stringify({
        employee_id: employeeId,
        leave_start_date: formattedDate,
        period_of_absence: periodOfAbsence.toString(),
        reason_for_absence: reason,
        type_of_leave: typeOfLeave,
      }),
    })
      .then(async (response) => {
        if (response.ok) {
          console.log('Form submitted successfully');
          toast.success('Leave application submitted successfully', {style:{ color: 'green'}}); 
          setEmployeeId('');
          setLeaveStartDate('');
          setPeriodOfAbsence('');
          setReason('');
          setTypeOfLeave('');
        } else {
          const errorData = await response.json(); // Parse error details
          console.error('Failed to submit the form:', errorData);
        }
      })
      .catch((error) => {
        console.error('Error submitting the form:', error);
      });
  };
  

  return (
    <React.Fragment>
      <Toaster />
      <Card className='d-flex justify-content-center align-items-center min-vh-100' style={{ width: '70%', marginLeft: '200px' }}>
        <Card.Header style={{ fontSize: '30px' }}>Leave Application</Card.Header>
        <Card.Body>
          <Form style={{ width: '450px' }} onSubmit={handleSubmit}>
            <Form.Group as={Row} className="mb-3" controlId="employeeId">
              <Form.Label column sm={4}>Employee ID</Form.Label>
              <Col sm={8}>
                <Form.Control type="text" value={employeeId} onChange={(e) => setEmployeeId(e.target.value)} />
              </Col>
            </Form.Group>

            <Form.Group as={Row} className="mb-3" controlId="leaveStartDate">
              <Form.Label column sm={4}>Leave Start Date</Form.Label>
              <Col sm={8}>
                <Form.Control type="date" value={leaveStartDate} onChange={(e) => setLeaveStartDate(e.target.value)} />
              </Col>
            </Form.Group>

            <Form.Group as={Row} className="mb-3" controlId="periodOfAbsence">
              <Form.Label column sm={4}>Period of Absence</Form.Label>
              <Col sm={8}>
                <Form.Control type="text" value={periodOfAbsence} onChange={(e) => setPeriodOfAbsence(e.target.value)} />
              </Col>
            </Form.Group>

            <Form.Group as={Row} className="mb-3" controlId="reason">
              <Form.Label column sm={4}>Reason</Form.Label>
              <Col sm={8}>
                <Form.Control type="text" value={reason} onChange={(e) => setReason(e.target.value)} />
              </Col>
            </Form.Group>

            <Form.Group as={Row} className="mb-3" controlId="typeOfLeave">
              <Form.Label column sm={4}>Type of Leave</Form.Label>
              <Col sm={8}>
                <Form.Select value={typeOfLeave} onChange={(e) => setTypeOfLeave(e.target.value)}>
                  <option value="">Select Leave Type</option>
                  <option value="Annual">Annual Leave</option>
                  <option value="Casual">Casual Leave</option>
                  <option value="Maternity">Maternity Leave</option>
                  <option value="No-Pay">No-Pay Leave</option>
                </Form.Select>
              </Col>
            </Form.Group>

            <Row className="mt-4">
              <Col style={{ marginLeft: '350px' }}>
                <Button variant="primary" size="sm" type="submit">Submit</Button>
              </Col>
            </Row>
          </Form>
        </Card.Body>
      </Card>
    </React.Fragment>
  );
};

export default LeaveForm;