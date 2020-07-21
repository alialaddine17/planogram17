import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { NbToastrService } from '@nebular/theme';
import { Router } from '@angular/router';
import { VipserviceService } from '../../vipcategory/vipservice.service';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { HttpErrorResponse } from '@angular/common/http';
import { VipdetailsserviceService } from '../vipdetailsservice.service';

@Component({
  selector: 'ngx-addvipdetails',
  templateUrl: './addvipdetails.component.html'
})
export class AddvipdetailsComponent implements OnInit {

  addVipDetailsForm: FormGroup;
  vipDetailsData: any = {};
  redirectDelay = 5;
  ckeConfig: any;
  vipIdValue:any;
  vipIdsData:any = [];

  constructor(public activeModal: NgbActiveModal,
              public fb: FormBuilder,
              public vipService: VipserviceService,
              public router: Router,
              private toastr: NbToastrService,
              public VipDetailsService:VipdetailsserviceService) { }

  ngOnInit() {

     //Api call for subcategory parent id dropdown
     this.VipDetailsService.vipCategoryDropdown().subscribe((res: any) => {
      if(res.status == '200')
      {
        this.vipIdsData = res.body.data.vipCategories;
      }
    });

    //Ck Editor Configuration
    this.ckeConfig = {
      allowedContent: false,
      extraPlugins: 'divarea',
      forcePasteAsPlainText: true,
      removeButtons:'Image,Cut,Copy,Paste,PasteText,PasteFromWord,Source,Undo,Redo,Scayt,SpecialChar,Strike,Subscript,Superscript,RemoveFormat,Anchor,About'
    };

    //Initiate Add VIP Category Form
    this.addVipDetailsForm = this.fb.group({
      vipId:['',Validators.required],
      subTitle_en:['',Validators.required],
      subTitle_ur:['',Validators.required],
      detailTitle_en:[''],
      detailTitle_ur:[''],
      description_en:[''],
      description_ur:[''],
      vipImg:[null],
    });
  }

  //Validation for Required fields.
  get vipId() { return this.addVipDetailsForm.get('vipId'); }
  get subTitle_en() { return this.addVipDetailsForm.get('subTitle_en'); }
  get subTitle_ur() { return this.addVipDetailsForm.get('subTitle_ur'); }
  get detailTitle_en() { return this.addVipDetailsForm.get('detailTitle_en'); }
  get detailTitle_ur() { return this.addVipDetailsForm.get('detailTitle_ur'); }
  get description_en() { return this.addVipDetailsForm.get('description_en'); }
  get description_ur() { return this.addVipDetailsForm.get('description_ur'); }

  /**
   * Function -- uploadFile
   * Use -- This function is used to upload images.
   * @param event
   */
  uploadFile(event) {
    const file = (event.target as HTMLInputElement).files[0];
    this.addVipDetailsForm.patchValue({
      vipImg: file
    });
    this.addVipDetailsForm.get('vipImg').updateValueAndValidity();
  }

  selectionChangedForVipCategory(event)
  {
      this.vipIdValue = event.target.value;
  }

  /**
   * Function -- onAddVipCategory
   * Use -- This function will triggered when user submit the form.
   */
  onAddVipDetails() {

    if(this.addVipDetailsForm.get('vipImg').value == null)
    {
      this.toastr.warning('Please Upload VIP Image','Warning');
      return;
    }

    let formData: FormData = new FormData();
    formData.append("vipId", this.vipIdValue);
    formData.append("subTitle_en", this.addVipDetailsForm.get('subTitle_en').value);
    formData.append("subTitle_ur", this.addVipDetailsForm.get('subTitle_ur').value);
    formData.append("detailTitle_en", this.addVipDetailsForm.get('detailTitle_en').value);
    formData.append("detailTitle_ur", this.addVipDetailsForm.get('detailTitle_ur').value);
    formData.append("vipImg", this.addVipDetailsForm.get('vipImg').value);
    formData.append("description_en", this.addVipDetailsForm.get('description_en').value);
    formData.append("description_ur", this.addVipDetailsForm.get('description_ur').value);
    this.vipService.onAddVipCategory(formData).subscribe((res: any) => {
        if(res.status == '200')
        {
          this.vipDetailsData.message = res.body.message;
          this.activeModal.close(this.vipDetailsData);
        }
    },
      (err: HttpErrorResponse) => {
        if (err.status == 401) {
          setTimeout(() => {
            this.activeModal.close();
            this.toastr.danger(err.error.message,'Error');
            return this.router.navigateByUrl('/pages/vipcategory');
          }, this.redirectDelay);
        }
        else {
          this.activeModal.close();
          this.toastr.danger(err.error.message,'Error');
        }
      });
  }

  /**
   * Function -- onCloseModel
   * Use -- To close modal popup.
   */
  onCloseModel() {
    this.activeModal.dismiss();
  }


}
