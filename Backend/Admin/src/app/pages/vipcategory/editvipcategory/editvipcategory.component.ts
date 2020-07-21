import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { Router } from '@angular/router';
import { NbToastrService } from '@nebular/theme';
import { VipserviceService } from '../vipservice.service';
import { HttpErrorResponse } from '@angular/common/http';

@Component({
  selector: 'ngx-editvipcategory',
  templateUrl: './editvipcategory.component.html'
})
export class EditvipcategoryComponent implements OnInit {

  editVipCategoryForm: FormGroup;
  vipCategoryData: any = {};
  redirectDelay = 5;
  ckeConfig: any;

  constructor(public activeModal: NgbActiveModal,
              public router: Router,
              private toastr: NbToastrService,
              private fb: FormBuilder,
              public vipService: VipserviceService) { }

  ngOnInit() {

    //Ck Editor Configuration
    this.ckeConfig = {
      allowedContent: false,
      extraPlugins: 'divarea',
      forcePasteAsPlainText: true,
      //removeButtons:'Image,Cut,Copy,Paste,PasteText,PasteFromWord,Source,Undo,Redo,Scayt,SpecialChar,Strike,Subscript,Superscript,RemoveFormat,Anchor,About',
      //htmlEncodeOutput : false
    };

    //Initiate Add Categories Form
    this.editVipCategoryForm = this.fb.group({
      title_en: ['', Validators.required],
      title_ur: ['', Validators.required],
      description_en: ['', Validators.required],
      description_ur: ['', Validators.required]
    });
  }


  /**
   * Function -- onEditVipCategory
   * Use -- This function will trigger when user update any data.
   */
  onEditVipCategory() {
    let formData: FormData = new FormData();
    formData.append("title_en", this.editVipCategoryForm.get('title_en').value);
    formData.append("title_ur", this.editVipCategoryForm.get('title_ur').value);
    formData.append("description_en", this.editVipCategoryForm.get('description_en').value);
    formData.append("description_ur", this.editVipCategoryForm.get('description_ur').value);
    formData.append("module",'vip');


    this.vipService.onUpdateVipCategory(formData, this.vipCategoryData.id).subscribe((res: any) => {
      if (res.status == '200') {
        this.vipCategoryData.message = res.body.message;
        this.activeModal.close(this.vipCategoryData);
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
