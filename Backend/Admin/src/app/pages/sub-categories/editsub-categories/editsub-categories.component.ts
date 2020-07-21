import { Component, OnInit } from '@angular/core';
import { NbToastrService } from '@nebular/theme';
import { Router } from '@angular/router';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { FormBuilder, FormGroup, Validators, FormControl } from '@angular/forms';
import { HttpErrorResponse } from '@angular/common/http';
import { CategoriesService } from '../../categories/categories.service';
import { SubCategoriesService } from './../sub-categories.service';

@Component({
  selector: 'ngx-editsub-categories',
  templateUrl: './editsub-categories.component.html'
})

export class EditSubCategoriesComponent implements OnInit {
  subcategoriesData: any = {};
  subcategoryEditForm: FormGroup;
  redirectDelay:5;
  parentIds = [];
  parentChangeId:any;

  constructor(private fb: FormBuilder,
    public subcategoryService: SubCategoriesService,
    public activeModal: NgbActiveModal,
    private router: Router,
    private toastr: NbToastrService) { }

  ngOnInit() {
    //Api call for subcategory parent id dropdown
    this.subcategoryService.getSubCategoryParentId().subscribe((res: any) => {
      if(res.status == '200')
      {
        this.parentIds = res.body.data.categories;
      }
    });


    this.subcategoryEditForm = this.fb.group({
      parentid:['',Validators.required],
      title_en: ['', Validators.required],
      title_ur: ['', Validators.required],
      subTitle_en: [null],
      subTitle_ur: [null],
      catSortOrder : [null]
    });
  }

  get parentid() { return this.subcategoryEditForm.get('parentid'); }
  get title_en() { return this.subcategoryEditForm.get('title_en'); }
  get title_ur() { return this.subcategoryEditForm.get('title_ur'); }
  get subTitle_en() { return this.subcategoryEditForm.get('subTitle_en'); }
  get subTitle_ur() { return this.subcategoryEditForm.get('subTitle_ur'); }
  get catSortOrder() { return this.subcategoryEditForm.get('catSortOrder'); }


  /**
   * Function -- onUpdateSubCateory()
   * Use -- This function is called when user updates some value
   * @param categoryEditForm
   */
  onUpdateSubCateory(categoryEditForm) {

    let postData = {
      parentid:categoryEditForm.parentid,
      title_en:categoryEditForm.title_en,
      title_ur:categoryEditForm.title_ur,
      subTitle_en:categoryEditForm.subTitle_en,
      subTitle_ur:categoryEditForm.subTitle_ur,
      catSortOrder:categoryEditForm.catSortOrder
    }

    this.subcategoryService.onUpdateSubCategory(postData, this.subcategoriesData.id).subscribe((res: any) => {
        if(res.status =='200')
        {
          this.subcategoriesData.message = res.body.message;
          this.activeModal.close(this.subcategoriesData);
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
