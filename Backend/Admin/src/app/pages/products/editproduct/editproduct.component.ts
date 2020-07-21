import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { NbToastrService } from '@nebular/theme';
import { Router } from '@angular/router';
import { ProductsService } from '../products.service';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { HttpErrorResponse } from '@angular/common/http';

@Component({
  selector: 'ngx-editproduct',
  templateUrl: './editproduct.component.html'
})
export class EditproductComponent implements OnInit {
  editProductForm: FormGroup;
  productsData: any = {};
  redirectDelay = 5;
  parentIds = [];
  parentChangeId:any;
  showHideSubCategory:boolean = false;
  subCategory = [];
  subCategoryId:any;
  isChangesMainCat:boolean = false;
  isChangesSubCat:boolean = false;
  oldProductImg:any;
  oldlabelImg:any;
  changeProductImg:boolean = false;
  changeLabelImg:boolean = false;
  showLblLnk = false;
  types = [{          // Traffic Image Type dropdown array
    'type': 0,
    'name': 'Left'
  },
  {
    'type': 1,
    'name': 'Right'
  }];
  typeValue:any;
  onChangeTrafficFlowValue:boolean = false;

  constructor(public activeModal: NgbActiveModal,
    public fb: FormBuilder,
    public productService: ProductsService,
    public router: Router,
    private toastr: NbToastrService) { }
    @ViewChild('lblImg', {static: false}) lblImg: ElementRef;


  ngOnInit() {
    this.oldProductImg = this.productsData.productImg.substring(this.productsData.productImg.lastIndexOf('/') + 1);
    this.oldlabelImg = this.productsData.label.substring(this.productsData.label.lastIndexOf('/') + 1)
    //Api call for subcategory parent id dropdown
    this.productService.getMainCategoryParentId().subscribe((res: any) => {
      if(res.status == '200')
      {
        this.parentIds = res.body.data.categories;
      }
    });

    //Sub Category Id Dropdown
    this.productService.getSubCategoryParentId(this.productsData.catId).subscribe((res: any) => {
      if(res.status == '200')
      {
        this.subCategory = res.body.data.subcategories;
      }
    });

    //Initiate Add Categories Form
    this.editProductForm = this.fb.group({
      catId:['',Validators.required],
      subCatId:['',Validators.required],
      title_en: ['', Validators.required],
      title_ur: ['', Validators.required],
      productImg:[null],
      sortOrder:[null],
      trafficFlow:[null],
      label:[null],
      productDesc_en : [null],
      productDesc_ur : [null]
    });

    if(this.productsData.oldlabelImg != '' && this.productsData.oldlabelImg != '-')
    {
      this.showLblLnk = true;
    }
  }

  /**
   * Function -- selectionChangedForMainCategory()
   * Use -- For Parent Id Dropdown Single value
   * @param event
   */
  selectionChangedForMainCategory(event)
  {
      this.isChangesMainCat = true;
      this.parentChangeId = event.target.value;
      if(this.isChangesMainCat == true)
      {
        if(this.parentChangeId != null && this.parentChangeId != '' && this.parentChangeId != undefined)
      {
        this.showHideSubCategory = true;
        this.productService.getSubCategoryParentId(this.parentChangeId).subscribe((res: any) => {
          if(res.status == '200')
          {
            this.subCategory = res.body.data.subcategories;
          }
        });
      }
      else
      {
        this.showHideSubCategory = false;
      }
    }
  }



  /**
   * Function -- selectionChangedForSubCategory()
   * Use -- For Parent Id Dropdown Single value
   * @param event
   */
  selectionChangedForSubCategory(event)
  {
    this.isChangesSubCat = true;
    this.subCategoryId = event.target.value;
  }

  /**
   * Function -- onChange
   * Use -- This funtion triggered when trafficFloeType Type dropdown changes.
   */
  onChange(event) {
    this.onChangeTrafficFlowValue = true;
    this.typeValue = event.target.value;
  }

  /**
   * Function -- removeSelectedFile
   * Use -- This function is used to delete image.
   * @param event
   */
  removeSelectedFile(event){
    this.oldlabelImg = '';
    this.productsData.label = '-';
    this.showLblLnk = false;
  }


  /**
   * Function -- uploadFileForProductImage
   * Use -- This function is used to upload images.
   * @param event
   */
  uploadFileForProductImage(event) {
    if(event.type == 'change')
    {
      this.changeProductImg = true;
    }
    else
    {
      this.changeProductImg = false;
    }
    const file = (event.target as HTMLInputElement).files[0];
    this.editProductForm.patchValue({
      productImg: file
    });
    this.editProductForm.get('productImg').updateValueAndValidity();
  }

  /**
   * Function -- uploadFileForProductImage
   * Use -- This function is used to upload images.
   * @param event
   */
  uploadFileForLabelImage(event) {
    if(event.type == 'change')
    {
      this.changeLabelImg = true;
    }
    else
    {
      this.changeLabelImg = false;
    }
    const file = (event.target as HTMLInputElement).files[0];
    this.editProductForm.patchValue({
      label: file
    });
    this.editProductForm.get('label').updateValueAndValidity();
  }



  /**
   * Function -- onAddProduct
   * Use -- To Add new products list
   * Method -- POST
   * @param form
   */
  onEditProduct() {

    let formData: FormData = new FormData();
    if(this.isChangesMainCat == true)
    {
      formData.append("catId", this.parentChangeId);
    }
    else
    {
      formData.append("catId", this.productsData.catId);
    }
    if(this.isChangesSubCat == true)
    {
      formData.append("subCatId", this.productsData.subCatId);
    }
    else
    {
      formData.append("subCatId", this.productsData.subCatId);
    }
    formData.append("title_en", this.editProductForm.get('title_en').value);
    formData.append("title_ur", this.editProductForm.get('title_ur').value);
    formData.append("sortOrder", this.editProductForm.get('sortOrder').value);
    formData.append("productDesc_en", this.editProductForm.get('productDesc_en').value);
    formData.append("productDesc_ur", this.editProductForm.get('productDesc_ur').value);
    if(this.changeProductImg == true)
    {
      formData.append("productImg", this.editProductForm.get('productImg').value);
    }
    else
    {
      formData.append("oldProductImg", this.oldProductImg);
    }
    if(this.onChangeTrafficFlowValue == true)
    {
      formData.append("trafficFlow", this.typeValue);
    }
    else
    {
      formData.append("trafficFlow", this.productsData.trafficFlow);
    }
    if(this.changeLabelImg == true)
    {
      formData.append("label", this.editProductForm.get('label').value);
    }
    else
    {
      formData.append("oldlabelImg", this.oldlabelImg);
    }


    this.productService.onUpdateProduct(formData,this.productsData.id).subscribe((res: any) => {
      if(res.status == '200')
      {
        this.productsData.message = res.body.message;
        this.activeModal.close(this.productsData);
      }
    },
      (err: HttpErrorResponse) => {
        if (err.status == 401) {
          setTimeout(() => {
            this.activeModal.close();
            this.toastr.danger(err.error.message,'Error');
            return this.router.navigateByUrl('/pages/products');
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
