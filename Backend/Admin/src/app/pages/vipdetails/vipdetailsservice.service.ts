import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class VipdetailsserviceService {

  constructor(private http:HttpClient) { }

  /**
   * API call for Listing Vip Details
   * @param postData
   * @return
   */
  getVipDetailsData(limit,start,search,order,orderby,vipId)
  {
    return this.http.get<any>(environment.baseUrl + 'admin/vip?limit='+limit+'&start='+start+'&search='+search+'&orderCol='+order+'&orderby='+orderby+'&filter={%22filter_by%22:%22all%22}&vipId='+vipId,{observe:'response'});
  }

  /**
   * Function -- vipCategoryDropdown()
   * Use -- To get vip category
   *
   */
  vipCategoryDropdown()
  {
    return this.http.get(environment.baseUrl + 'admin/vip/categories',{observe:'response'});
  }

}
