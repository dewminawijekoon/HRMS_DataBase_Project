import React from 'react';
import { BrowserRouter } from 'react-router-dom';
import routes, { renderRoutes } from './routes/Routes';
//import useAuth from './auth/TokenAuth'; // Ensure this imports correctly

const App = () => {
  //useAuth(); // Call the custom hook to check authentication on app load

  return (
    <BrowserRouter basename={import.meta.env.VITE_APP_BASE_NAME}>
      {renderRoutes(routes)}
    </BrowserRouter>
    
  );
};

export default App;