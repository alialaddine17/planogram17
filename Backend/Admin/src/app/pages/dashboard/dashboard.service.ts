import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class DashboardService {
  constructor(private http:HttpClient) { }

  getstatasticsData()
  {
    return this.http.get<any>(environment.baseUrl + 'admin/statistics',{observe:'response'});
  }
}
