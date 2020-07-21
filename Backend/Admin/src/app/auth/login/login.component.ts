import { ChangeDetectionStrategy, ChangeDetectorRef, Component, Inject } from '@angular/core';
import { NbLoginComponent, NbAuthSocialLink, NB_AUTH_OPTIONS, getDeepFromObject, NbAuthService, NbTokenService } from '@nebular/auth';
import { Router, NavigationStart } from '@angular/router';
import { HttpClient, HttpHeaders, HttpErrorResponse } from '@angular/common/http';
import { NbAuthResult } from '../../../../node_modules/@nebular/auth/services/auth-result';

@Component({
  selector: 'ngx-login',
  templateUrl: './login.component.html',
  styleUrls: ['../auth.component.scss']
})
//export class NgxLoginComponent extends NbLoginComponent {
export class NgxLoginComponent {

  redirectDelay: number = 0;
  showMessages: any = {};
  strategy: string = '';
  
  errors: string[] = [];
  messages: string[] = [];
  user: any = {};
  submitted: boolean = false;
  socialLinks: NbAuthSocialLink[] = [];
  rememberMe = false;
  public token: any;
  constructor(protected service: NbAuthService,
    @Inject(NB_AUTH_OPTIONS) protected options = {},
    protected cd: ChangeDetectorRef,
    protected tokenService: NbTokenService,
    protected router: Router) {
    this.redirectDelay = this.getConfigValue('forms.login.redirectDelay');
    this.showMessages = this.getConfigValue('forms.login.showMessages');
    this.strategy = this.getConfigValue('forms.login.strategy');
    this.socialLinks = this.getConfigValue('forms.login.socialLinks');
    this.rememberMe = this.getConfigValue('forms.login.rememberMe');
  }

  /**
   * Function -- login
   * Use -- This function will be called when user press login button
   */
  login(): void {
    this.errors = [];
    this.messages = [];
    this.submitted = true;

    this.service.authenticate(this.strategy, this.user).subscribe((result: NbAuthResult) => {
      this.submitted = false;
      if (result.isSuccess()) {
        this.messages = result.getMessages();
        sessionStorage.setItem('auth_app_token', JSON.stringify(result.getToken()));
        sessionStorage.setItem('user_details', JSON.stringify(result.getResponse().body.data));
      } else {
        this.errors = result.getErrors();
      }

      const redirect = result.getRedirect();      
      if (redirect) {
        setTimeout(() => {
          return this.router.navigateByUrl(redirect);
        }, this.redirectDelay);
      }
      this.cd.detectChanges();
    });
  }

  getConfigValue(key: string): any {
    return getDeepFromObject(this.options, key, null);
  }
}
