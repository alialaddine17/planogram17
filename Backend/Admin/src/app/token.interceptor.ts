import { Injectable, Injector } from '@angular/core';
import {
  HttpRequest,
  HttpHandler,
  HttpEvent,
  HttpInterceptor,
  HttpResponse,
  HttpErrorResponse,HttpClient
} from '@angular/common/http';
import { Observable } from 'rxjs/Observable';
import { catchError, tap } from "rxjs/operators";
import { ActivatedRoute } from '@angular/router';
import { environment } from '../environments/environment';

@Injectable()
export class TokenInterceptor implements HttpInterceptor {

  ptoken: any;
  baseUrl:any;

  constructor(private injector: Injector) { this.baseUrl = environment.baseUrl }


  intercept(request: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
    if (JSON.parse(sessionStorage.getItem('auth_app_token')) != null) {
      this.ptoken = JSON.parse(sessionStorage.getItem('auth_app_token')).token;
    }

    const id = request.url.substring(request.url.lastIndexOf('/') + 1);
    const finalId = parseInt(id);
    if (finalId != NaN) {
      var requestUrlforCat = environment.baseUrl+"admin/categories/" + finalId;
      var requestUrlforProduct = environment.baseUrl+"admin/products/" + finalId;
      var requestUrlforVipCategory = environment.baseUrl+"admin/vip/" + finalId;
      var requestUrlforAnnouncement = environment.baseUrl+"admin/anouncement/" + finalId;
      var requestUrlforVipSetting = environment.baseUrl+"admin/vip-setting/" + finalId;
    }

    if (request.url == requestUrlforCat || request.url == environment.baseUrl+"admin/categories" || request.url == requestUrlforProduct || request.url == environment.baseUrl+"admin/products" || request.url == requestUrlforVipCategory || request.url == environment.baseUrl+"admin/vip" || request.url == environment.baseUrl+"logosettings" || request.url == requestUrlforAnnouncement || environment.baseUrl+"admin/anouncement" || request.url == requestUrlforVipSetting || environment.baseUrl+"admin/vip-setting") {
      request = request.clone({
        setHeaders: {
          Authorization: `Bearer ${this.ptoken}`,
          //'Content-Type': 'application/json',
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Credentials': 'true',
          'Access-Control-Allow-Headers': 'Content-Type, Authorization, Content-Length, X-Requested-With',
          'Access-Control-Allow-Methods': 'GET, POST, OPTIONS'
        }
      });
    }
    else {
      request = request.clone({
        setHeaders: {
          Authorization: `Bearer ${this.ptoken}`,
          'Content-Type': 'application/json',
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Credentials': 'true',
          'Access-Control-Allow-Headers': 'Content-Type, Authorization, Content-Length, X-Requested-With',
          'Access-Control-Allow-Methods': 'GET, POST, OPTIONS'
        }
      });
    }

    return next.handle(request);
    // return next.handle(request).pipe(
    //   tap(
    //     event => {},
    //     error => {}
    //   )
    // );
  }
}


//   intercept(request: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {

//       request = request.clone({
//         setHeaders: {
//           Authorization: "Bearer" + ptoken,
//           'Content-Type': 'application/json',
//           'Access-Control-Allow-Origin': '*',
//           'Access-Control-Allow-Credentials': 'true',
//           "Access-Control-Allow-Headers": "Content-Type, Authorization, Content-Length, X-Requested-With",
//           "Access-Control-Allow-Methods":"GET, POST, OPTIONS"
//         }
//       });

//       return next.handle(request).pipe(
//       tap(
//         event => {},
//         error => {}
//       )
//     );
//   }
// }
