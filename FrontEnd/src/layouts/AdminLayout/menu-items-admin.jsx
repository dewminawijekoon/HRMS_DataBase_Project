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
          url: '/Admin'
        },
        {
          id: 'employees',
          title: 'Employees',
          type: 'item',
          icon: 'feather icon-users',
          url: '/Admin/employees'
        },
        {
          id: 'leave-applications',
          title: 'Leave Applications',
          type: 'item',
          icon: 'feather icon-book',
          url: '/Admin/leave-applications'
        },
        {
          id: 'reports',
          title: 'Reports',
          type: 'item',
          icon: 'feather icon-file-text',
          url: '/Admin/reports' 
        },
        {
          id: 'log-out',
          title: 'Log Out',
          type: 'item',
          icon: 'feather icon-power',
          url: '/'
        },
      ]
    },
    
  ],
};

export default menuItems;