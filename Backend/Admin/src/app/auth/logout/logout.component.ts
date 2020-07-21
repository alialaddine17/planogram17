import { Component, Inject, OnInit } from '@angular/core';
import { Router } from '@angular/router';


import { NbAuthResult } from '../../../../node_modules/@nebular/auth/services/auth-result';

import { NbAuthSocialLink, NB_AUTH_OPTIONS, getDeepFromObject, NbAuthService, NbTokenService } from '@nebular/auth';

@Component({
  selector: 'ngx-logout',
  templateUrl: './logout.component.html',
})
//export class NgxLoginComponent extends NbLoginComponent {
  export class NgxLogoutComponent implements OnInit{
  
  redirectDelay: number = 0;
  showMessages: any = {};
  strategy: string = '';

  // errors: string[] = [];
  // messages: string[] = [];
  // user: any = {};
  // submitted: boolean = false;
  socialLinks: NbAuthSocialLink[] = [];
  rememberMe = false;
  // public token :any;
  
  constructor(protected service: NbAuthService,
              @Inject(NB_AUTH_OPTIONS) protected options = {},
              protected router: Router,protected tokenService:NbTokenService) {
   //super(service,'',cd,router); 
   this.redirectDelay = this.getConfigValue('forms.login.redirectDelay');
    this.showMessages = this.getConfigValue('forms.login.showMessages');
    this.strategy = this.getConfigValue('forms.login.strategy');
    this.socialLinks = this.getConfigValue('forms.login.socialLinks');
    this.rememberMe = this.getConfigValue('forms.login.rememberMe');
  }

  ngOnInit(): void {
    //const redirect = this.service.logout(this.strategy);
    this.tokenService.clear();
    this.router.navigateByUrl('login');
    sessionStorage.removeItem('auth_app_token');
    sessionStorage.removeItem('user_details');
    sessionStorage.removeItem('role');
    this.router.navigateByUrl('auth/login');
    //this.logout(this.strategy);
}
 
  getConfigValue(key: string): any {
      return getDeepFromObject(this.options, key, null);
  }
}
