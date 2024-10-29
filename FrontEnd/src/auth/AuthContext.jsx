import React, { createContext, useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';

export const AuthContext = createContext();

export const AuthProvider = ({ children }) => {
  const [user, setUser] = useState(null);
  const [token, setToken] = useState(localStorage.getItem('token'));
  const navigate = useNavigate();

  // Update user info when token changes
  useEffect(() => {
    if (token) {
      // Decode or fetch user info if needed
      setUser({ username: "user", role: "admin" });  // Mock user info for illustration
      localStorage.setItem('token', token);
    } else {
      setUser(null);
      localStorage.removeItem('token');
    }
  }, [token]);

  const login = (token) => {
    setToken(token);
    navigate('/dashboard'); // Redirect to dashboard after login
  };

  const logout = () => {
    setToken(null);
    navigate('/login'); // Redirect to login after logout
  };

  return (
    <AuthContext.Provider value={{ user, token, login, logout }}>
      {children}
    </AuthContext.Provider>
  );
};