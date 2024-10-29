import React, { useState } from 'react';
import { useRef } from 'react';
import { Row, Col, Card, Button, Form } from 'react-bootstrap';
import avatar1 from '../../assets/images/user/avatar-1.jpg';

const Profile = (props) => {
    const employeeIDRef = useRef(null);
    const firstNameRef = useRef(null);
    const lastNameRef = useRef(null);
    const birthdayRef = useRef(null);
    const Gender = useRef(null);
    const MaritalStatus = useRef(null);
    const NoOfDependents = useRef(null);
    const Address = useRef(null);
    const ContactNumber = useRef(null);
    const EfirstName = useRef(null);
    const ElastName = useRef(null);
    const EAddress = useRef(null);
    const EContactNumber = useRef(null);
    const JobTitle = useRef(null);
    const BusinessEmail = useRef(null);
    const Department = useRef(null);
    const Branch = useRef(null);
    const SupervisorID = useRef(null);
    const AnnualLeave = useRef(null);
    const CasualLeave = useRef(null);
    const NoPayLeave = useRef(null);
    const MaternityLeave = useRef(null);


    const savechanges = () => {
        setEdit();
        console.log(firstNameRef.current.value);
    }
    return (
        <>  
          <div className="auth-wrapper d-flex justify-content-center align-items-center" style={{ minHeight: '100vh' }}>
              <div className="auth-content justify-content-center align-items-center" style={{ width: '100%' }}>
                  <div className="auth-bg">
                      <span className="r" />
                      <span className="r s" />
                      <span className="r s" />
                      <span className="r" />
                  </div>

                  <Card className="mx-auto shadow-lg" lg={6} md={8} style={{ width: '85%', margin: '30px' }}>
                      <Card.Header>Employee Profile</Card.Header>
                      <Row>
                          <Col>
                              <img className="rounded-circle" style={{ width: '400px', height: '400px', margin: '80px', marginLeft: '120px' }} src={avatar1} alt="activity-user" />
                          </Col>

                          <Col lg={6} md={8}>
                              <Card.Body id='card-1' style={{ margin: '30px' }}>
                                  <Form>
                                      <Form.Group as={Row} className="mb-3" controlId="employeeID">
                                          <Form.Label column sm={4}>Employee ID</Form.Label>
                                          <Col sm={8}>
                                              <Form.Control type="text" defaultValue="001A" ref={employeeIDRef}/>
                                          </Col>
                                      </Form.Group>

                                      <Form.Group as={Row} className="mb-3" controlId="first_name">
                                          <Form.Label column sm={4}>First Name</Form.Label>
                                          <Col sm={8}>
                                              <Form.Control type="text" defaultValue="Mary" ref={firstNameRef}/>
                                          </Col>
                                      </Form.Group>

                                      <Form.Group as={Row} className="mb-3" controlId="last_name">
                                          <Form.Label column sm={4}>Last Name</Form.Label>
                                          <Col sm={8}>
                                              <Form.Control type="text" defaultValue="Stevens" ref={lastNameRef}/>
                                          </Col>
                                      </Form.Group>

                                      <Form.Group as={Row} className="mb-3" controlId="birthday">
                                          <Form.Label column sm={4}>Birthday</Form.Label>
                                          <Col sm={8}>
                                              <Form.Control type="date" defaultValue="2000-01-01" ref={birthdayRef} />
                                          </Col>
                                      </Form.Group>

                                      <Form.Group as={Row} className="mb-3" controlId="gender">
                                          <Form.Label column sm={4}>Gender</Form.Label>
                                          <Col sm={8}>
                                              <Form.Control type="text" defaultValue="Female" ref={Gender}/>
                                          </Col>
                                      </Form.Group>

                                      <Form.Group as={Row} className="mb-3" controlId="marital_status">
                                          <Form.Label column sm={4}>Marital Status</Form.Label>
                                          <Col sm={8}>
                                              <Form.Control type="text" defaultValue="Married" ref={MaritalStatus}/>
                                          </Col>
                                      </Form.Group>

                                      <Form.Group as={Row} className="mb-3" controlId="no_of_dependents">
                                          <Form.Label column sm={4}>No. of Dependents</Form.Label>
                                          <Col sm={8}>
                                              <Form.Control type="decimal" defaultValue="2" ref={NoOfDependents}/>
                                          </Col>
                                      </Form.Group>

                                      <Form.Group as={Row} className="mb-3" controlId="address">
                                          <Form.Label column sm={4}>Address</Form.Label>
                                          <Col sm={8}>
                                              <Form.Control type="text" defaultValue="No. 123, Bandaranayaka Mw., Katubedda" ref={Address}/>
                                          </Col>
                                      </Form.Group>

                                      <Form.Group as={Row} className="mb-3" controlId="contact_number">
                                          <Form.Label column sm={4}>Contact Number</Form.Label>
                                          <Col sm={8}>
                                              <Form.Control type="text" defaultValue="0123456789" ref={ContactNumber}/>
                                          </Col>
                                      </Form.Group>
                                  </Form>
                              </Card.Body>
                          </Col>
                      </Row>
                  </Card>

                  <Card className="mx-auto shadow-lg" lg={6} md={8} style={{ width: '85%', margin: '30px' }}>
                      <Card.Header>Emergency Contact Details</Card.Header>
                      <Card.Body id='card-1' style={{ margin: '30px' }}>
                          <Form>
                              <Form.Group as={Row} className="mb-3" controlId="first_name">
                                  <Form.Label column sm={4}>First Name</Form.Label>
                                  <Col sm={8}>
                                      <Form.Control type="text" defaultValue="Mary" ref={EfirstName}/>
                                  </Col>
                              </Form.Group>

                              <Form.Group as={Row} className="mb-3" controlId="last_name">
                                  <Form.Label column sm={4}>Last Name</Form.Label>
                                  <Col sm={8}>
                                      <Form.Control type="text" defaultValue="Stevens" ref={ElastName}/>
                                  </Col>
                              </Form.Group>

                              <Form.Group as={Row} className="mb-3" controlId="address">
                                  <Form.Label column sm={4}>Address</Form.Label>
                                  <Col sm={8}>
                                      <Form.Control type="text" defaultValue="No. 123, Bandaranayaka Mw., Katubedda" ref={EAddress}/>
                                  </Col>
                              </Form.Group>

                              <Form.Group as={Row} className="mb-3" controlId="contact_number">
                                  <Form.Label column sm={4}>Contact Number</Form.Label>
                                  <Col sm={8}>
                                      <Form.Control type="text" defaultValue="0123456789" ref={EContactNumber} />
                                  </Col>
                              </Form.Group>
                          </Form>
                      </Card.Body>
                  </Card>

                  <Card className="mx-auto shadow-lg" lg={6} md={8} style={{ width: '85%', margin: '30px' }}>
                      <Card.Header>Employee Details</Card.Header>
                      <Card.Body id='card-1' style={{ margin: '30px' }}>
                          <Form>
                              <Form.Group as={Row} className="mb-3" controlId="job_title">
                                  <Form.Label column sm={4}>Job Title</Form.Label>
                                  <Col sm={8}>
                                      <Form.Control type="text" defaultValue="Software Engineer" ref={JobTitle}/>
                                  </Col>
                              </Form.Group>

                              <Form.Group as={Row} className="mb-3" controlId="business_email">
                                  <Form.Label column sm={4}>Business Email</Form.Label>
                                  <Col sm={8}>
                                      <Form.Control type="text" defaultValue="abc@jupiter.com" ref={BusinessEmail} />
                                  </Col>
                              </Form.Group>

                              <Form.Group as={Row} className="mb-3" controlId="department">
                                  <Form.Label column sm={4}>Department</Form.Label>
                                  <Col sm={8}>
                                      <Form.Control type="text" defaultValue="Technical Department" ref={Department}/>
                                  </Col>
                              </Form.Group>

                              <Form.Group as={Row} className="mb-3" controlId="branch">
                                  <Form.Label column sm={4}>Branch</Form.Label>
                                  <Col sm={8}>
                                      <Form.Control type="text" defaultValue="Colombo" ref={Branch} />
                                  </Col>
                              </Form.Group>

                              <Form.Group as={Row} className="mb-3" controlId="supervisor_id">
                                  <Form.Label column sm={4}>Supervisor ID</Form.Label>
                                  <Col sm={8}>
                                      <Form.Control type="text" defaultValue="002B" ref={SupervisorID}/>
                                  </Col>
                              </Form.Group>
                          </Form>
                      </Card.Body>
                  </Card>

                  <Card className="mx-auto shadow-lg" lg={6} md={8} style={{ width: '85%', margin: '30px' }}>
                      <Card.Header>Remaining Leave Count</Card.Header>
                      <Card.Body id='card-1' style={{ margin: '30px' }}>
                          <Form>
                              <Form.Group as={Row} className="mb-3" controlId="annual_leave">
                                  <Form.Label column sm={4}>Annual Leaves</Form.Label>
                                  <Col sm={8}>
                                      <Form.Control type="decimal" defaultValue="20" ref={AnnualLeave} />
                                  </Col>
                              </Form.Group>

                              <Form.Group as={Row} className="mb-3" controlId="casual_leave">
                                  <Form.Label column sm={4}>Casual Leaves</Form.Label>
                                  <Col sm={8}>
                                      <Form.Control type="decimal" defaultValue="15" ref={CasualLeave}/>
                                  </Col>
                              </Form.Group>

                              <Form.Group as={Row} className="mb-3" controlId="nopay_leave">
                                  <Form.Label column sm={4}>No-pay Leaves</Form.Label>
                                  <Col sm={8}>
                                      <Form.Control type="decimal" defaultValue="50" ref={NoPayLeave} />
                                  </Col>
                              </Form.Group>

                              <Form.Group as={Row} className="mb-3" controlId="maternity_leave">
                                  <Form.Label column sm={4}>Maternity Leaves</Form.Label>
                                  <Col sm={8}>
                                      <Form.Control type="decimal" defaultValue="90" ref={MaternityLeave}/>
                                  </Col>
                              </Form.Group>
                          </Form>
                      </Card.Body>
                  </Card>
                  <Card className="mx-auto shadow-lg" lg={6} md={8} style={{ width: '85%', margin: '30px' }}>
                      <Card.Header>Save Details</Card.Header>
                      <Card.Body id='card-1' style={{ margin: '30px' }}>
                          <Button variant="primary" size="sm" className="w-100" onClick={() => savechanges()}>
                              Save
                          </Button>
                      </Card.Body>
                  </Card>
              </div>
          </div>    
        </>
    );
};

export default Profile;
