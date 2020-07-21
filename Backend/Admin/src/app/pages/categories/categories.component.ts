import { Component, OnInit,ViewChild } from '@angular/core';
import { CategoriesService } from './categories.service';
import { NbToastrService } from '@nebular/theme';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { DomSanitizer } from '@angular/platform-browser';
import { EditCategoriesComponent } from './editcategories/editcategories.component';
import { AddCategoriesComponent } from './addcategories/addcategories.component';
import { ModalComponent } from '../bootstrap/modals/modal/modal.component';
import { DatePipe } from '@angular/common';
import { Subject } from 'rxjs';
import { DataTableDirective } from 'angular-datatables';
import { Router } from '@angular/router';


class DataTablesResponse {
  data: any[];
  draw: number;
  recordsFiltered: number;
  recordsTotal: number;
}

@Component({
  selector: 'ngx-categories',
  templateUrl: './categories.component.html'
})
export class CategoriesComponent implements OnInit {

  categoriesData: any = {};
  marked = false;

  @ViewChild(DataTableDirective, {static: false})
  dtElement: DataTableDirective;
  selectedFilter: any = 10;
  items: any = [];
  dtOptions: DataTables.Settings = {};
  categories: any = [];
  loading = false;
  dtTrigger: Subject<any> = new Subject();
  limit:any;
  start:any;
  datatableTmpParams:any;
  objectLength: any;
  redirectDelay: number = 1000;

  constructor(private categoriesService: CategoriesService,
              private toastr: NbToastrService,
              private router: Router,
              private modalService: NgbModal) {

               }
  /**
   * Function : ngOnInit
   * Purpose : Call listing function to display the values
   */
  ngOnInit() {
    this.getCategoryList();
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
   * Function : getDataList
   * Purpose : Call listing API and display the required fields of the respective module
   */
  getCategoryList() {

      this.loading = true;

      this.dtOptions = {
        dom: 'lBfrtip',
        pagingType: 'full_numbers',
        lengthMenu:[10,20,30,40],
        paging: true,
        pageLength: 10,
        serverSide: true,
        processing: true,
        columnDefs: [{ orderable: false, targets: [4]}, { orderable: false, targets: [5]}]
      };

      this.dtOptions.ajax = (dataTablesParameters: any, callback) => {
        if(dataTablesParameters.order[0].column == 0)
        {
          dataTablesParameters.order[0].column = 'id';
          dataTablesParameters.order[0].dir = 'desc';
        }
        if(dataTablesParameters.order[0].column == 1)
        {
          dataTablesParameters.order[0].column = 'title_en';
        }
        if(dataTablesParameters.order[0].column == 2)
        {
          dataTablesParameters.order[0].column = 'title_ur';
        }

        if(dataTablesParameters.order[0].column == 5)
        {
          dataTablesParameters.order[0].column = 'created_at';
        }

        if(this.limit != undefined)
        {
          dataTablesParameters.length = this.limit;
        }

        if(this.start != undefined)
        {
          dataTablesParameters.start = this.start;
        }

        this.categoriesService.getCategoryData(dataTablesParameters.length, dataTablesParameters.start,dataTablesParameters.search.value,dataTablesParameters.order[0].column,dataTablesParameters.order[0].dir).subscribe((res: any) => {
              this.categories = res.body.data.categories;
              this.objectLength = Object.keys(this.categories).length != 0;
              this.datatableTmpParams = dataTablesParameters;
              this.limit = this.start = undefined;
              this.loading = false;
          callback({
                recordsTotal: (res.body.data.recordsTotal == undefined) ? 0 : res.body.data.recordsTotal,
                recordsFiltered: (res.body.data.recordsTotal == undefined) ? 0 : res.body.data.recordsTotal,
                data: []
              });
        },
        (err: HttpErrorResponse) => {
          if (err.status == 401) {
            setTimeout(() => {
              this.toastr.danger(err.error.message,'Error');
              return this.router.navigateByUrl('/pages/categories');
            }, this.redirectDelay);
          }
          else {
            this.toastr.danger(err.error.message, 'Error');
          }
      });
    }
  }


  /**
   * Developed By : Weblineindia
   * Function : Create
   * Purpose : Call Create API,push data into array and redirect to the listing page
   */
  addCategory() {
    const addmodalRef = this.modalService.open(AddCategoriesComponent, { size: 'lg' });
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
  editCategory(formData: any) {
    const modalRef = this.modalService.open(EditCategoriesComponent, { size: 'lg' });
    modalRef.componentInstance.categoriesData = formData;

    modalRef.result.then((result) => {
      if (result) {
        this.toastr.success(result.message, 'Success');
        this.rerender();
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
  deleteCategory(id) {

    const modelConfirmation = this.modalService.open(ModalComponent);

    modelConfirmation.result.then((result) => {
      if (result[0] != 'undefined' && result[0] == true) {
        this.categoriesService.onDeleteCategory(id).subscribe((res: any) => {
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
   * Function -- onCategoryStatusChange()
   * Use - This function is used to change status
   * @param statusValue
   * @param id
   */
 onCategoryStatusChange(statusValue,id) {

  let status = {
    action: statusValue
  }

  this.categoriesService.updateCategoryStatus(status, id).subscribe((res: any) => {
    if (res.status == '200')
    {
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


}

