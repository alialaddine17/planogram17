import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class CategoriesService {

  constructor(private http:HttpClient) { }

    /**
   * API call for Listing Categories
   * @param postData
   * @return
   */
    getCategoryData(limit,start,search,order,orderby)
    {
      return this.http.get<any>(environment.baseUrl + 'admin/categories?limit='+limit+'&start='+start+'&search='+search+'&orderCol='+order+'&orderby='+orderby+'&filter={%22filter_by%22:%22all%22}',{observe:'response'});
    }


    /**
   * API call for Add Category
   * @param postData
   * @return
   */
  onAddCategory(postData)
  {
    return this.http.post(environment.baseUrl + 'admin/categories',postData,{observe:'response'});
  }


   /**
   * API call for update Category
   * @param postData
   * @return
   */
  onUpdateCategory(postData,id)
  {
    return this.http.post(environment.baseUrl + 'admin/categories/'+id,postData,{observe:'response'});
  }

  /**
   * API call for delete Category
   * @param deleteData
   * @return
   */
  onDeleteCategory(id)
  {
    return this.http.delete(environment.baseUrl + 'admin/categories/'+id,{observe:'response'});
  }

   /**
   * API call for update Category Status
   * @param postData
   * @return
   */
  updateCategoryStatus(postData,id)
  {
    return this.http.put(environment.baseUrl + 'admin/categories/mulitiaction/'+id,postData,{observe:'response'});
  }

}

