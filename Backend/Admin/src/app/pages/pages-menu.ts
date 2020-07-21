import { NbMenuItem } from '@nebular/theme';

export const MENU_ITEMS: NbMenuItem[] = [
  {
    title: 'Dashboard',
    icon: 'home-outline',
    link: '/pages/dashboard',
    //home: true,
  },
  {
    title: 'Categories',
    icon: 'grid-outline',
    link: '/pages/categories',
  },
  {
    title: 'Sub Categories',
    icon: 'keypad-outline',
    link: '/pages/sub-categories',
  },
  {
    title: 'Products',
    icon: 'shopping-bag-outline',
    link: '/pages/products',
  },
  {
    title: 'Announcement',
    icon: 'volume-up-outline',
    link: '/pages/announcement',
  },
  {
    title: 'VIP',
    icon: 'person-add-outline',
    children: [
      {
        title: 'VIP Category',
        link: '/pages/vipcategory',
      },
      {
        title: 'VIP Details',
        link: '/pages/vipdetails',
      },
      {
        title: 'VIP Settings',
        link: '/pages/vipsettings',
      }
    ],
  },
  {
    title: 'Settings',
    icon: 'settings-2-outline',
    link: '/pages/setting',
  },
];
