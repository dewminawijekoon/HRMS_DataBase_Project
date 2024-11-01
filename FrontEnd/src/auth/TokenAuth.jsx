import { useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
//import * as jwt_decode from 'jwt-decode'; // Use named import
import {jwtDecode} from 'jwt-decode';

const isTokenExpired = (token) => {
  if (!token) return true; // No token means it is expired

  try {
    const decoded = jwtDecode(token);
    const currentTime = Date.now() / 1000; // Current time in seconds
    return decoded.exp < currentTime; // Check if token is expired
  } catch (error) {
    console.error('Token decoding error:', error);
    return true; // Treat errors as expired tokens
  }
};

// Custom hook for authentication
const useTokenAuth = () => {
  const navigate = useNavigate();
  const token = localStorage.getItem('token');

  useEffect(() => {
    const checkTokenExpiration = async () => {
      if (isTokenExpired(token)) {
        console.log('Token is expired, redirecting to login...');
        localStorage.removeItem('token'); // Optional: Clear the token from local storage
        localStorage.removeItem('username'); 
        localStorage.removeItem('role'); 
        navigate('/login'); // Redirect to login page
      }
    };

    checkTokenExpiration(); // Call the async function
  }, [token, navigate]);
};

export default useTokenAuth;