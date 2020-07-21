import { Component, OnInit, ViewChild } from '@angular/core';
import { DataTableDirective } from 'angular-datatables';
import { Subject } from 'rxjs';
import { NgbActiveModal, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { NbToastrService } from '@nebular/theme';
import { ProductsService } from './products.service'
import { AddproductComponent } from './addproduct/addproduct.component';
import { EditproductComponent } from './editproduct/editproduct.component';
import { ModalComponent } from '../bootstrap/modals/modal/modal.component';
import { HttpErrorResponse } from '@angular/common/http';

@Component({
  selector: 'ngx-products',
  templateUrl: './products.component.html'
})
export class ProductsComponent implements OnInit {

  items: any = [];
  @ViewChild(DataTableDirective, { static: false })
  dtElement: DataTableDirective;
  dtOptions: DataTables.Settings = {};
  products: any = [];
  dtTrigger: Subject<any> = new Subject();
  limit: any;
  start: any;
  datatableTmpParams: any;
  objectLength: any;
  loading = false;
  categoryArray: any = [];
  parentChangeId:any;
  showHideSubCategory:boolean = true;
  subCategory = [];
  subCategoryId:any;
  subCatId:any = '';
  catId:any = '';


  constructor(private productsService: ProductsService,
    private toastr: NbToastrService,
    private modalService: NgbModal,
    public activeModal: NgbActiveModal) { }

  ngOnInit() {

    //Api call for subcategory parent id dropdown
    this.productsService.getMainCategoryParentId().subscribe((res: any) => {
      if(res.status == '200')
      {
        this.categoryArray = res.body.data.categories;
      }
    });

    this.getProductList();
  }


  ngAfterViewInit(): void {
    this.dtTrigger.next();
  }

  ngOnDestroy(): void {
    // Do not forget to unsubscribe the event
    this.dtTrigger.unsubscribe();
  }

  rerender(): void {
    this.dtElement.dtInstance.then((dtInstance: DataTables.Api) => {
      // Destroy the table first
      dtInstance.destroy();
      // Call the dtTrigger to rerender again
      this.dtTrigger.next();
    });
  }


  /**
     * Developed By : Weblineindia
     * Function : getDataList
     * Purpose : Call listing API and display the required fields of the respective module
     */
  getProductList() {
    this.loading = true;

    this.dtOptions = {
      dom: 'lBfrtip',
      pagingType: 'full_numbers',
      lengthMenu: [10, 20, 30, 40],
      paging: true,
      pageLength: 10,
      serverSide: true,
      stateSave: true,
      processing: true,
      columnDefs: [{ orderable: false, targets: [1] },{ orderable: false, targets: [2] },{ orderable: false, targets: [5] }, { orderable: false, targets: [6] },{ orderable: false, targets: [7] }, { orderable: false, targets: [8] }, { orderable: false, targets: [9] },{ orderable: false, targets: [10] }]
    };

    this.dtOptions.ajax = (dataTablesParameters: any, callback) => {
      if (dataTablesParameters.order[0].column == 0) {
        dataTablesParameters.order[0].column = 'id';
        dataTablesParameters.order[0].dir = 'desc';
      }
      if (dataTablesParameters.order[0].column == 1) {
        dataTablesParameters.order[0].column = 'mainCat';
      }
      if (dataTablesParameters.order[0].column == 2) {
        dataTablesParameters.order[0].column = 'subCat';
      }
      if (dataTablesParameters.order[0].column == 3) {
        dataTablesParameters.order[0].column = 'title_en';
      }
      if (dataTablesParameters.order[0].column == 4) {
        dataTablesParameters.order[0].column = 'title_ur';
      }
      if (dataTablesParameters.order[0].column == 7) {
        dataTablesParameters.order[0].column = 'created_at';
      }


      this.productsService.getProductList(dataTablesParameters.length, dataTablesParameters.start, dataTablesParameters.search.value, dataTablesParameters.order[0].column, dataTablesParameters.order[0].dir,this.catId,this.subCatId).subscribe(resp => {
        if (resp.status == 200) {
          this.products = resp.body.data.products;
          this.objectLength = Object.keys(this.products).length != 0;
          this.datatableTmpParams = dataTablesParameters;
          this.loading = false;

          callback({
            recordsTotal: (resp.body.data.recordsTotal == undefined) ? 0 : resp.body.data.recordsTotal,
            recordsFiltered: (resp.body.data.recordsTotal == undefined) ? 0 : resp.body.data.recordsTotal,
            data: []
          });
        }
      });
    };
  }


  /**
   * Developed By : Weblineindia
   * Function : Create
   * Purpose : Call Create API,push data into array and redirect to the listing page
   */
  addProduct() {
    const addmodalRef = this.modalService.open(AddproductComponent, { size: 'lg' });
    addmodalRef.result.then((result) => {
      if (result) {
        this.toastr.success(result.message, 'Success');
        this.rerender();
      }
      else {
        this.toastr.danger(result.message, 'Error');
      }
    }).catch((error) => {
    });
  }


  /**
   * Developed By : Weblineindia
   * Function : Update
   * Purpose : Call Update API,updates data of particular id and redirect to the listing page
   */
  editProduct(formData: any) {
    const modalRef = this.modalService.open(EditproductComponent, { size: 'lg' });
    modalRef.componentInstance.productsData = formData;

    modalRef.result.then((result) => {
      if (result) {
        this.rerender();
        this.toastr.success(result.message, 'Success');
      }
      else {
        this.toastr.danger('Something Went Wrong', 'Error');
      }
    }).catch((error) => {

    });
  }


  /**
   * Developed By : Weblineindia
   * Function : Delete
   * Purpose : Call Delete API,deletes data of particular id and redirect to the listing page
   */
  deleteProduct(id) {

    const modelConfirmation = this.modalService.open(ModalComponent);

    modelConfirmation.result.then((result) => {
      if (result[0] != 'undefined' && result[0] == true) {
        this.productsService.onDeleteProduct(id).subscribe((res: any) => {
          if (res.status == '200') {
            this.toastr.success(res.body.message, 'Success');
            this.rerender();
          }
        },
          (error: HttpErrorResponse) => {
            if (error.error instanceof Error) {
              this.toastr.danger(error.error.message, 'Error');
            }
            else {
              this.toastr.danger(error.error.message, 'Error');
            }
          });
      }
    });
  }


  /**
   * Function -- updateStatusForProduct()
   * Use - This function is used to change status
   * @param statusValue
   * @param id
   */
  updateStatusForProduct(statusValue, id) {

    let status = {
      action: statusValue
    }

    this.productsService.updateStatusForProduct(status, id).subscribe((res: any) => {
      if (res.status == '200') {
        this.toastr.success(res.body.message, 'Status Change');
        this.rerender();
      }
    },
      (error: HttpErrorResponse) => {
        if (error.error instanceof Error) {
          this.toastr.danger(error.error.message, 'Error');
        }
        else {
          this.toastr.danger(error.error.message, 'Error');
        }
      });
  }


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
        this.productsService.getSubCategoryParentId(this.parentChangeId).subscribe((res: any) => {
          if(res.status == '200')
          {
            this.showHideSubCategory = false;
            this.subCategory = res.body.data.subcategories;
          }
        });
      }
      else
      {
        this.showHideSubCategory = true;
      }
  }

  selectionChangedForSubCategory(event)
  {
    this.subCategoryId = event.target.value;
  }


  /**
   * Function -- onSubmit()
   * Use -- Filter based on year selection
   */
  onSubmit()
  {
    this.rerender();
  }


  resetFilter()
  {
    this.subCatId = '';
    this.catId = '';
    this.showHideSubCategory = true;
    this.rerender();

  }


}
