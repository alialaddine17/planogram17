import { Injectable } from '@angular/core';
import { environment } from '../../../environments/environment';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class AnnouncementService {

  constructor(private http: HttpClient) { }


  /**
     * API call to get all Announcements data
     */
  getAnnouncementList(limit, start, search, order, orderby) {
    return this.http.get<any>(environment.baseUrl + 'admin/anouncement?limit=' + limit + '&start=' + start + '&search=' + search + '&orderCol=' + order + '&orderby=' + orderby + '&filter={%22filter_by%22:%22all%22}', { observe: 'response' });
  }

  /**
 * API call for Add Announcement
 * @param postData
 * @return
 */
  onAddAnnouncement(postData) {
    return this.http.post(environment.baseUrl + 'admin/anouncement', postData, { observe: 'response' });
  }

  /**
 * API call for update Announcement
 * @param postData
 * @return
 */
  onUpdateAnnouncement(postData, id) {
    return this.http.post(environment.baseUrl + 'admin/anouncement/' + id, postData, { observe: 'response' });
  }

  /**
   * API call for delete Announcement
   * @param deleteData
   * @return
   */
  onDeleteAnnouncement(id) {
    return this.http.delete(environment.baseUrl + 'admin/anouncement/' + id, { observe: 'response' });
  }

  /**
  * API call for update Announcement Status
  * @param postData
  * @return
  */
  updateStatusForAnnouncement(postData, id) {
    return this.http.put(environment.baseUrl + 'admin/anouncement/mulitiaction/' + id, postData, { observe: 'response' });
  }
}
