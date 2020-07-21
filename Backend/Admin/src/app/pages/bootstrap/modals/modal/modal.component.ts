import { Component } from '@angular/core';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'ngx-modal',
  template: `
    <div class="modal-header">
      <span>{{ modalHeader }}</span>
      <button class="close" aria-label="Close" (click)="closeModal(false)">
        <span aria-hidden="true">&times;</span>
      </button>
    </div>
    <div class="modal-body">
      {{ modalContent }}
    </div>
    <div class="modal-footer">
    <button class="pointerClass" nbButton status="default" (click)="OkModal(true)" title="Ok">Ok</button> &nbsp; &nbsp;
    <button class="pointerClass" nbButton status="danger" (click)="closeModal(false)" title="Cancel">Cancel</button>
    </div>
  `,
})
export class ModalComponent {

  modalHeader: string = 'Confirmation';
  modalContent = `Are you sure you want to delete the data?`;
  mydata: any = [];

  constructor(private activeModal: NgbActiveModal) { }

  closeModal(status) {
    this.mydata.push(status);
    this.activeModal.close(this.mydata);
  }

  OkModal(status)
  {
    this.mydata.push(status);
    this.activeModal.close(this.mydata);
  }
}
