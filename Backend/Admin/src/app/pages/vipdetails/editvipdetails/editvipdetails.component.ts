import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { VipserviceService } from '../../vipcategory/vipservice.service';
import { NbToastrService } from '@nebular/theme';
import { Router } from '@angular/router';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { HttpErrorResponse } from '@angular/common/http';
import { VipdetailsserviceService } from '../vipdetailsservice.service';

@Component({
  selector: 'ngx-editvipdetails',
  templateUrl: './editvipdetails.component.html'
})
export class EditvipdetailsComponent implements OnInit {

  editVipDetailsForm: FormGroup;
  vipDetailsData: any = {};
  redirectDelay = 5;
  ckeConfig: any;
  changeVipImg:boolean = false;
  oldVipImg:any;
  vipIdValue:any;
  vipIdsData:any = [];
  onChangeVipId: boolean = false;

  constructor(public activeModal: NgbActiveModal,
    public router: Router,
    private toastr: NbToastrService,
    private fb: FormBuilder,
    public vipService: VipserviceService,
    public VipDetailsService:VipdetailsserviceService) { }

  ngOnInit() {

    //Api call for subcategory parent id dropdown
    this.VipDetailsService.vipCategoryDropdown().subscribe((res: any) => {
      if(res.status == '200')
      {
        this.vipIdsData = res.body.data.vipCategories;
      }
    });

    this.oldVipImg = this.vipDetailsData.vipImg.substring(this.vipDetailsData.vipImg.lastIndexOf('/') + 1);

    //Ck Editor Configuration
    this.ckeConfig = {
      allowedContent: false,
      extraPlugins: 'divarea',
      forcePasteAsPlainText: true,
      removeButtons:'Image,Cut,Copy,Paste,PasteText,PasteFromWord,Source,Undo,Redo,Scayt,SpecialChar,Strike,Subscript,Superscript,RemoveFormat,Anchor,About'
    };

    //Initiate Add Categories Form
    this.editVipDetailsForm = this.fb.group({
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

  selectionChangedForVipCategory(event)
  {
      this.onChangeVipId = true;
      this.vipIdValue = event.target.value;
  }


  /**
   * Function -- uploadFileForProductImage
   * Use -- This function is used to upload images.
   * @param event
   */
  uploadFileForVipImage(event) {
    if(event.type == 'change')
    {
      this.changeVipImg = true;
    }
    else
    {
      this.changeVipImg = false;
    }
    const file = (event.target as HTMLInputElement).files[0];
    this.editVipDetailsForm.patchValue({
      vipImg: file
    });
    this.editVipDetailsForm.get('vipImg').updateValueAndValidity();
  }

  /**
   * Function -- onEditVipCategory
   * Use -- This function will trigger when user update any data.
   */
  onEditVipDetails() {
    let formData: FormData = new FormData();
    if(this.onChangeVipId == true)
    {
      formData.append("vipId", this.vipIdValue);
    }
    else
    {
      formData.append("vipId", this.vipDetailsData.vipId);
    }
    formData.append("subTitle_en", this.editVipDetailsForm.get('subTitle_en').value);
    formData.append("subTitle_ur", this.editVipDetailsForm.get('subTitle_ur').value);
    formData.append("detailTitle_en", this.editVipDetailsForm.get('detailTitle_en').value);
    formData.append("detailTitle_ur", this.editVipDetailsForm.get('detailTitle_ur').value);
    if(this.changeVipImg == true)
    {
      formData.append("vipImg", this.editVipDetailsForm.get('vipImg').value);
    }
    else
    {
      formData.append("oldVipImg", this.oldVipImg);
    }
    formData.append("description_en", this.editVipDetailsForm.get('description_en').value);
    formData.append("description_ur", this.editVipDetailsForm.get('description_ur').value);
    formData.append("module",'vip_detail');

    this.vipService.onUpdateVipCategory(formData, this.vipDetailsData.id).subscribe((res: any) => {
      if (res.status == '200') {
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
