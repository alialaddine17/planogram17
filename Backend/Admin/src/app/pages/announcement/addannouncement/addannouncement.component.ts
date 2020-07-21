import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { NbToastrService } from '@nebular/theme';
import { Router } from '@angular/router';
import { AnnouncementService } from '../announcement.service';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { HttpErrorResponse } from '@angular/common/http';

@Component({
  selector: 'ngx-addannouncement',
  templateUrl: './addannouncement.component.html'
})
export class AddannouncementComponent implements OnInit {

  addAnnouncementForm: FormGroup;
  announcementData: any = {};
  redirectDelay = 5;
  ckeConfig: any;

  constructor(public activeModal: NgbActiveModal,
    public fb: FormBuilder,
    public announcementService: AnnouncementService,
    public router: Router,
    private toastr: NbToastrService) { }

  ngOnInit() {

     //Ck Editor Configuration
     this.ckeConfig = {
      allowedContent: false,
      extraPlugins: 'divarea',
      forcePasteAsPlainText: true,
      removeButtons:'Image,Cut,Copy,Paste,PasteText,PasteFromWord,Source,Undo,Redo,Scayt,SpecialChar,Strike,Subscript,Superscript,RemoveFormat,Anchor,About'
    };

    //Initiate Add VIP Category Form
    this.addAnnouncementForm = this.fb.group({
      anouncementTitle_en: ['', Validators.required],
      anouncementTitle_ur: ['', Validators.required],
      description_en:['',Validators.required],
      description_ur:['',Validators.required],
      anouncementImg:[null],
      pdf:[null],
      anouncement_pdf_url:['']
    });
  }

  //Validation for Required fields.
  get anouncementTitle_en() { return this.addAnnouncementForm.get('anouncementTitle_en'); }
  get anouncementTitle_ur() { return this.addAnnouncementForm.get('anouncementTitle_ur'); }
  get description_en() { return this.addAnnouncementForm.get('description_en'); }
  get description_ur() { return this.addAnnouncementForm.get('description_ur'); }

  /**
   * Function -- uploadFile
   * Use -- This function is used to upload images.
   * @param event
   */
  uploadFile(event) {
    const file = (event.target as HTMLInputElement).files[0];
    this.addAnnouncementForm.patchValue({
      anouncementImg: file
    });
    this.addAnnouncementForm.get('anouncementImg').updateValueAndValidity();
  }


  /**
   * Function -- uploadPdf
   * Use -- This function is used to upload images.
   * @param event
   */
  uploadPdf(event)
  {
    const file = (event.target as HTMLInputElement).files[0];
    this.addAnnouncementForm.patchValue({
      pdf: file
    });
    this.addAnnouncementForm.get('pdf').updateValueAndValidity();
  }

  /**
   * Function -- onAddAnnouncement
   * Use -- This function will triggered when user submit the form.
   */
  onAddAnnouncement() {

    if(this.addAnnouncementForm.get('anouncementImg').value == null)
    {
      this.toastr.warning('Please Upload Announcement Image','Warning');
      return;
    }

    let formData: FormData = new FormData();
    formData.append("anouncementTitle_en", this.addAnnouncementForm.get('anouncementTitle_en').value);
    formData.append("anouncementTitle_ur", this.addAnnouncementForm.get('anouncementTitle_ur').value);
    formData.append("description_en", this.addAnnouncementForm.get('description_en').value);
    formData.append("description_ur", this.addAnnouncementForm.get('description_ur').value);
    formData.append("anouncementImg", this.addAnnouncementForm.get('anouncementImg').value);
    formData.append("pdf", this.addAnnouncementForm.get('pdf').value);
    formData.append("anouncement_pdf_url", this.addAnnouncementForm.get('anouncement_pdf_url').value);
    this.announcementService.onAddAnnouncement(formData).subscribe((res: any) => {
        if(res.status == '200')
        {
          this.announcementData.message = res.body.message;
          this.activeModal.close(this.announcementData);
        }
    },
      (err: HttpErrorResponse) => {
        if (err.status == 401) {
          setTimeout(() => {
            this.activeModal.close();
            this.toastr.danger(err.error.message,'Error');
            return this.router.navigateByUrl('/pages/announcement');
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

