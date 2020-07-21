import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class VipsettingsService {

  constructor(private http:HttpClient) { }

  /**
   * API call for Listing Vip Categories
   * @param postData
   * @return
   */
  getVipSettingData(limit,start,search,order,orderby)
  {
    return this.http.get<any>(environment.baseUrl + 'admin/vip-setting?limit='+limit+'&start='+start+'&search='+search+'&orderCol='+order+'&orderby='+orderby+'&filter={%22filter_by%22:%22all%22}',{observe:'response'});
  }

   /**
   * API call for Add Vip Setting
   * @param postData
   * @return
   */
  onAddVipSetting(postData)
  {
    return this.http.post(environment.baseUrl + 'admin/vip-setting',postData,{observe:'response'});
  }


   /**
   * API call for update Vip Setting
   * @param postData
   * @return
   */
  onUpdateVipSetting(postData,id)
  {
    return this.http.post(environment.baseUrl + 'admin/vip-setting/'+id,postData,{observe:'response'});
  }


   /**
   * API call for update Vip Setting Status
   * @param postData
   * @return
   */
  updateVipSettingStatus(postData,id)
  {
    return this.http.put(environment.baseUrl + 'admin/vip-setting/mulitiaction/'+id,postData,{observe:'response'});
  }
}
