import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { NbToastrService } from '@nebular/theme';
import { Router } from '@angular/router';
import { VipserviceService } from '../vipservice.service';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { HttpErrorResponse } from '@angular/common/http';

@Component({
  selector: 'ngx-addvipcategory',
  templateUrl: './addvipcategory.component.html'
})
export class AddvipcategoryComponent implements OnInit {

  addVipCategoriesForm: FormGroup;
  vipCategoryData: any = {};
  redirectDelay = 5;
  ckeConfig: any;

  constructor(public activeModal: NgbActiveModal,
    public fb: FormBuilder,
    public vipService: VipserviceService,
    public router: Router,
    private toastr: NbToastrService) { }

  ngOnInit() {

    //Ck Editor Configuration
    this.ckeConfig = {
      allowedContent: false,
      extraPlugins: 'divarea',
      forcePasteAsPlainText: true,
      //removeButtons:'Image,Cut,Copy,Paste,PasteText,PasteFromWord,Source,Undo,Redo,Scayt,SpecialChar,Strike,Subscript,Superscript,RemoveFormat,Anchor,About',
      //htmlEncodeOutput : false
    };


    //Initiate Add VIP Category Form
    this.addVipCategoriesForm = this.fb.group({
      title_en: ['', Validators.required],
      title_ur: ['', Validators.required],
      description_en: ['', Validators.required],
      description_ur: ['', Validators.required],
    });
  }


  //Validation for Required fields.
  get title_en() { return this.addVipCategoriesForm.get('title_en'); }
  get title_ur() { return this.addVipCategoriesForm.get('title_ur'); }
  get description_en() { return this.addVipCategoriesForm.get('description_en'); }
  get description_ur() { return this.addVipCategoriesForm.get('description_ur'); }



  /**
   * Function -- onAddVipCategory
   * Use -- This function will triggered when user submit the form.
   */
  onAddVipCategory() {

    let formData: FormData = new FormData();
    formData.append("title_en", this.addVipCategoriesForm.get('title_en').value);
    formData.append("title_ur", this.addVipCategoriesForm.get('title_ur').value);
    formData.append("description_en", this.addVipCategoriesForm.get('description_en').value);
    formData.append("description_ur", this.addVipCategoriesForm.get('description_ur').value);
    this.vipService.onAddVipCategory(formData).subscribe((res: any) => {
        if(res.status == '200')
        {
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
