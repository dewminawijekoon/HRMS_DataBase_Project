const menuItems = {
  items: [
    {
      id: 'navigation',
      title: ' ',
      type: 'group',
      icon: 'icon-navigation',
      children: [
        {
          id: 'dashboard',
          title: 'Dashboard',
          type: 'item',
          icon: 'feather icon-home',
          url: '/supervisor/dashboard/'
        },
        {
          id: 'employees',
          title: 'Employees',
          type: 'item',
          icon: 'feather icon-users',
          url: '/supervisor/employees'
        },
        {
          id: 'leave-applications',
          title: 'Leave Applications',
          type: 'item',
          icon: 'feather icon-book',
          url: '/supervisor/leave-applications'
        },
        {
          id: 'leave-form',
          title: 'Leave Form',
          type: 'item',
          icon: 'feather icon-book',
          url: '/supervisor/leave-form'
        },
        {
          id: 'reports',
          title: 'Reports',
          type: 'item',
          icon: 'feather icon-file-text',
          url: '/supervisor/reports' 
        },
        {
          id: 'log-out',
          title: 'Log Out',
          type: 'item',
          icon: 'feather icon-power',
          url: '/signin-1'
        },
      ]
    },
    
  ],
};

export default menuItems;