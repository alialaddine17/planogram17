import { Component, OnInit } from '@angular/core';
import { HttpClient,HttpErrorResponse } from '@angular/common/http';
import { Router } from '@angular/router';
import { ChangePasswordService } from './change-password.service';
import { NbToastrService } from '@nebular/theme';

@Component({
  selector: 'ngx-change-password',
  templateUrl: './change-password.component.html',
  styleUrls: ['./change-password.component.scss']
})
export class ChangePasswordComponent implements OnInit {

  user: any;
  userDetails:any =[];
  result:any = {};
  error:any;
  constructor(private http:HttpClient,
    private router:Router,
    private changePasswordService:ChangePasswordService,
    private toastr:NbToastrService) { }

  ngOnInit() {

  	this.userDetails = JSON.parse(sessionStorage.getItem('user_details'));
  	// initialize model here
        this.user = {
            old_password:'',
            password: '',
            confirmPassword: ''
        }

  }


  onSaveForm(formData)
  {
  	formData.value.email = this.userDetails.email;
    this.changePasswordService.postChangePasswordData(formData.value).subscribe((res:any)=> {
      if(res.status == 1){
        this.toastr.success(res.message,'Success');
         setTimeout(() => {
          return  this.router.navigateByUrl('pages/dashboard');
        }, 5000); 
      }
    },
    (error:HttpErrorResponse) => { 
        this.toastr.danger(error.error.message,'Error');
    });

  
  }



}
