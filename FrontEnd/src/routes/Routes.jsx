// src/routes.js
import React, { Suspense, Fragment, lazy } from 'react';
import { Routes, Route } from 'react-router-dom';

import Loader from '../components/Loader/Loader';
import AdminLayout from '../layouts/AdminLayout';
import SupervisorLayout from '../layouts/SupervisorLayout';
import EmployeeLayout from '../layouts/EmployeeLayout';
import PrivateRoute from './PrivateRoute'; // Import PrivateRoute


export const renderRoutes = (routes = []) => (
  <Suspense fallback={<Loader />}>
    <Routes>
      {routes.map((route, i) => {
        const Guard = route.guard || Fragment;
        const Layout = route.layout || Fragment;
        const Element = route.element;

        // Check if it’s a public route
        const isPublicRoute = route.path === '/' || route.path === '/Login' /*|| route.path === '/Dummy'*/ || route.path === '/reset-password';

        return (
          <Route
            key={i}
            path={route.path}
            element={
              <Guard>
                <Layout>
                  {isPublicRoute ? (
                    route.routes ? renderRoutes(route.routes) : <Element />
                  ) : (
                    // Apply PrivateRoute to protected routes with role checks
                    <PrivateRoute allowedRoles={route.allowedRoles}>
                      {route.routes ? renderRoutes(route.routes) : <Element />}
                    </PrivateRoute>
                  )}
                </Layout>
              </Guard>
            }
          />
        );
      })}
    </Routes>
  </Suspense>
);

const routes = [
  {
    path: '/Dummy',
    element: lazy(() => import('../views/Dummy/Dummy'))
  },
  {
    path: '/',
    element: lazy(() => import('../views/auth/signin/Login'))
  },
  {
    path: '/Login',
    element: lazy(() => import('../views/auth/signin/Login'))
  },
  {
    path: '/reset-password',
    element: lazy(() => import('../views/auth/signin/Forgetpassword'))
  },
  {
    path: '/Admin/*',
    layout: AdminLayout,
    protected: true,
    allowedRoles: ['admin'], // Only users with 'admin' role can access
    routes: [
      {
      path: '/Dummy',
    element: lazy(() => import('../views/Dummy/Dummy'))
      },
      {
        exact: 'true',
        path: '',
        element: lazy(() => import('../views/dashboard/Admin'))
      },
      {
        exact: 'true',
        path: '/myprofile',
        element: lazy(() => import('../views/myprofile'))
      },
      {
        exact: 'true',
        path: '/leave-request-form',
        element: lazy(() => import('../Leaves/LeaveApproval'))
      },
      {
        exact: 'true',
        path: '/employees',
        element: lazy(() => import('../views/employees'))
      },{
        exact: 'true',
        path: '/employees/add-employee',
        element: lazy(() => import('../views/employees/AddEmployee'))
      },
      {
        exact: 'true',
        path: '/employees/profile',
        element: lazy(() => import('../views/profile/index'))
      },
      {
        exact: 'true',
        path: '/leave-applications',
        element: lazy(() => import('../views/leaveApplications/LeaveApplicationsTable'))
      },
      {
        exact: 'true',
        path: '/leave-applications/leave-request-form',
        element: lazy(() => import('../Leaves/LeaveApproval'))
      },
      {
        exact: 'true',
        path: '/reports',
        element: lazy(() => import('../views/Reports'))
      },
      {
        exact: 'true',
        path: '/employees/profile',
        element: lazy(() => import('../views/profile/index'))
      },
    ]
  }, 
  {
    path: '/Employee/*',
    layout: EmployeeLayout,
    protected: true,
    allowedRoles: ['employee'],
    routes: [
      {
        path: '',
        element: lazy(() => import('../views/dashboard/Employee'))
      },
      {
        path: 'leave-request-form',
        element: lazy(() => import('../Leaves/LeaveRequestForm'))
      },
      /*
      {
        path: 'log-out',
        element: lazy(() => import('../views/auth/signin/Login'))
      }
      */
    ]
  },

  //Supervisor Dashboard
  {
    path: '/supervisor/*',
    layout: SupervisorLayout,
    protected: true,
    allowedRoles: ['supervisor'],
    routes: [
      {
        exact: 'true',
        path: '',
        element: lazy(() => import('../views/dashboard/Supervisor'))
      },
      {
        exact: 'true',
        path: '/employees',
        element: lazy(() => import('../views/employees/sup_employees'))
      },
      {
        exact: 'true',
        path: '/employees/profile',
        element: lazy(() => import('../views/profile/sup_profile'))
      },
      {
        exact: 'true',
        path: '/leave-form',
        element: lazy(() => import('../Leaves/LeaveRequestForm'))
      },
      {
        exact: true,
        path: '/leave-applications',
        element: lazy(() => import('../views/leaveApplications/sup_leaveapplication'))
      },
      {
        // This directly points to the leave request form under /leave-applications
        exact: true,
        path: '/leave-applications/leave-request-form',
        element: lazy(() => import('../Leaves/LeaveApproval'))
      },
      {
        exact: 'true',
        path: '/reports',
        element: lazy(() => import('../views/Reports'))
      },
      {
        exact: 'true',
        path: '/myprofile',
        element: lazy(() => import('../views/myprofile/sup_profile'))
      }
    ]
  }
];

export default routes;
