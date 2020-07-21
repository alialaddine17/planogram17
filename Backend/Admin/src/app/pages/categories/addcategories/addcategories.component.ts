import { Component, OnInit } from '@angular/core';
import { FormGroup, Validators, FormBuilder } from '@angular/forms';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { Router } from '@angular/router';
import { NbToastrService } from '@nebular/theme';
import { CategoriesService } from '../categories.service';
import '../../editors/ckeditor/ckeditor.loader';
import 'ckeditor';
import { HttpErrorResponse } from '@angular/common/http';


@Component({
  selector: 'ngx-addcategories',
  templateUrl: './addcategories.component.html'
})
export class AddCategoriesComponent implements OnInit {

  addCategoriesForm: FormGroup;
  categoriesData: any = {};
  redirectDelay = 5;

  constructor(public activeModal: NgbActiveModal,
    public fb: FormBuilder,
    public categoriesService: CategoriesService,
    public router: Router,
    private toastr: NbToastrService) { }


  ngOnInit() {
    //Initiate Add Categories Form
    this.addCategoriesForm = this.fb.group({
      title_en: ['', Validators.required],
      title_ur: ['', Validators.required],
      catImg:['',Validators.required],
      catSortOrder : [null]
    });
  }


  get title_en() { return this.addCategoriesForm.get('title_en'); }
  get title_ur() { return this.addCategoriesForm.get('title_ur'); }
  get catSortOrder() { return this.addCategoriesForm.get('catSortOrder'); }

  /**
   * Function -- uploadFileForCategoryImage
   * Use -- This function is used to upload images.
   * @param event
   */
  uploadFileForCatImage(event) {
    const file = (event.target as HTMLInputElement).files[0];
    this.addCategoriesForm.patchValue({
      catImg: file
    });
    this.addCategoriesForm.get('catImg').updateValueAndValidity();
  }

  /**
   * Function -- onAddCategory
   * Use -- To Add new channelsto channels list
   * Method -- POST
   * @param form
   */
  onAddCategory(form) {

    if(this.addCategoriesForm.get('catImg').value == null)
    {
      this.toastr.warning('Please Upload Category Image','Warning');
      return;
    }

    let formData: FormData = new FormData();
    formData.append("title_en", this.addCategoriesForm.get('title_en').value);
    formData.append("title_ur", this.addCategoriesForm.get('title_ur').value);
    formData.append("catSortOrder", this.addCategoriesForm.get('catSortOrder').value);
    formData.append("catImg", this.addCategoriesForm.get('catImg').value);
    
    this.categoriesService.onAddCategory(formData).subscribe((res: any) => {
      if(res.status == '200')
      {
        this.categoriesData.message = res.body.message;
        this.activeModal.close(this.categoriesData);
      }
    },
      (err: HttpErrorResponse) => {
        if (err.status == 401) {
          setTimeout(() => {
            this.activeModal.close();
            this.toastr.danger(err.error.message,'Error');
            return this.router.navigateByUrl('/pages/categories');
          }, this.redirectDelay);
        }
        else {
          this.activeModal.close();
          this.toastr.danger(err.error.message,'Error');
        }
      })
  }


/**
   * Function -- onCloseModel
   * Use -- To close modal popup.
   */
  onCloseModel()
  {
    this.activeModal.dismiss();
  }
}
