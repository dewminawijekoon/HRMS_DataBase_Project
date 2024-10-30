import { useState } from 'react';
import React from 'react';
import { Card, ListGroup } from 'react-bootstrap';
import { useNavigate } from 'react-router-dom';
import avatar from '../../../../assets/images/user/avatar-1.jpg'; 
import { ArrowLeftCircle } from 'react-bootstrap-icons'; // Importing an icon for the back button

const NavRight = () => {
  const navigate = useNavigate();

  const seeProfile = () => {
    console.log("See Profile");
    const user_name = localStorage.getItem('user_name');
    console.log(user_name);
    navigate('./myprofile', { state: { employee_id: user_name } });
  };

  const goBack = () => {
    navigate(-1); // This will navigate back to the previous page
  };

  return (
    <React.Fragment>
      <ListGroup as="ul" bsPrefix=" " className="navbar-nav ml-auto" id="navbar-right" style={{ display: 'flex', alignItems: 'center', gap: '15px' }}>
        
        {/* Back Button */}
        <ListGroup.Item as="li" bsPrefix=" ">
          <a onClick={goBack} role="button" style={{ cursor: 'pointer', display: 'flex', alignItems: 'center' }}>
            <ArrowLeftCircle size={30} className="text-dark" /> {/* Back Icon */}
          </a>
        </ListGroup.Item>

        {/* Profile Logo Button */}
        <ListGroup.Item as="li" bsPrefix=" ">
          <a onClick={seeProfile} role="button" style={{ cursor: 'pointer', display: 'flex', alignItems: 'center' }}>
            <img src={avatar} className="img-radius" alt="User Profile" style={{ width: '60px', height: '60px', borderRadius: '50%' }} /> {/* Adjusted avatar size */}
          </a>
        </ListGroup.Item>

      </ListGroup>
    </React.Fragment>
  );
};

export default NavRight;
