import { Component, OnDestroy, OnInit } from '@angular/core';
import { NbMediaBreakpointsService, NbMenuService, NbSidebarService, NbThemeService, NbToastrService } from '@nebular/theme';

import { UserData } from '../../../@core/data/users';
import { LayoutService, AnalyticsService } from '../../../@core/utils';
import { map, takeUntil } from 'rxjs/operators';
import { Subject } from 'rxjs';
import { UserService } from '../../../@core/mock/users.service';
import { NbAuthService, NbTokenService } from '@nebular/auth';
import { Router } from '@angular/router';
import { DashboardService } from '../../../pages/dashboard/dashboard.service';

@Component({
  selector: 'ngx-header',
  styleUrls: ['./header.component.scss'],
  templateUrl: './header.component.html',
})
export class HeaderComponent implements OnInit {

  user: any;
  userDetails: any = [];
  userMenu = [{ title: 'Login', link: '/auth/login' }];
  tag = 'my-context-menu';
  utoken: any = {};
  mySettingFormData: any = [];
  redirectDelay = 5;
  generalInfo: any = [];
  siteLogo: any;
  userDetailsId: any = [];

  constructor(private sidebarService: NbSidebarService,
    private menuService: NbMenuService,
    private userService: UserService,
    private analyticsService: AnalyticsService,
    private layoutService: LayoutService,
    private authService: NbAuthService,
    protected tokenService: NbTokenService,
    protected router: Router,
    public dashboardservice: DashboardService) {

    this.userDetails = JSON.parse(sessionStorage.getItem('user_details'));
    this.utoken = sessionStorage.getItem('auth_app_token');

    if (this.utoken == null) {
      this.router.navigateByUrl('auth/login');
      this.userMenu = [{ title: 'Login', link: '/auth/login' }];
    }
    else {
      this.menuService.navigateHome();
      this.userMenu = [{ title: 'Edit Profile', link: '/pages/editprofile'},{ title: 'Change Password', link: '/pages/change_password' }, { title: 'Log out', link: '/auth/logout' }];
    }
  }

  ngOnInit() {
    this.userService.getUsers()
      .subscribe((users: any) => this.user = this.userDetails);
  }


  /**
   * Function -- toggleSidebar()
   * USe -- It will show/hide sidebar
   */
  toggleSidebar(): boolean {
    this.sidebarService.toggle(true, 'menu-sidebar');
    this.layoutService.changeLayoutSize();

    return false;
  }

  navigateHome() {
    this.menuService.navigateHome();
    return false;
  }
}
