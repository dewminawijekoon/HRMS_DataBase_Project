import React, { useState,useEffect } from 'react';
import { useRef } from 'react';
import { useNavigate, useLocation } from 'react-router-dom';
import { Row, Col, Card, Button, Form } from 'react-bootstrap';
import avatar1 from '../../assets/images/user/avatar-1.jpg';

const Profile = (props) => {
    const [edit, setEdit] = useState(false);
    const [isSubmitting, setIsSubmitting] = useState(false);
    const [errors, setErrors] = useState({});
    const [employeeDetails, setEmployeeDetails] = useState({});
    const location = useLocation();
    const { employee_id } = location.state || {};
    console.log(employee_id);
    console.log(location);



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

    useEffect(() => {
            console.log("this is employee profile details");
            getEmployeeDetails(employee_id);
        
    }, [employee_id]);
   

    const getEmployeeDetails = async (id) => {
        setIsSubmitting(true);
        try {
            const response = await fetch(`http://localhost:8000/employee_/${id}`, {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Bearer ${localStorage.getItem('token')}`
                }
            });
            if (response.ok) {
                const data = await response.json();
                setEmployeeDetails(data);
                console.log('Received success');
                console.log(data);
            } else {
                console.error('Receive failed:', response.status);
            }
        } catch (error) {
            console.log('Error occurred:', error);
        } finally {
            setIsSubmitting(false);
        }
    };

    const handleChange = (e) => {
        const { name, value } = e.target;
        setEmployeeDetails((prevDetails) => ({
            ...prevDetails,
            [name]: value,
        }));
    };

    const getmyprofiledata = async(user_name) => {
        setIsSubmitting(true);
        try {
            const response = await fetch(`http://localhost:8000/employee/${user_name}`, {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Bearer ${localStorage.getItem('token')}`
                }
            });
            if (response.ok) {
                const data = await response.json();
                setEmployeeDetails(data);
                console.log('Received success');
                console.log(data);
            } else {
                console.error('Receive failed:', response.status);
            }
        } catch (error) {
            console.log('Error occurred:', error);
        } finally {
            setIsSubmitting(false);
        }
    }

    const changepage = (value) => {
        setEdit(value);
    };

    const savechanges = () => {
        setEdit(false);
        console.log(employeeDetails.first_name);  // Example usage
    };


    return (
        <>
            {edit ? (
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
                                                <Form.Control
                                                    type="text"
                                                    value={employeeDetails.employee_id || ''}
                                                    ref={employeeIDRef}
                                                />
                                            </Col>
                                        </Form.Group>
                                        <Form.Group as={Row} className="mb-3" controlId="first_name">
                                            <Form.Label column sm={4}>First Name</Form.Label>
                                            <Col sm={8}>
                                                <Form.Control type="text" value={employeeDetails.first_name || ''} ref={firstNameRef}/>
                                            </Col>
                                        </Form.Group>

                                        <Form.Group as={Row} className="mb-3" controlId="last_name">
                                            <Form.Label column sm={4}>Last Name</Form.Label>
                                            <Col sm={8}>
                                                <Form.Control type="text" value={employeeDetails.last_name || ''} ref={lastNameRef}/>
                                            </Col>
                                        </Form.Group>

                                        <Form.Group as={Row} className="mb-3" controlId="birthday">
                                            <Form.Label column sm={4}>Birthday</Form.Label>
                                            <Col sm={8}>
                                                <Form.Control type="date" value={employeeDetails.birthday || ''} ref={birthdayRef} />
                                            </Col>
                                        </Form.Group>

                                        <Form.Group as={Row} className="mb-3" controlId="gender">
                                            <Form.Label column sm={4}>Gender</Form.Label>
                                            <Col sm={8}>
                                                <Form.Control type="text" value={employeeDetails.gender || ''} ref={Gender}/>
                                            </Col>
                                        </Form.Group>

                                        <Form.Group as={Row} className="mb-3" controlId="marital_status">
                                            <Form.Label column sm={4}>Marital Status</Form.Label>
                                            <Col sm={8}>
                                                <Form.Control type="text" value={employeeDetails.marital_status || ''} ref={MaritalStatus}/>
                                            </Col>
                                        </Form.Group>

                                        <Form.Group as={Row} className="mb-3" controlId="no_of_dependents">
                                            <Form.Label column sm={4}>No. of Dependents</Form.Label>
                                            <Col sm={8}>
                                                <Form.Control type="decimal" value={employeeDetails.number_of_dependents || ''} ref={NoOfDependents}/>
                                            </Col>
                                        </Form.Group>

                                        <Form.Group as={Row} className="mb-3" controlId="address">
                                            <Form.Label column sm={4}>Address</Form.Label>
                                            <Col sm={8}>
                                                <Form.Control type="text" value={employeeDetails.address || ''} ref={Address}/>
                                            </Col>
                                        </Form.Group>

                                        <Form.Group as={Row} className="mb-3" controlId="contact_number">
                                            <Form.Label column sm={4}>Contact Number</Form.Label>
                                            <Col sm={8}>
                                                <Form.Control type="text" value={employeeDetails.contact_number || ''} ref={ContactNumber}/>
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
                                        <Form.Control type="text" value={employeeDetails.emergency_contact_name || ''} ref={EfirstName}/>
                                    </Col>
                                </Form.Group>

                                <Form.Group as={Row} className="mb-3" controlId="address">
                                    <Form.Label column sm={4}>Address</Form.Label>
                                    <Col sm={8}>
                                        <Form.Control type="text" value={employeeDetails.emergency_contact_address || ''} ref={EAddress}/>
                                    </Col>
                                </Form.Group>

                                <Form.Group as={Row} className="mb-3" controlId="contact_number">
                                    <Form.Label column sm={4}>Contact Number</Form.Label>
                                    <Col sm={8}>
                                        <Form.Control type="text" value={employeeDetails.emergency_contact_number || ''} ref={EContactNumber} />
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
                                        <Form.Control type="text" value={employeeDetails.job_title || ''} ref={JobTitle}/>
                                    </Col>
                                </Form.Group>

                                <Form.Group as={Row} className="mb-3" controlId="business_email">
                                    <Form.Label column sm={4}>Business Email</Form.Label>
                                    <Col sm={8}>
                                        <Form.Control type="text" value={employeeDetails.business_email || ''} ref={BusinessEmail} />
                                    </Col>
                                </Form.Group>

                                <Form.Group as={Row} className="mb-3" controlId="department">
                                    <Form.Label column sm={4}>Department</Form.Label>
                                    <Col sm={8}>
                                        <Form.Control type="text" value={employeeDetails.department_name || ''} ref={Department}/>
                                    </Col>
                                </Form.Group>

                                <Form.Group as={Row} className="mb-3" controlId="branch">
                                    <Form.Label column sm={4}>Branch</Form.Label>
                                    <Col sm={8}>
                                        <Form.Control type="text" value={employeeDetails.branch_name || ''} ref={Branch} />
                                    </Col>
                                </Form.Group>

                            </Form>
                        </Card.Body>
                    </Card>
                    <Card className="mx-auto shadow-lg" lg={6} md={8} style={{ width: '85%', margin: '30px' }}>
                        <Card.Header>Save Details</Card.Header>
                        <Card.Body id='card-1' style={{ margin: '30px' }}>
                            <Button variant="primary" size="sm" className="w-100" onClick={() => savechanges('false')}>
                                Save
                            </Button>
                        </Card.Body>
                    </Card>
                </div>
            </div>
            ) : (
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
                                                    <Form.Control type="text" value={employeeDetails.employee_id || ''}readOnly />
                                                </Col>
                                            </Form.Group>

                                            <Form.Group as={Row} className="mb-3" controlId="first_name">
                                                <Form.Label column sm={4}>First Name</Form.Label>
                                                <Col sm={8}>
                                                    <Form.Control type="text" value={employeeDetails.first_name || ''}readOnly />
                                                </Col>
                                            </Form.Group>

                                            <Form.Group as={Row} className="mb-3" controlId="last_name">
                                                <Form.Label column sm={4}>Last Name</Form.Label>
                                                <Col sm={8}>
                                                    <Form.Control type="text" value={employeeDetails.last_name || ''} readOnly />
                                                </Col>
                                            </Form.Group>

                                            <Form.Group as={Row} className="mb-3" controlId="birthday">
                                                <Form.Label column sm={4}>Birthday</Form.Label>
                                                <Col sm={8}>
                                                    <Form.Control type="text" value={employeeDetails.birthday || ''} readOnly />
                                                </Col>
                                            </Form.Group>

                                            <Form.Group as={Row} className="mb-3" controlId="gender">
                                                <Form.Label column sm={4}>Gender</Form.Label>
                                                <Col sm={8}>
                                                    <Form.Control type="text" value={employeeDetails.gender || ''} readOnly />
                                                </Col>
                                            </Form.Group>

                                            <Form.Group as={Row} className="mb-3" controlId="marital_status">
                                                <Form.Label column sm={4}>Marital Status</Form.Label>
                                                <Col sm={8}>
                                                    <Form.Control type="text" value={employeeDetails.marital_status || ''} readOnly />
                                                </Col>
                                            </Form.Group>

                                            <Form.Group as={Row} className="mb-3" controlId="no_of_dependents">
                                                <Form.Label column sm={4}>No. of Dependents</Form.Label>
                                                <Col sm={8}>
                                                    <Form.Control type="decimal" value={employeeDetails.number_of_dependents || ''} readOnly />
                                                </Col>
                                            </Form.Group>

                                            <Form.Group as={Row} className="mb-3" controlId="address">
                                                <Form.Label column sm={4}>Address</Form.Label>
                                                <Col sm={8}>
                                                    <Form.Control type="text" value={employeeDetails.address || ''} readOnly />
                                                </Col>
                                            </Form.Group>

                                            <Form.Group as={Row} className="mb-3" controlId="contact_number">
                                                <Form.Label column sm={4}>Contact Number</Form.Label>
                                                <Col sm={8}>
                                                    <Form.Control type="text" value={employeeDetails.contact_number || ''} readOnly />
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
                                            <Form.Control type="text" value={employeeDetails.emergency_contact_name || ''} readOnly />
                                        </Col>
                                    </Form.Group>


                                    <Form.Group as={Row} className="mb-3" controlId="address">
                                        <Form.Label column sm={4}>Address</Form.Label>
                                        <Col sm={8}>
                                            <Form.Control type="text" value={employeeDetails.emergency_contact_address || ''} readOnly />
                                        </Col>
                                    </Form.Group>

                                    <Form.Group as={Row} className="mb-3" controlId="contact_number">
                                        <Form.Label column sm={4}>Contact Number</Form.Label>
                                        <Col sm={8}>
                                            <Form.Control type="text" value={employeeDetails.emergency_contact_number || ''} readOnly />
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
                                            <Form.Control type="text" value={employeeDetails.job_title || ''} readOnly />
                                        </Col>
                                    </Form.Group>

                                    <Form.Group as={Row} className="mb-3" controlId="business_email">
                                        <Form.Label column sm={4}>Business Email</Form.Label>
                                        <Col sm={8}>
                                            <Form.Control type="text" value={employeeDetails.business_email || ''} readOnly />
                                        </Col>
                                    </Form.Group>

                                    <Form.Group as={Row} className="mb-3" controlId="department">
                                        <Form.Label column sm={4}>Department</Form.Label>
                                        <Col sm={8}>
                                            <Form.Control type="text" value={employeeDetails.department_name || ''} readOnly />
                                        </Col>
                                    </Form.Group>

                                    <Form.Group as={Row} className="mb-3" controlId="branch">
                                        <Form.Label column sm={4}>Branch</Form.Label>
                                        <Col sm={8}>
                                            <Form.Control type="text" value={employeeDetails.branch_name || ''} readOnly />
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
                                            <Form.Control type="decimal" value={employeeDetails.branch_name || ''} readOnly />
                                        </Col>
                                    </Form.Group>

                                    <Form.Group as={Row} className="mb-3" controlId="casual_leave">
                                        <Form.Label column sm={4}>Casual Leaves</Form.Label>
                                        <Col sm={8}>
                                            <Form.Control type="decimal" value={employeeDetails.branch_name || ''} readOnly />
                                        </Col>
                                    </Form.Group>

                                    <Form.Group as={Row} className="mb-3" controlId="nopay_leave">
                                        <Form.Label column sm={4}>No-pay Leaves</Form.Label>
                                        <Col sm={8}>
                                            <Form.Control type="decimal" value={employeeDetails.branch_name || ''} readOnly />
                                        </Col>
                                    </Form.Group>

                                    <Form.Group as={Row} className="mb-3" controlId="maternity_leave">
                                        <Form.Label column sm={4}>Maternity Leaves</Form.Label>
                                        <Col sm={8}>
                                            <Form.Control type="decimal" value={employeeDetails.branch_name || ''} readOnly />
                                        </Col>
                                    </Form.Group>
                                </Form>
                            </Card.Body>
                        </Card>
                        <Card className="mx-auto shadow-lg" lg={6} md={8} style={{ width: '85%', margin: '30px' }}>
                            <Card.Header>Change Details</Card.Header>
                            <Card.Body id='card-1' style={{ margin: '30px' }}>
                                <Button variant="primary" size="sm" className="w-100" onClick={() => changepage('true')}>
                                    Edit
                                </Button>
                            </Card.Body>
                        </Card>
                    </div>
                </div>
            )}
        </>
    );
};

export default Profile;