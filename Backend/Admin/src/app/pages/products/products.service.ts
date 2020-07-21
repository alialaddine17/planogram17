import { Injectable } from '@angular/core';
import { environment } from '../../../environments/environment';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class ProductsService {

  constructor(private http: HttpClient) { }


  /**
     * API call to get all products data
     */
  getProductList(limit, start, search, order, orderby,catId,subCatId) {
    return this.http.get<any>(environment.baseUrl + 'admin/products?limit=' + limit + '&start=' + start + '&search=' + search + '&orderCol=' + order + '&orderby=' + orderby + '&filter={%22filter_by%22:%22all%22}&catId='+catId+'&subCatId='+subCatId, { observe: 'response' });
  }

  /**
 * API call for Add Product
 * @param postData
 * @return
 */
  onAddProduct(postData) {
    return this.http.post(environment.baseUrl + 'admin/products', postData, { observe: 'response' });
  }

  /**
 * API call for update Product
 * @param postData
 * @return
 */
  onUpdateProduct(postData, id) {
    return this.http.post(environment.baseUrl + 'admin/products/' + id, postData, { observe: 'response' });
  }

  /**
   * API call for delete Product
   * @param deleteData
   * @return
   */
  onDeleteProduct(id) {
    return this.http.delete(environment.baseUrl + 'admin/products/' + id, { observe: 'response' });
  }

  /**
  * API call for update Product Status
  * @param postData
  * @return
  */
  updateStatusForProduct(postData, id) {
    return this.http.put(environment.baseUrl + 'admin/products/mulitiaction/' + id, postData, { observe: 'response' });
  }

  /**
   * API call for Listing MainCategories Parent Id
   * @param postData
   * @return
   */
  getMainCategoryParentId()
  {
    return this.http.get<any>(environment.baseUrl + 'admin/sub-categories/categoriesdropdown',{observe:'response'});
  }


  /**
   * API call for Listing MainCategories Parent Id
   * @param postData
   * @return
   */
  getSubCategoryParentId(id)
  {
    return this.http.get<any>(environment.baseUrl + 'admin/products/'+id,{observe:'response'});
  }
}
