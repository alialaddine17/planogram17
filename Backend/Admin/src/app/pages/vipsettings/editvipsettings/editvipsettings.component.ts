import { Component, OnInit } from '@angular/core';
import { HttpErrorResponse } from '@angular/common/http';
import { Validators, FormGroup, FormBuilder } from '@angular/forms';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { Router } from '@angular/router';
import { NbToastrService } from '@nebular/theme';
import { VipsettingsService } from '../vipsettings.service';

@Component({
  selector: 'ngx-editvipsettings',
  templateUrl: './editvipsettings.component.html'
})
export class EditvipsettingsComponent implements OnInit {
  editVipSettingForm: FormGroup;
  vipSettingData: any = {};
  redirectDelay = 5;
  ckeConfig: any;
  changeVipImg:boolean = false;
  oldVipImg:any;

  constructor(public activeModal: NgbActiveModal,
    public router: Router,
    private toastr: NbToastrService,
    private fb: FormBuilder,
    public vipSettingService: VipsettingsService) { }

  ngOnInit() {

    this.oldVipImg = this.vipSettingData.vipImg.substring(this.vipSettingData.vipImg.lastIndexOf('/') + 1);

    //Ck Editor Configuration
    this.ckeConfig = {
      allowedContent: false,
      extraPlugins: 'divarea',
      forcePasteAsPlainText: true,
      removeButtons:'Image,Cut,Copy,Paste,PasteText,PasteFromWord,Source,Undo,Redo,Scayt,SpecialChar,Strike,Subscript,Superscript,RemoveFormat,Anchor,About'
    };

    //Initiate Add Categories Form
    this.editVipSettingForm = this.fb.group({
      description_en:['',Validators.required],
      description_ur:['',Validators.required],
      vipImg:[null],
    });
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
    this.editVipSettingForm.patchValue({
      vipImg: file
    });
    this.editVipSettingForm.get('vipImg').updateValueAndValidity();
  }

  /**
   * Function -- onEditVipCategory
   * Use -- This function will trigger when user update any data.
   */
  onEditVipSetting() {
    let formData: FormData = new FormData();
    if(this.changeVipImg == true)
    {
      formData.append("vipImg", this.editVipSettingForm.get('vipImg').value);
    }
    else
    {
      formData.append("oldVipImg", this.oldVipImg);
    }
    formData.append("description_en", this.editVipSettingForm.get('description_en').value);
    formData.append("description_ur", this.editVipSettingForm.get('description_ur').value);

    this.vipSettingService.onUpdateVipSetting(formData, this.vipSettingData.id).subscribe((res: any) => {
      if (res.status == '200') {
        this.vipSettingData.message = res.body.message;
        this.activeModal.close(this.vipSettingData);
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
