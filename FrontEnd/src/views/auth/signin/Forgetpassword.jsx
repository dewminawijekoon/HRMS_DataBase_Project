import React, { useState } from 'react';
import { Row, Col, Card, Button, Form } from 'react-bootstrap';

const ForgetPassword = () => {
  const [user_name, setUserName] = useState(''); // Start as empty
  const [sentOTP, setSentOTP] = useState(''); // This will store the sent OTP
  const [enteredOTP, setEnteredOTP] = useState(''); // Store the user-entered OTP
  const [new_password, setNewPassword] = useState(''); // Start as empty
  const [OTPdone, setOTPdone] = useState(false); // Use a boolean for state

  const Send_OTP_to_Mail = (username) => {
    console.log("Sending OTP to:", username);
    // Logic to generate and send the OTP goes here
    const otp = '123456'; // Replace with actual OTP generation logic
    setSentOTP(otp); // Save the sent OTP
    alert('OTP sent!'); // Notify user
  };

  const Verify_OTP = () => {
    if (enteredOTP === sentOTP) {
      setOTPdone(true);
      alert('OTP verified! You can now reset your password.');
    } else {
      alert('Invalid OTP. Please try again.');
    }
  };

  const Update_new_password = (newPassword) => {
    console.log("Updating new password to:", newPassword);
    // Logic to update the new password goes here
  };

  return (
    <React.Fragment>
      <div className="auth-wrapper d-flex justify-content-center align-items-center" style={{ minHeight: '100vh' }}>
        <div className="auth-content">
          <div className="auth-bg">
            <span className="r" />
            <span className="r s" />
            <span className="r s" />
            <span className="r" />
          </div>
          <Card className='d-flex justify-content-center align-items-center min-vh-50' style={{ marginTop: '125px' }}>
            <Card.Header>Reset Password</Card.Header>
            <Card.Body>
              <Form onSubmit={(e) => { e.preventDefault(); Send_OTP_to_Mail(user_name); }}>
                <Form.Group as={Row} className="mb-3" controlId="username">
                  <Form.Label column sm={4}>User-name</Form.Label>
                  <Col sm={8}>
                    <Form.Control
                      type="text"
                      label="Username"
                      name="username"
                      value={user_name}
                      onChange={(e) => setUserName(e.target.value)}
                    />
                  </Col>
                </Form.Group>
                <div style={{ width: '150px', marginLeft: '85px', marginBottom: '12px' }}>
                  <Button variant="primary" size="sm" className="w-100" type="submit">
                    Submit
                  </Button>
                </div>
                
                {OTPdone ? (
                  <div>
                    <Form.Group as={Row} className="mb-3" controlId="newpassword">
                      <Form.Label column sm={4}>New Password</Form.Label>
                      <Col sm={8}>
                        <Form.Control
                          type="password" // Change to password input
                          label="New Password"
                          name="newpassword"
                          value={new_password}
                          onChange={(e) => setNewPassword(e.target.value)}
                        />
                      </Col>
                    </Form.Group>
                    <Button 
                      variant="primary" 
                      size="sm" 
                      className="w-100" 
                      onClick={() => Update_new_password(new_password)}
                    >
                      Save Changes
                    </Button>
                  </div>
                ) : (
                  <Form.Group as={Row} className="mb-3" controlId="otp">
                    <Form.Label column sm={4}>Enter OTP</Form.Label>
                    <Col sm={8}>
                      <Form.Control
                        type="text"
                        label="Enter OTP"
                        name="otp"
                        value={enteredOTP}
                        onChange={(e) => setEnteredOTP(e.target.value)}
                      />
                    </Col>
                  </Form.Group>
                )}

                {!OTPdone && (
                  <Button 
                    variant="primary" 
                    size="sm" 
                    className="w-100" 
                    onClick={Verify_OTP} // Call the OTP verification function
                  >
                    Verify OTP
                  </Button>
                )}
              </Form>
            </Card.Body>
          </Card>
        </div>
      </div>
    </React.Fragment>
  );
};

export default ForgetPassword;
