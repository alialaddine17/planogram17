import { Component, OnInit, ViewChild } from '@angular/core';
import { DataTableDirective } from 'angular-datatables';
import { Subject } from 'rxjs';
import { NgbActiveModal, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { NbToastrService } from '@nebular/theme';
import { AnnouncementService } from './announcement.service';
import { HttpErrorResponse } from '@angular/common/http';
import { AddannouncementComponent } from './addannouncement/addannouncement.component';
import { EditannouncementComponent } from './editannouncement/editannouncement.component';
import { ModalComponent } from '../bootstrap/modals/modal/modal.component';

@Component({
  selector: 'ngx-announcement',
  templateUrl: './announcement.component.html'
})
export class AnnouncementComponent implements OnInit {

  items: any = [];
  @ViewChild(DataTableDirective, { static: false })
  dtElement: DataTableDirective;
  dtOptions: DataTables.Settings = {};
  announcementData: any = [];
  dtTrigger: Subject<any> = new Subject();
  limit: any;
  start: any;
  datatableTmpParams: any;
  objectLength: any;
  loading = false;

  constructor(private announcementService: AnnouncementService,
    private toastr: NbToastrService,
    private modalService: NgbModal,
    public activeModal: NgbActiveModal) { }

  ngOnInit() {
    this.getAnnouncementList();
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
    getAnnouncementList() {
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
      columnDefs: [{ orderable: false, targets: [3]},{ orderable: false, targets: [5]},{ orderable: false, targets: [6]}]
    };

    this.dtOptions.ajax = (dataTablesParameters: any, callback) => {
      if (dataTablesParameters.order[0].column == 0) {
        dataTablesParameters.order[0].column = 'id';
        dataTablesParameters.order[0].dir = 'asc';
      }
      if (dataTablesParameters.order[0].column == 1) {
        dataTablesParameters.order[0].column = 'anouncementTitle_en';
      }
      if (dataTablesParameters.order[0].column == 2) {
        dataTablesParameters.order[0].column = 'anouncementTitle_ur';
      }
      if (dataTablesParameters.order[0].column == 3) {
        dataTablesParameters.order[0].column = 'anouncementImg';
      }
      /* if (dataTablesParameters.order[0].column == 4) {
        dataTablesParameters.order[0].column = 'description_en';
      }
      if (dataTablesParameters.order[0].column == 5) {
        dataTablesParameters.order[0].column = 'description_ur';
      } */
      if (dataTablesParameters.order[0].column == 4) {
        dataTablesParameters.order[0].column = 'created_at';
      }

      this.announcementService.getAnnouncementList(dataTablesParameters.length, dataTablesParameters.start, dataTablesParameters.search.value, dataTablesParameters.order[0].column, dataTablesParameters.order[0].dir).subscribe(resp => {
        this.announcementData = resp.body.data.anouncement;
        this.objectLength = Object.keys(this.announcementData).length != 0;
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
  addAnnouncement() {
    const addmodalRef = this.modalService.open(AddannouncementComponent, { size: 'lg' });
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
  editAnnouncement(formData: any) {
    const modalRef = this.modalService.open(EditannouncementComponent, { size: 'lg' });
    modalRef.componentInstance.announcementData = formData;

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
  deleteAnnouncement(id) {

    const modelConfirmation = this.modalService.open(ModalComponent);

    modelConfirmation.result.then((result) => {
      if (result[0] != 'undefined' && result[0] == true) {
        this.announcementService.onDeleteAnnouncement(id).subscribe((res: any) => {
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
   * Function -- updateStatusForAnnouncement()
   * Use - This function is used to change status
   * @param statusValue
   * @param id
   */
  updateStatusForAnnouncement(statusValue, id) {

    let status = {
      action: statusValue
    }

    this.announcementService.updateStatusForAnnouncement(status, id).subscribe((res: any) => {
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


}
