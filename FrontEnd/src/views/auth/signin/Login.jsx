import React from 'react';
import { Card, Button, Alert } from 'react-bootstrap';
import { NavLink, Link ,useNavigate} from 'react-router-dom';
//import useAuth from './auth/TokenAuth';

import Breadcrumb from '../../../layouts/AdminLayout/Breadcrumb';

import AuthLogin from './JWTLogin';



const Signin1 = () => {
  const navigate = useNavigate(); // Initialize navigate
  const recoverypassword = () => {
    console.log("Viewed");
    navigate('/reset-password'); // Programmatically navigate to another page
  };
  //useAuth();

  return (
    <React.Fragment>
      <Breadcrumb />
      <div className="auth-wrapper">
        <div className="auth-content">
          <div className="auth-bg">
            <span className="r" />
            <span className="r s" />
            <span className="r s" />
            <span className="r" />
          </div>
          <Card className="borderless text-center">
            <Card.Body>
              <div className="mb-4">
                <i className="feather icon-unlock auth-icon" />
              </div>
              <AuthLogin />
              <p className="mb-2 text-muted">
                Forgot password?{' '}
                <span onClick={recoverypassword} className="f-w-400" style={{ cursor: 'pointer', textDecoration: 'underline' }}>
                  Reset
                </span>
              </p>
            </Card.Body>
          </Card>
        </div>
      </div>
    </React.Fragment>
  );
};

export default Signin1;