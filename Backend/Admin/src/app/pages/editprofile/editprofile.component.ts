import { Component, OnInit } from '@angular/core';
import { EditprofileService } from './editprofile.service';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { NbToastrService } from '@nebular/theme';
import { Router } from '@angular/router';
import { HttpErrorResponse } from '@angular/common/http';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'ngx-editprofile',
  templateUrl: './editprofile.component.html'
})
export class EditprofileComponent implements OnInit {

  userProfileData: any = {};
  userProfileEditForm: FormGroup;
  redirectDelay = 5;
  user_data:any;
  user_id:any;

  constructor(private editProfileService: EditprofileService,
              private fb: FormBuilder,
              private router: Router,
              public activeModal: NgbActiveModal,
              private toastr: NbToastrService) { }

  ngOnInit() {
    this.user_data = JSON.parse(sessionStorage.getItem('user_details'));
    this.user_id = this.user_data['id'];
    
    this.editProfileService.getUserProfileData(this.user_id).subscribe((res:any) => {
      this.userProfileData = res.data;
    })

    //Initiate USer Edit form
    this.userProfileEditForm = this.fb.group({
      first_name: ['', Validators.required],
      last_name: ['', Validators.required],
      contact_number: ['', Validators.required],
    });
  }

   /**
   * Function -- onUpdateUserProfile()
   * Use -- This function is called when user updates some value
   * @param userProfileEditForm 
   */
  onUpdateUserProfile(userProfileEditForm) {

    let postData = {
      first_name:userProfileEditForm.first_name,
      last_name:userProfileEditForm.last_name,
      contact_number:userProfileEditForm.contact_number
    }

    this.editProfileService.updateUserProfileData(this.userProfileData.id,postData).subscribe((res: any) => {
          this.toastr.success(res.message,'Success');
          this.router.navigateByUrl('/dashboard')
    },
      (err: HttpErrorResponse) => {
        if (err.status == 401) {
          setTimeout(() => {
            this.toastr.danger(err.error.message,'Error');
            return this.router.navigateByUrl('/pages/editprofile');
          }, this.redirectDelay);
        }
        else {
          this.toastr.danger(err.error.message,'Error');
        }
      });
  }


  /**
   * Function -- onCancelClick
   * Use -- To redirect to dashboard.
   */
  onCancelClick() {
    this.router.navigateByUrl('/dashboard');
  }

}


