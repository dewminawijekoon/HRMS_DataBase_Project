import React from 'react';
import { Navigate } from 'react-router-dom';
import useTokenAuth from '../auth/TokenAuth.jsx';
// Function to get user authentication status and role
const getUserStatus = () => {
  const token = localStorage.getItem('token');
  const role = localStorage.getItem('role');
  return { isAuthenticated: !!token, role }; // Returns an object with authentication status and role
};

const PrivateRoute = ({ children, allowedRoles }) => {
  useTokenAuth(); // This will check token expiration on every render

  const { isAuthenticated, role } = getUserStatus();

  if (!isAuthenticated) {
    return <Navigate to="/Login" />; // Redirect to login if not authenticated
  }

  if (allowedRoles && !allowedRoles.includes(role)) {
    return <Navigate to="/" />; // Redirect if the user doesn't have permission
  }

  return children; // Render children if authenticated and authorized
};

export default PrivateRoute;
