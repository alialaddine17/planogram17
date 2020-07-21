import { Component, OnInit, ViewChild } from '@angular/core';
import { DataTableDirective } from 'angular-datatables';
import { Subject } from 'rxjs';
import { NgbActiveModal, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { VipdetailsserviceService } from './vipdetailsservice.service';
import { NbToastrService } from '@nebular/theme';
import { HttpErrorResponse } from '@angular/common/http';
import { AddvipdetailsComponent } from './addvipdetails/addvipdetails.component';
import { EditvipdetailsComponent } from './editvipdetails/editvipdetails.component';
import { ModalComponent } from '../bootstrap/modals/modal/modal.component';
import { VipserviceService } from '../vipcategory/vipservice.service';

@Component({
  selector: 'ngx-vipdetails',
  templateUrl: './vipdetails.component.html'
})
export class VipdetailsComponent implements OnInit {

  items: any = [];
  @ViewChild(DataTableDirective, { static: false })
  dtElement: DataTableDirective;
  dtOptions: DataTables.Settings = {};
  vipDetails: any = [];
  dtTrigger: Subject<any> = new Subject();
  limit: any;
  start: any;
  datatableTmpParams: any;
  objectLength: any;
  loading = false;
  vipId:any = '';
  vipCategoryData:any = [];

  constructor(private vipDetailService:VipdetailsserviceService,
    private toastr: NbToastrService,
    private modalService: NgbModal,
    public activeModal: NgbActiveModal,
    private vipService:VipserviceService) { }

  ngOnInit() {

    //Api call for subcategory parent id dropdown
    this.vipDetailService.vipCategoryDropdown().subscribe((res: any) => {
      if(res.status == '200')
      {
        this.vipCategoryData = res.body.data.vipCategories;
      }
    });

    this.getVipDetailsList();
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
    getVipDetailsList() {
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
        columnDefs: [{ orderable: false, targets: [5]}]
      };

      this.dtOptions.ajax = (dataTablesParameters: any, callback) => {
        if (dataTablesParameters.order[0].column == 0) {
          dataTablesParameters.order[0].column = 'id';
          dataTablesParameters.order[0].dir = 'asc';
        }
        if (dataTablesParameters.order[0].column == 1) {
          dataTablesParameters.order[0].column = 'subTitle_en';
        }
        if (dataTablesParameters.order[0].column == 2) {
          dataTablesParameters.order[0].column = 'subTitle_ur';
        }
        if (dataTablesParameters.order[0].column == 3) {
          dataTablesParameters.order[0].column = 'detailTitle_en';
        }
        if (dataTablesParameters.order[0].column == 4) {
          dataTablesParameters.order[0].column = 'detailTitle_ur';
        }
        if (dataTablesParameters.order[0].column == 5) {
          dataTablesParameters.order[0].column = 'vipImg';
        }
        if (dataTablesParameters.order[0].column == 6) {
          dataTablesParameters.order[0].column = 'createdAt';
        }

        this.vipDetailService.getVipDetailsData(dataTablesParameters.length, dataTablesParameters.start, dataTablesParameters.search.value, dataTablesParameters.order[0].column, dataTablesParameters.order[0].dir,this.vipId).subscribe(resp => {
          this.vipDetails = resp.body.data.vipDetailCategories;
          this.objectLength = Object.keys(this.vipDetails).length != 0;
          this.datatableTmpParams = dataTablesParameters;
          this.loading = false;


          callback({
            recordsTotal: (resp.body.data.recordsTotal == undefined) ? 0 : resp.body.data.recordsTotal,
            recordsFiltered: (resp.body.data.recordsTotal == undefined) ? 0 : resp.body.data.recordsTotal,
            data: []
          });
        },
          (err: HttpErrorResponse) => {
            if (err.status == 401) {
              setTimeout(() => {
                this.toastr.danger(err.error.message, 'Error');
                this.loading = false
              });
            }
            else {
              this.loading = false;
              this.toastr.danger(err.error.message, 'Error');
            }
          });
      };
    }


    /**
     * Developed By : Weblineindia
     * Function : Create
     * Purpose : Call Create API,push data into array and redirect to the listing page
     */
    addVipDetails() {
      const addmodalRef = this.modalService.open(AddvipdetailsComponent, { size: 'lg' });
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
    editVipDetails(formData: any) {
      const modalRef = this.modalService.open(EditvipdetailsComponent, { size: 'lg' });
      modalRef.componentInstance.vipDetailsData = formData;

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
    deleteVipDetails(id) {
      const modelConfirmation = this.modalService.open(ModalComponent);
      modelConfirmation.result.then((result) => {
        if (result[0] != 'undefined' && result[0] == true) {
          this.vipService.onDeleteVipCategory(id,'vip_detail').subscribe((res: any) => {
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
     * Function -- updateVipCategoryStatus()
     * Use - This function is used to change status
     * @param statusValue
     * @param id
     */
    updateVipDetailsStatus(statusValue,id) {

    let status = {
      action: statusValue
    }

    this.vipService.updateVipCategoryStatus(status, id,'vip_detail').subscribe((res: any) => {
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
    this.vipId = '';
    this.rerender();

  }


  selectionChangedForVipCategory(event)
  {
    this.vipId = event.target.value;
  }
}

