import { Component, OnInit } from '@angular/core';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Router } from '@angular/router';
import { SettingService } from './setting.service';
import { NbToastrService } from '@nebular/theme';


@Component({
  selector: 'ngx-setting',
  templateUrl: './setting.component.html',
  styleUrls: ['./setting.component.scss']
})
export class SettingComponent implements OnInit {
  mySettingFormData:any = [];
  generalinfo:any = [];
  redirectDelay=5;
  constructor(private http:HttpClient,
              private router:Router,
              private settingService:SettingService,
              private toastr: NbToastrService) { }

  ngOnInit() {
    this.settingService.getSettingData().subscribe(myFormData => {
      this.mySettingFormData = myFormData.data;
      let tabObject = { isModified: false };
      for(var i = 0 ; i <= 2; i++){
        this.generalinfo.push(this.mySettingFormData[i]);
      }
    },
    (err:HttpErrorResponse) => {
      if(err.status == 401)
      {
        setTimeout(() => {
          this.toastr.danger('Permission Denied. You are not authorize to perform this action.');
          return this.router.navigateByUrl('/pages/setting');
        }, this.redirectDelay);
        
      }
      else{
      this.toastr.danger(err.message);
      }
    })
    
  }

  onSaveSettingForm(data){
    this.settingService.setSettingData(data).subscribe((res:any)=> {
      if(res){
        this.toastr.success(res.message,"Success");
        this.router.navigateByUrl('/pages/setting')
      }
      else{
        this.toastr.danger(res.message,"Error");
        this.router.navigateByUrl('/pages/setting')
      }
    },
    (err:HttpErrorResponse) => {
      if(err.status == 401)
      {
        setTimeout(() => {
          this.toastr.danger('Permission Denied. You are not authorize to perform this action.');
          return this.router.navigateByUrl('/pages/setting');
        }, this.redirectDelay);
        
      }
      else{
      this.toastr.danger(err.message);
      }
    })
  }

  loading = false;

  toggleLoadingAnimation() {
    this.loading = true;
    setTimeout(() => this.loading = false, 2000)
  }

}
