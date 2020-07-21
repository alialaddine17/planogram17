import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { NbToastrService } from '@nebular/theme';
import { Router } from '@angular/router';
import { ProductsService } from '../products.service';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { HttpErrorResponse } from '@angular/common/http';

@Component({
  selector: 'ngx-addproduct',
  templateUrl: './addproduct.component.html'
})
export class AddproductComponent implements OnInit {

  addProductForm: FormGroup;
  productsData: any = {};
  redirectDelay = 5;
  parentIds = [];
  parentChangeId:any;
  showHideSubCategory:boolean = false;
  showLblLnk = false;
  subCategory = [];
  subCategoryId:any;
  types = [{          // Traffic Image Type dropdown array
    'type': 0,
    'name': 'Left'
  },
  {
    'type': 1,
    'name': 'Right'
  }];
  typeValue:any;

  constructor(public activeModal: NgbActiveModal,
    public fb: FormBuilder,
    public productService: ProductsService,
    public router: Router,
    private toastr: NbToastrService) { }
    @ViewChild('lblImg', {static: false}) lblImg: ElementRef;

  ngOnInit() {

    //Api call for subcategory parent id dropdown
    this.productService.getMainCategoryParentId().subscribe((res: any) => {
      if(res.status == '200')
      {
        this.parentIds = res.body.data.categories;
      }
    });

    //Initiate Add Categories Form
    this.addProductForm = this.fb.group({
      catId:['',Validators.required],
      subCatId:['',Validators.required],
      title_en: ['', Validators.required],
      title_ur: ['', Validators.required],
      productImg:[null],
      sortOrder:[null],
      trafficFlow:[null],
      label:[null],
      productDesc_en:[null],
      productDesc_ur: [null]
    });
  }

  get catId() { return this.addProductForm.get('catId'); }
  get subCatId() { return this.addProductForm.get('subCatId'); }
  get title_en() { return this.addProductForm.get('title_en'); }
  get title_ur() { return this.addProductForm.get('title_ur'); }
  get sortOrder() { return this.addProductForm.get('sortOrder'); }
  get trafficFlow() { return this.addProductForm.get('trafficFlow'); }
  get productDesc_en() { return this.addProductForm.get('productDesc_en'); }
  get productDesc_ur() { return this.addProductForm.get('productDesc_ur'); }


  /**
   * Function -- selectionChangedForParentId()
   * Use -- For Parent Id Dropdown Single value
   * @param event
   */
  selectionChangedForMainCategory(event)
  {
      this.parentChangeId = event.target.value;
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

  selectionChangedForSubCategory(event)
  {
    this.subCategoryId = event.target.value;
  }


  /**
   * Function -- uploadFileForProductImage
   * Use -- This function is used to upload images.
   * @param event
   */
  uploadFileForProductImage(event) {
    const file = (event.target as HTMLInputElement).files[0];
    this.addProductForm.patchValue({
      productImg: file
    });
    this.addProductForm.get('productImg').updateValueAndValidity();
  }


  /**
   * Function -- uploadFileForProductImage
   * Use -- This function is used to upload images.
   * @param event
   */
  uploadFileForLabelImage(event) {
    const file = (event.target as HTMLInputElement).files[0];
    if(file != undefined && file != null)
    {
      this.showLblLnk = true;
    }
    else
    {
      this.showLblLnk = false;
    }
    this.addProductForm.patchValue({
      label: file
    });
    this.addProductForm.get('label').updateValueAndValidity();
  }

  /**
   * Function -- removeSelectedFile
   * Use -- This function is used to delete image.
   * @param event
   */
  removeSelectedFile(event){
    this.lblImg.nativeElement.value = null;
  }


 /**
   * Function -- onChange
   * Use -- This funtion triggered when trafficFloeType Type dropdown changes.
   */
  onChange(event) {
    this.typeValue = event.target.value;
  }


  /**
   * Function -- onAddProduct
   * Use -- To Add new products list
   * Method -- POST
   * @param form
   */
  onAddProduct() {

    if(this.addProductForm.get('productImg').value == null)
    {
      this.toastr.warning('Please Upload Product Image','Warning');
      return;
    }

    let formData: FormData = new FormData();
    formData.append("catId", this.parentChangeId);
    formData.append("subCatId", this.subCategoryId);
    formData.append("title_en", this.addProductForm.get('title_en').value);
    formData.append("title_ur", this.addProductForm.get('title_ur').value);
    formData.append("productImg", this.addProductForm.get('productImg').value);
    formData.append("trafficFlow", this.typeValue);
    formData.append("sortOrder", this.addProductForm.get('sortOrder').value);
    formData.append("label", this.addProductForm.get('label').value);
    formData.append("productDesc_en", this.addProductForm.get('productDesc_en').value);
    formData.append("productDesc_ur", this.addProductForm.get('productDesc_ur').value);

    this.productService.onAddProduct(formData).subscribe((res: any) => {
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
