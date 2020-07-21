import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from '../../../environments/environment';
import { access } from 'fs';

@Injectable({
  providedIn: 'root'
})
export class ChangePasswordService {

  constructor(private http:HttpClient) { }

  
 /**
   * API call for change password
   * @param postData
   * @return 
   */
  postChangePasswordData(postData){ 
    return this.http.post(environment.baseUrl + 'admin/changepassword', postData);
  }


  forgotPassword(postData){
    return this.http.post(environment.baseUrl + 'admin/forgotPassword',postData);
  }
}

