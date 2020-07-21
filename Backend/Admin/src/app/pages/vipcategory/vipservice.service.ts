import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class VipserviceService {

  constructor(private http:HttpClient) { }


  /**
   * API call for Listing Vip Categories
   * @param postData
   * @return
   */
  getVipCategoryData(limit,start,search,order,orderby)
  {
    return this.http.get<any>(environment.baseUrl + 'admin/vipMain?limit='+limit+'&start='+start+'&search='+search+'&orderCol='+order+'&orderby='+orderby+'&filter={%22filter_by%22:%22all%22}',{observe:'response'});
  }

   /**
   * API call for Add Vip Category
   * @param postData
   * @return
   */
  onAddVipCategory(postData)
  {
    return this.http.post(environment.baseUrl + 'admin/vip',postData,{observe:'response'});
  }


   /**
   * API call for update Vip Category
   * @param postData
   * @return
   */
  onUpdateVipCategory(postData,id)
  {
    return this.http.post(environment.baseUrl + 'admin/vip/'+id,postData,{observe:'response'});
  }

  /**
   * API call for delete Vip Category
   * @param deleteData
   * @return
   */
  onDeleteVipCategory(id,moduleName)
  {
    return this.http.delete(environment.baseUrl + 'admin/vip?id='+id+'&module='+moduleName,{observe:'response'});
  }

   /**
   * API call for update Vip Category Status
   * @param postData
   * @return
   */
  updateVipCategoryStatus(postData,id,moduleName)
  {
    return this.http.put(environment.baseUrl + 'admin/vip/mulitiaction?id='+id+'&module='+moduleName,postData,{observe:'response'});
  }
}
