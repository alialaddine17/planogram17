import { Component, OnInit,ViewChild } from '@angular/core';
import { SubCategoriesService } from './sub-categories.service';
import { NbToastrService } from '@nebular/theme';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { HttpErrorResponse } from '@angular/common/http';
import { EditSubCategoriesComponent } from './editsub-categories/editsub-categories.component';
import { AddSubCategoriesComponent } from './addsub-categories/addsub-categories.component';
import { ModalComponent } from '../bootstrap/modals/modal/modal.component';
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
  selector: 'ngx-sub-categories',
  templateUrl: './sub-categories.component.html'
})
export class SubCategoriesComponent implements OnInit {


  marked = false;

  @ViewChild(DataTableDirective, {static: false})
  dtElement: DataTableDirective;
  selectedFilter: any = 10;
  items: any = [];
  dtOptions: DataTables.Settings = {};
  subCategories: any = [];
  loading = false;
  dtTrigger: Subject<any> = new Subject();
  limit:any;
  start:any;
  datatableTmpParams:any;
  objectLength: any;
  redirectDelay: number = 1000;

  constructor(private subCategoryService: SubCategoriesService,
              private toastr: NbToastrService,
              private modalService: NgbModal,
              private router: Router) {

               }
  /**
   * Function : ngOnInit
   * Purpose : Call listing function to display the values
   */
  ngOnInit() {
    this.getSubCategoryData();
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
   * Function : getSubCategoryData()
   * Purpose : Call listing API and display the required fields of the respective module
   */
  getSubCategoryData() {

      this.loading = true;

      this.dtOptions = {
        dom: 'lBfrtip',
        pagingType: 'full_numbers',
        lengthMenu:[10,20,30,40],
        paging: true,
        pageLength: 10,
        serverSide: true,
        processing: true,
        columnDefs: [{ orderable: false, targets: [1]},{ orderable: false, targets: [5]},{ orderable: false, targets: [6]}]
      };

      this.dtOptions.ajax = (dataTablesParameters: any, callback) => {
        if(dataTablesParameters.order[0].column == 0)
        {
          dataTablesParameters.order[0].column = 'id';
          dataTablesParameters.order[0].dir = 'desc';
        }
        if(dataTablesParameters.order[0].column == 1)
        {
          dataTablesParameters.order[0].column = 'mainCat';
        }
        if(dataTablesParameters.order[0].column == 2)
        {
          dataTablesParameters.order[0].column = 'title_en';
        }
	if(dataTablesParameters.order[0].column == 3)
        {
          dataTablesParameters.order[0].column = 'subTitle_en';
        }
        if(dataTablesParameters.order[0].column == 4)
        {
          dataTablesParameters.order[0].column = 'title_ur';
        }
	if(dataTablesParameters.order[0].column == 5)
        {
          dataTablesParameters.order[0].column = 'subTitle_ur';
        }
        if(dataTablesParameters.order[0].column == 6)
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


      this.subCategoryService.getSubCategoryData(dataTablesParameters.length, dataTablesParameters.start,dataTablesParameters.search.value,dataTablesParameters.order[0].column,dataTablesParameters.order[0].dir).subscribe((res: any) => {

            this.subCategories = res.body.data.subcategories;
            this.objectLength = Object.keys(this.subCategories).length != 0;
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
            return this.router.navigateByUrl('/pages/sub-categories');
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
  addSubCategory() {
    const addmodalRef = this.modalService.open(AddSubCategoriesComponent, { size: 'lg' });
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
  editSubCategory(formData: any) {
    const modalRef = this.modalService.open(EditSubCategoriesComponent, { size: 'lg' });
    modalRef.componentInstance.subcategoriesData = formData;

    modalRef.result.then((result) => {
      if (result) {
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
  deleteSubCategory(id) {

    const modelConfirmation = this.modalService.open(ModalComponent);

    modelConfirmation.result.then((result) => {
      if (result[0] != 'undefined' && result[0] == true) {
        this.subCategoryService.onDeleteSubCategory(id).subscribe((res: any) => {
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
          })
      }
    });
  }


  /**
   * Function -- onSubCategoryStatusChange()
   * Use - This function is used to change status
   * @param statusValue
   * @param id
   */
  onSubCategoryStatusChange(statusValue,id) {

  let status = {
    action: statusValue
  }

  this.subCategoryService.updateSubCategoryStatus(status, id).subscribe((res: any) => {
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

