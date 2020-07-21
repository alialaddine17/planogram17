import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from '../../../environments/environment';
import { access } from 'fs';

@Injectable({
  providedIn: 'root'
})
export class SettingService {
  //postData:any = [];
  constructor(private http:HttpClient) { }

   /**
   * API call for get Setting Data
   */
  getSettingData() {
    return this.http.get<any>(environment.baseUrl + 'settings?type=0');
  }

  setSettingData(jsonData){
    var myData = {settingData: jsonData}
    return this.http.post<any>(environment.baseUrl + 'settings', myData).pipe();
  }
}
