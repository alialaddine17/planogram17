import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class SubCategoriesService {

  constructor(private http:HttpClient) { }

    /**
   * API call for Listing SubCategories
   * @param postData
   * @return
   */
    getSubCategoryData(limit,start,search,order,orderby)
    {
      return this.http.get<any>(environment.baseUrl + 'admin/sub-categories?limit='+limit+'&start='+start+'&search='+search+'&orderCol='+order+'&orderby='+orderby+'&filter={%22filter_by%22:%22all%22}',{observe:'response'});
    }


    /**
   * API call for Listing SubCategories Parent Id
   * @param postData
   * @return
   */
  getSubCategoryParentId()
  {
    return this.http.get<any>(environment.baseUrl + 'admin/sub-categories/categoriesdropdown',{observe:'response'});
  }


    /**
   * API call for Add SubCategory
   * @param postData
   * @return
   */
  onAddSubCategory(postData)
  {
    return this.http.post(environment.baseUrl + 'admin/sub-categories',postData,{observe:'response'});
  }


   /**
   * API call for update SubCategory
   * @param postData
   * @return
   */
  onUpdateSubCategory(postData,id)
  {
    return this.http.put(environment.baseUrl + 'admin/sub-categories/'+id,postData,{observe:'response'});
  }

  /**
   * API call for delete SubCategory
   * @param deleteData
   * @return
   */
  onDeleteSubCategory(id)
  {
    return this.http.delete(environment.baseUrl + 'admin/sub-categories/'+id,{observe:'response'});
  }

   /**
   * API call for update SubCategory Status
   * @param postData
   * @return
   */
  updateSubCategoryStatus(postData,id)
  {
    return this.http.put(environment.baseUrl + 'admin/sub-categories/mulitiaction/'+id,postData,{observe:'response'});
  }

}

