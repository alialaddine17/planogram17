import { Component, OnInit } from '@angular/core';
import { NbToastrService } from '@nebular/theme';
import { Router } from '@angular/router';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { CategoriesService } from '../categories.service';
import { HttpErrorResponse } from '@angular/common/http';

@Component({
  selector: 'ngx-editcategories',
  templateUrl: './editcategories.component.html'
})
export class EditCategoriesComponent implements OnInit {
  categoriesData: any = {};
  categoryEditForm: FormGroup;
  redirectDelay:5;
  oldcatImg:any;
  changeCatImg:boolean = false;

  constructor(private fb: FormBuilder,
    public categoryService: CategoriesService,
    public activeModal: NgbActiveModal,
    private router: Router,
    private toastr: NbToastrService) { }

  ngOnInit() {
    this.oldcatImg = this.categoriesData.catImg.substring(this.categoriesData.catImg.lastIndexOf('/') + 1)

    this.categoryEditForm = this.fb.group({
      title_en: ['', Validators.required],
      title_ur: ['', Validators.required],
      catImg:[null],
      catSortOrder : [null]
    });
  }

  get title_en() { return this.categoryEditForm.get('title_en'); }
  get title_ur() { return this.categoryEditForm.get('title_ur'); }
  get catSortOrder() { return this.categoryEditForm.get('catSortOrder'); }

  /**
   * Function -- uploadFileForProductImage
   * Use -- This function is used to upload images.
   * @param event
   */
  uploadFileForCatImage(event) {
    if(event.type == 'change')
    {
      this.changeCatImg = true;
    }
    else
    {
      this.changeCatImg = false;
    }
    const file = (event.target as HTMLInputElement).files[0];
    this.categoryEditForm.patchValue({
      catImg: file
    });
    this.categoryEditForm.get('catImg').updateValueAndValidity();
  }


  /**
   * Function -- onUpdateCateory()
   * Use -- This function is called when user updates some value
   * @param categoryEditForm
   */
  onUpdateCateory(categoryEditForm) {

    let formData: FormData = new FormData();
    formData.append("title_en", this.categoryEditForm.get('title_en').value);
    formData.append("title_ur", this.categoryEditForm.get('title_ur').value);
    formData.append("catSortOrder", this.categoryEditForm.get('catSortOrder').value);

    if(this.changeCatImg == true)
    {
      formData.append("catImg", this.categoryEditForm.get('catImg').value);
    }
    else
    {
      formData.append("oldCatImg", this.oldcatImg);
    }

    this.categoryService.onUpdateCategory(formData, this.categoriesData.id).subscribe((res: any) => {
        if(res.status =='200')
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
