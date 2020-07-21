import { Component, OnInit } from '@angular/core';
import { HttpErrorResponse } from '@angular/common/http';
import { Validators, FormBuilder, FormGroup } from '@angular/forms';
import { NbToastrService } from '@nebular/theme';
import { Router } from '@angular/router';
import { VipsettingsService } from '../vipsettings.service';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'ngx-addvipsettings',
  templateUrl: './addvipsettings.component.html'
})
export class AddvipsettingsComponent implements OnInit {

  addVipSettingForm: FormGroup;
  vipSettingData: any = {};
  redirectDelay = 5;
  ckeConfig: any;


  constructor(public activeModal: NgbActiveModal,
    public fb: FormBuilder,
    public vipSettingService: VipsettingsService,
    public router: Router,
    private toastr: NbToastrService) { }

  ngOnInit() {

    //Ck Editor Configuration
    this.ckeConfig = {
      allowedContent: false,
      extraPlugins: 'divarea',
      forcePasteAsPlainText: true,
      removeButtons:'Image,Cut,Copy,Paste,PasteText,PasteFromWord,Source,Undo,Redo,Scayt,SpecialChar,Strike,Subscript,Superscript,RemoveFormat,Anchor,About'
    };

    //Initiate Add VIP Category Form
    this.addVipSettingForm = this.fb.group({
      description_en: ['', Validators.required],
      description_ur: ['', Validators.required],
      vipImg:[null]
    });
  }


  //Validation for Required fields.
  get description_en() { return this.addVipSettingForm.get('description_en'); }
  get description_ur() { return this.addVipSettingForm.get('description_ur'); }


  /**
   * Function -- uploadFile
   * Use -- This function is used to upload images.
   * @param event
   */
  uploadFile(event) {
    const file = (event.target as HTMLInputElement).files[0];
    this.addVipSettingForm.patchValue({
      vipImg: file
    });
    this.addVipSettingForm.get('vipImg').updateValueAndValidity();
  }

  /**
   * Function -- onAddVipCategory
   * Use -- This function will triggered when user submit the form.
   */
  onAddVipSetting() {

    if(this.addVipSettingForm.get('vipImg').value == null)
    {
      this.toastr.warning('Please Upload VIP Image','Warning');
      return;
    }

    let formData: FormData = new FormData();
    formData.append("description_en", this.addVipSettingForm.get('description_en').value);
    formData.append("description_ur", this.addVipSettingForm.get('description_ur').value);
    formData.append("vipImg", this.addVipSettingForm.get('vipImg').value);
    this.vipSettingService.onAddVipSetting(formData).subscribe((res: any) => {
      if (res.status == '200') {
        this.vipSettingData.message = res.body.message;
        this.activeModal.close(this.vipSettingData);
      }
    },
      (err: HttpErrorResponse) => {
        if (err.status == 401) {
          setTimeout(() => {
            this.activeModal.close();
            this.toastr.danger(err.error.message, 'Error');
            return this.router.navigateByUrl('/pages/vipsettings');
          }, this.redirectDelay);
        }
        else {
          this.activeModal.close();
          this.toastr.danger(err.error.message, 'Error');
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
