import React from 'react';
import { Row, Col, Alert, Button } from 'react-bootstrap';
import { Formik } from 'formik';
import { useNavigate } from 'react-router-dom';

const JWTLogin = () => {
  const navigate = useNavigate();

  // Function to handle login
  const handleLogin = async (values, { setSubmitting, setErrors }) => {
    try {
      // Send POST request to FastAPI backend
      const response = await fetch('http://localhost:8000/login', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          username: values.email, // Backend expects 'username'
          password: values.password,
          role:values.role
        }),
      });

      // Parse the response
      const data = await response.json();
      // Handle error if login fails
      if (!response.ok) {
        throw new Error(data.detail || 'Invalid Username or Password');
      }

      // Store the username, token and role in localStorage on successful login
      localStorage.setItem('token', data.token); 
      localStorage.setItem('role', data.role); 
      localStorage.setItem('username', data.username); 
      // Redirect user to the dashboard after login

      
      if(data.role == 'admin'){
        console.log('this is an admin')
        navigate('/Admin', { replace: true });
      }
      else if(data.role == 'supervisor'){
        navigate('/Supervisor',{replace: true});
      }
      else if(data.role == 'employee'){
        navigate('/Employee',{replace: true});
      }
      

      

    } catch (error) {
      setErrors({ submit: error.message }); // Show error to the user
    } finally {
      setSubmitting(false);
    }
  };

  return (
    <Formik
      initialValues={{
        email: 'Username', // Replace with empty string if needed
        password: 'Password', 
        submit: true,
      }}
      onSubmit={handleLogin} // Call handleLogin on form submission
    >
      {({ errors, handleBlur, handleChange, handleSubmit, isSubmitting, touched, values }) => (
        <form noValidate onSubmit={handleSubmit}>
          <div className="form-group mb-3">
            <input
              className="form-control"
              label="Username"
              name="email"
              onBlur={handleBlur}
              onChange={handleChange}
              value={values.email}
            />
            {touched.email && errors.email && <small className="text-danger form-text">{errors.email}</small>}
          </div>
          <div className="form-group mb-4">
            <input
              className="form-control"
              label="Password"
              name="password"
              onBlur={handleBlur}
              onChange={handleChange}
              type="password"
              value={values.password}
            />
            {touched.password && errors.password && <small className="text-danger form-text">{errors.password}</small>}
          </div>

          {errors.submit && (
            <Col sm={12}>
              <Alert variant="danger">{errors.submit}</Alert>
            </Col>
          )}

          <Row>
            <Col mt={2}>
              <Button
                className="btn-block mb-4"
                color="primary"
                disabled={isSubmitting}
                size="large"
                type="submit"
                variant="primary"
              >
                Signin
              </Button>
            </Col>
          </Row>
        </form>
      )}
    </Formik>
  );
};

export default JWTLogin;