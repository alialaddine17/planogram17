import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from '../../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class EditprofileService {

  constructor(private http: HttpClient) { }


  /**
   * Fnction -- getUserProfileData
   * Use -- Get the data of UserProfile
   */
  getUserProfileData(id) {
    return this.http.get<any>(environment.baseUrl + 'admin/profile/'+id);
  }

  /**
   * Function -- updateUserProfileData
   * Use -- update the profile of user
   * @param jsonData 
   */
  updateUserProfileData(id,postData) {
    return this.http.put<any>(environment.baseUrl + 'admin/profile/'+id,postData);
  }
}
