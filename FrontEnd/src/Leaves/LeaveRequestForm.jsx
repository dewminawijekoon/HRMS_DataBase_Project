import React, {useState} from 'react';
import { useLocation } from 'react-router-dom';
import { Row, Col, Card, Button, Form, FormGroup } from 'react-bootstrap';

const LeaveForm = ( ) => {
  const [requestId, setRequestId] = useState('');
  const [employeeId, setEmployeeId] = useState('');
  const [requestDate, setRequestDate] = useState('');
  const [leaveStartDate, setLeaveStartDate] = useState('');
  const [periodOfAbsence, setPeriodOfAbsence] = useState('');
  const [reason, setReason] = useState('');
  const [typeOfLeave, setTypeOfLeave] = useState('');
  const [status, setStatus] = useState('');

  const handleSubmit = (e) => {
    e.preventDefault();
    console.log('Form submitted');
    console.log(requestId, employeeId, requestDate, leaveStartDate, periodOfAbsence, reason, typeOfLeave, status);
  };

  const data = {
    requestId,
    employeeId,
    requestDate,
    leaveStartDate,
    periodOfAbsence,
    reason,
    typeOfLeave,
    status,
  }

    return (
        <React.Fragment>
        <Card className='d-flex justify-content-center align-items-center min-vh-100' style={{width: '70%', marginLeft: '200px'}}>
            <Card.Header style={{fontSize: '30px'}}>Leave Application</Card.Header>
            <Card.Body>
                <Form style={{width:'450px'}}>

                    <Form.Group as={Row} className="mb-3" controlId="requestId">
                    <Form.Label column sm={4}>Request ID</Form.Label>
                    <Col sm={8}>
                        <Form.Control type="text" defaultValue='001' readOnly/>
                    </Col>
                    </Form.Group>
        
                    <Form.Group as={Row} className="mb-3" controlId="employeeId">
                    <Form.Label column sm={4}>Employee ID</Form.Label>
                    <Col sm={8}>
                        <Form.Control type="text" value={employeeId} onChange={(e) => setEmployeeId(e.target.value)}/>
                    </Col>
                    </Form.Group>

                    <Form.Group as={Row} className="mb-3" controlId="requestDate">
                    <Form.Label column sm={4}>Request Date</Form.Label>
                    <Col sm={8}>
                        <Form.Control type="date" value={requestDate} onChange={(e) => setRequestDate(e.target.value)}/>
                    </Col>
                    </Form.Group>

                    <Form.Group as={Row} className="mb-3" controlId="leaveStartDate">
                    <Form.Label column sm={4}>Leave Start Date</Form.Label>
                    <Col sm={8}>
                        <Form.Control type="date" value={leaveStartDate} onChange={(e) => setLeaveStartDate(e.target.value)}/>
                    </Col>
                    </Form.Group>

                    <Form.Group as={Row} className="mb-3" controlId="periodOfAbsence">
                    <Form.Label column sm={4}>Period of Absence</Form.Label>
                    <Col sm={8}>
                        <Form.Control type="number" value={periodOfAbsence} onChange={(e) => setPeriodOfAbsence(e.target.value)}/>
                    </Col>
                    </Form.Group>

                    <Form.Group as={Row} className="mb-3" controlId="reason">
                    <Form.Label column sm={4}>Reason</Form.Label>
                    <Col sm={8}>
                        <Form.Control type="text" value={reason} onChange={(e) => setReason(e.target.value)}/>
                    </Col>
                    </Form.Group>

                    <Form.Group as={Row} className="mb-3" controlId="typeOfLeave">
                    <Form.Label column sm={4}>Type of Leave</Form.Label>
                    <Col sm={8}>
                        <Form.Control type="text" value={typeOfLeave} onChange={(e) => setTypeOfLeave(e.target.value)}/>
                    </Col>
                    </Form.Group>

                    <Form.Group as={Row} className="mb-3" controlId="status">
                    <Form.Label column sm={4}>Request Status</Form.Label>
                    <Col sm={8}>
                        <Form.Control type="text" defaultValue="Pending" onChange={(e) => setStatus(e.target.value)}/>
                    </Col>
                    </Form.Group>
                    
                    <Row className="mt-4">
                    <Col style={{marginLeft:'350px'}}>
                        <Button variant="primary" size="sm" onClick={handleSubmit}>Submit</Button>
                    </Col>
                    </Row>

                </Form>
            </Card.Body>
        
        </Card>
    </React.Fragment>
    )
};

export default LeaveForm;