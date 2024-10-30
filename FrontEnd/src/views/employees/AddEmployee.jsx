import React, { useState } from 'react';
import { useRef } from 'react';
import { Row, Col, Card, Button, Form } from 'react-bootstrap';
import avatar1 from '../../assets/images/user/avatar-1.jpg';
import avatar2 from '../../assets/images/user/avatar-2.jpg';
import { Toaster, toast } from 'sonner';
import { useNavigate } from 'react-router-dom';

const Profile = (props) => {

    const [isSubmitting, setIsSubmitting] = useState(false);
    const [errors, setErrors] = useState({});
    const navigate = useNavigate();


    const firstNameRef = useRef(null);
    const lastNameRef = useRef(null);
    const birthdayRef = useRef(null);
    const Gender = useRef(null);
    const MaritalStatus = useRef(null);
    const NoOfDependents = useRef(null);
    const Address = useRef(null);
    const ContactNumber = useRef(null);
    const EfirstName = useRef(null);
    const ENIC = useRef(null);
    const EAddress = useRef(null);
    const EContactNumber = useRef(null);
    const JobTitle = useRef(null);
    const BusinessEmail = useRef(null);
    const Department = useRef(null);
    const Branch = useRef(null);
    const employeenic = useRef(null);
    const Employeestatus = useRef(null);


    const savechanges = async () => {
        console.log(Gender.current.value);
        setIsSubmitting(true);
        try {
            const response = await fetch('http://localhost:8000/employee/new', {
                method: 'POST',
                headers: {
                  'Content-Type': 'application/json',
                  'Authorization': `Bearer ${localStorage.getItem('token')}`
                },
                body: JSON.stringify({
                    employee_id: 'null', 
                    first_name: firstNameRef.current.value,
                    last_name: lastNameRef.current.value,
                    birthday: birthdayRef.current.value,
                    nic: employeenic.current.value,
                    gender: Gender.current.value,
                    marital_status: MaritalStatus.current.value,
                    number_of_dependents: NoOfDependents.current.value,
                    address: Address.current.value,
                    contact_number: ContactNumber.current.value,
                    business_email: BusinessEmail.current.value,
                    job_title: JobTitle.current.value,
                    employee_status: Employeestatus.current.value,
                    department_name: Department.current.value,
                    branch_name: Branch.current.value,
                    profile_photo: 'null',
                    emergency_contact_name: EfirstName.current.value,
                    emergency_contact_nic: ENIC.current.value,
                    emergency_contact_address:EAddress.current.value,
                    emergency_contact_number: EContactNumber.current.value
                }),
              });
              if (response.ok) {
                const data = await response.json();
                console.log('Sucsessfully Added');
                toast.success('Employee Added Successfully');
                navigate(0);
              } else {
                console.error('Add Employee failed:', response.status);
              }
        }
        catch (error) {
            console.log('Error occurred:', error);
            setErrors({ submit: error.message });
        }
        finally{
            setIsSubmitting(false);
        }
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
                              <img className="rounded-circle js-msg-class" style={{ width: '300px', height: '300px', margin: '80px' }} src={avatar2} alt="activity-user" />
                          </Col>

                          <Col lg={6} md={8}>
                              <Card.Body id='card-1' style={{ margin: '30px' }}>
                                  <Form>
                                      
                                      <Form.Group as={Row} className="mb-3" controlId="first_name">
                                          <Form.Label column sm={4}>First Name</Form.Label>
                                          <Col sm={8}>
                                              <Form.Control type="text" defaultValue="" ref={firstNameRef}/>
                                          </Col>
                                      </Form.Group>

                                      <Form.Group as={Row} className="mb-3" controlId="last_name">
                                          <Form.Label column sm={4}>Last Name</Form.Label>
                                          <Col sm={8}>
                                              <Form.Control type="text" defaultValue="" ref={lastNameRef}/>
                                          </Col>
                                      </Form.Group>

                                      <Form.Group as={Row} className="mb-3" controlId="birthday">
                                          <Form.Label column sm={4}>Birthday</Form.Label>
                                          <Col sm={8}>
                                              <Form.Control type="date" defaultValue="" ref={birthdayRef} />
                                          </Col>
                                      </Form.Group>

                                      <Form.Group as={Row} className="mb-3" controlId="birthday">
                                          <Form.Label column sm={4}>NIC</Form.Label>
                                          <Col sm={8}>
                                              <Form.Control type="text" defaultValue="" ref={employeenic} />
                                          </Col>
                                      </Form.Group>

                                      <Form.Group as={Row} className="mb-3" controlId="gender">
                                        <Form.Label column sm={4}>Gender</Form.Label>
                                        <Col sm={8}>
                                            <Form.Control as="select" defaultValue="" ref={Gender}>
                                            <option value="">Select Gender</option>
                                            <option value="male">Male</option>
                                            <option value="female">Female</option>
                                            </Form.Control>
                                        </Col>
                                      </Form.Group>

                                      <Form.Group as={Row} className="mb-3" controlId="marital_status">
                                          <Form.Label column sm={4}>Marital Status</Form.Label>
                                          <Col sm={8}>
                                              <Form.Control as="select" defaultValue="" ref={MaritalStatus}>
                                              <option value="">Select status</option>
                                              <option value="Married">Married</option>
                                              <option value="Single">Single</option>
                                              </Form.Control>
                                          </Col>
                                      </Form.Group>

                                      <Form.Group as={Row} className="mb-3" controlId="marital_status">
                                          <Form.Label column sm={4}>Employee status</Form.Label>
                                          <Col sm={8}>
                                              <Form.Control as="select" defaultValue="" ref={Employeestatus}>
                                              <option value="">Select employee status</option>
                                              <option value="Part Time">Part Time</option>
                                              <option value="Full Time">Full Time</option>
                                              </Form.Control>
                                          </Col>
                                      </Form.Group>

                                      <Form.Group as={Row} className="mb-3" controlId="no_of_dependents">
                                          <Form.Label column sm={4}>No. of Dependents</Form.Label>
                                          <Col sm={8}>
                                              <Form.Control type="number" defaultValue="" ref={NoOfDependents}/>
                                          </Col>
                                      </Form.Group>

                                      <Form.Group as={Row} className="mb-3" controlId="address">
                                          <Form.Label column sm={4}>Address</Form.Label>
                                          <Col sm={8}>
                                              <Form.Control type="text" defaultValue="" ref={Address}/>
                                          </Col>
                                      </Form.Group>

                                      <Form.Group as={Row} className="mb-3" controlId="contact_number">
                                          <Form.Label column sm={4}>Contact Number</Form.Label>
                                          <Col sm={8}>
                                              <Form.Control type="text" defaultValue="" ref={ContactNumber}/>
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
                                  <Form.Label column sm={4}>Name</Form.Label>
                                  <Col sm={8}>
                                      <Form.Control type="text" defaultValue="" ref={EfirstName}/>
                                  </Col>
                              </Form.Group>

                              <Form.Group as={Row} className="mb-3" controlId="last_name">
                                  <Form.Label column sm={4}>NIC</Form.Label>
                                  <Col sm={8}>
                                      <Form.Control type="text" defaultValue="" ref={ENIC}/>
                                  </Col>
                              </Form.Group>

                              <Form.Group as={Row} className="mb-3" controlId="address">
                                  <Form.Label column sm={4}>Address</Form.Label>
                                  <Col sm={8}>
                                      <Form.Control type="text" defaultValue="" ref={EAddress}/>
                                  </Col>
                              </Form.Group>

                              <Form.Group as={Row} className="mb-3" controlId="contact_number">
                                  <Form.Label column sm={4}>Contact Number</Form.Label>
                                  <Col sm={8}>
                                      <Form.Control type="text" defaultValue="" ref={EContactNumber} />
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
                                      <Form.Control as="select" defaultValue="" ref={JobTitle}>
                                      <option value="">Select job title</option>
                                      <option value="HR Manager">HR Manager</option>
                                      <option value="Accountant">Accountant</option>
                                      <option value="Cleaner">Cleaner</option>
                                      <option value="HR assistent">HR assistent</option>
                                      <option value="QA Engineer">QA Engineer</option>
                                      <option value="Worker">Worker</option>
                                      <option value="Software enginner">Software enginner</option>
                                      </Form.Control>
                                  </Col>
                              </Form.Group>

                              <Form.Group as={Row} className="mb-3" controlId="business_email">
                                  <Form.Label column sm={4}>Business Email</Form.Label>
                                  <Col sm={8}>
                                      <Form.Control type="text" defaultValue="" ref={BusinessEmail} />
                                  </Col>
                              </Form.Group>

                              <Form.Group as={Row} className="mb-3" controlId="department">
                                  <Form.Label column sm={4}>Department</Form.Label>
                                  <Col sm={8}>
                                      <Form.Control as="select" defaultValue="" ref={Department}>
                                      <option value="">Select Department</option>
                                      <option value="HR">HR</option>
                                      <option value="IT">IT</option>
                                      <option value="Finance">Finance</option>
                                      <option value="Main">Main</option>
                                      </Form.Control>
                                  </Col>
                              </Form.Group>

                              <Form.Group as={Row} className="mb-3" controlId="branch">
                                  <Form.Label column sm={4}>Branch</Form.Label>
                                  <Col sm={8}>
                                      <Form.Control as="select" defaultValue="" ref={Branch}>
                                      <option value="">Select Branch</option>
                                      <option value="Headquarters">Headquarters</option>
                                      <option value="Branch A">Branch A</option>
                                      <option value="Branch B">Branch B</option>
                                      </Form.Control>
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
