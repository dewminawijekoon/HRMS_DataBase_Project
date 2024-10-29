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
          url: '/Employee/'
        },
        {
          id: 'request_a_leave',
          title: 'Request a Leave',
          type: 'item',
          icon: 'feather icon-book',
          url: '/Employee/leave-request-form'
        },
        /*
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
        */
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
