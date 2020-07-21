import { Component, OnInit } from '@angular/core';
import { FormGroup, Validators, FormBuilder } from '@angular/forms';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { HttpErrorResponse } from '@angular/common/http';
import { Router } from '@angular/router';
import { NbToastrService } from '@nebular/theme';
import { SubCategoriesService } from './../sub-categories.service';


@Component({
  selector: 'ngx-addsub-categories',
  templateUrl: './addsub-categories.component.html'
})
export class AddSubCategoriesComponent implements OnInit {
  addSubCategoriesForm: FormGroup;
  subcategoriesData: any = {};
  redirectDelay = 5;
  parentIds = [];
  parentChangeId:any;


  constructor(public activeModal: NgbActiveModal,
    public fb: FormBuilder,
    public subcategoriesService: SubCategoriesService,
    public router: Router,
    private toastr: NbToastrService) { }


  ngOnInit() {

    //Api call for subcategory parent id dropdown
    this.subcategoriesService.getSubCategoryParentId().subscribe((res: any) => {
      if(res.status == '200')
      {
        this.parentIds = res.body.data.categories;
      }
    });

    //Initiate Add Sub-Categories Form
    this.addSubCategoriesForm = this.fb.group({
      parentid:['',Validators.required],
      title_en: ['', Validators.required],
      title_ur: ['', Validators.required],
      subTitle_en: [null],
      subTitle_ur: [null],
      catSortOrder: [null]
    });
  }

  get parentid() { return this.addSubCategoriesForm.get('parentid'); }
  get title_en() { return this.addSubCategoriesForm.get('title_en'); }
  get title_ur() { return this.addSubCategoriesForm.get('title_ur'); }
  //get subTitle_en() { return this.addSubCategoriesForm.get('subTitle_en'); }
  //get subTitle_ur() { return this.addSubCategoriesForm.get('subTitle_ur'); }
  get catSortOrder() { return this.addSubCategoriesForm.get('catSortOrder'); }


  /**
   * Function -- selectionChangedForParentId()
   * Use -- For Parent Id Dropdown Single value
   * @param event
   */
  selectionChangedForParentId(event)
  {
      this.parentChangeId = event.target.value;
  }


  /**
   * Function -- onAddSubCategory()
   * Use -- To Add new onAddSubCategory to SubCategory list
   * Method -- POST
   * @param form
   */
  onAddSubCategories(form) {

    let postData = {
      parentid:this.parentChangeId,
      title_en:form.title_en,
      title_ur:form.title_ur,
      subTitle_en:form.subTitle_en,
      subTitle_ur:form.subTitle_ur,
      catSortOrder:form.catSortOrder
    }

    this.subcategoriesService.onAddSubCategory(postData).subscribe((res: any) => {
      if(res.status == '200')
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
            return this.router.navigateByUrl('/pages/sub-categories');
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
