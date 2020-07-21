/**
 * @license
 * Copyright Akveo. All Rights Reserved.
 * Licensed under the MIT License. See License.txt in the project root for license information.
 */
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { NgModule } from '@angular/core';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { CoreModule } from './@core/core.module';
import { ThemeModule } from './@theme/theme.module';
import { AppComponent } from './app.component';
import { AppRoutingModule } from './app-routing.module';
import {NbChatModule,NbDatepickerModule,NbDialogModule,NbMenuModule,NbSidebarModule,NbToastrModule,NbWindowModule, NbGlobalPhysicalPosition, NbSpinnerModule,
} from '@nebular/theme';
import { NgbModule, NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { NbAuthModule, NbPasswordAuthStrategy } from '@nebular/auth';
import { environment } from '../environments/environment';
import { APP_BASE_HREF } from '@angular/common';
import { TokenInterceptor } from './token.interceptor';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { ModalOverlaysModule } from './pages/modal-overlays/modal-overlays.module';

@NgModule({
  declarations: [AppComponent],
  imports: [
    FormsModule,
    BrowserModule,
    BrowserAnimationsModule,
    HttpClientModule,
    AppRoutingModule,
    ThemeModule.forRoot(),
    NgbModule,
    ModalOverlaysModule,
    ReactiveFormsModule.withConfig({warnOnNgModelWithFormControl: 'never'}),
    NbSidebarModule.forRoot(),
    NbMenuModule.forRoot(),
    NbDatepickerModule.forRoot(),
    NbDialogModule.forRoot(),
    NbWindowModule.forRoot(),
    NbToastrModule.forRoot({
      position: NbGlobalPhysicalPosition.BOTTOM_RIGHT,
      duration:5000
    }),
    NbSpinnerModule,
    NbChatModule.forRoot({
      messageGoogleMapKey: 'AIzaSyA_wNuCzia92MAmdLRzmqitRGvCF7wCZPY',
    }),
    CoreModule.forRoot(),
    NbAuthModule.forRoot({
      strategies: [
        NbPasswordAuthStrategy.setup({
          name: 'email',

          baseEndpoint: environment.baseUrl+'admin/',
           login: {
             // ...
             endpoint: 'login',
           },
           // logout: {
           //   // ...
           //   endpoint: 'logout',
           // },
        }),
      ],
      forms: {},
    }), 
  ],
  bootstrap: [AppComponent],
  providers: [
    NgbActiveModal,
    { provide: APP_BASE_HREF, useValue: '/' },
    { provide: HTTP_INTERCEPTORS, useClass: TokenInterceptor, multi: true }
  ],
})
export class AppModule {
}
