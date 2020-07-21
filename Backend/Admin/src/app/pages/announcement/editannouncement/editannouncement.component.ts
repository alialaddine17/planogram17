import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { NbToastrService } from '@nebular/theme';
import { Router } from '@angular/router';
import { AnnouncementService } from '../announcement.service';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { HttpErrorResponse } from '@angular/common/http';

@Component({
  selector: 'ngx-editannouncement',
  templateUrl: './editannouncement.component.html'
})
export class EditannouncementComponent implements OnInit {
  editAnnouncementForm: FormGroup;
  announcementData:any = {}
  redirectDelay = 5;
  ckeConfig: any;
  changeAnnouncementImg:boolean = false;
  oldAnnouncementImg:any;
  oldAnnouncementPdf:any;
  changePdf:boolean = false;

  constructor(public activeModal: NgbActiveModal,
    public fb: FormBuilder,
    public announcementService: AnnouncementService,
    public router: Router,
    private toastr: NbToastrService) { }

  ngOnInit() {

    this.oldAnnouncementImg = this.announcementData.anouncementImg.substring(this.announcementData.anouncementImg.lastIndexOf('/') + 1);
    this.oldAnnouncementPdf = this.announcementData.pdf.substring(this.announcementData.pdf.lastIndexOf('/') + 1);

    //Ck Editor Configuration
    this.ckeConfig = {
      allowedContent: false,
      extraPlugins: 'divarea',
      forcePasteAsPlainText: true,
      removeButtons:'Image,Cut,Copy,Paste,PasteText,PasteFromWord,Source,Undo,Redo,Scayt,SpecialChar,Strike,Subscript,Superscript,RemoveFormat,Anchor,About'
    };

    //Initiate Add VIP Category Form
    this.editAnnouncementForm = this.fb.group({
      anouncementTitle_en: ['', Validators.required],
      anouncementTitle_ur: ['', Validators.required],
      description_en:['',Validators.required],
      description_ur:['',Validators.required],
      anouncementImg:[null],
      pdf:[null],
      anouncement_pdf_url:['']
    });
  }


   /**
   * Function -- uploadFile
   * Use -- This function is used to upload images.
   * @param event
   */
  uploadFile(event) {
    if(event.type == 'change')
    {
      this.changeAnnouncementImg = true;
    }
    else
    {
      this.changeAnnouncementImg = false;
    }
    const file = (event.target as HTMLInputElement).files[0];
    this.editAnnouncementForm.patchValue({
      anouncementImg: file
    });
    this.editAnnouncementForm.get('anouncementImg').updateValueAndValidity();
  }


  /**
   * Function -- uploadFile
   * Use -- This function is used to upload images.
   * @param event
   */
  uploadPdf(event) {
    if(event.type == 'change')
    {
      this.changePdf = true;
    }
    else
    {
      this.changePdf = false;
    }
    const file = (event.target as HTMLInputElement).files[0];
    this.editAnnouncementForm.patchValue({
      pdf: file
    });
    this.editAnnouncementForm.get('pdf').updateValueAndValidity();
  }


  /**
   * Function -- onAddAnnouncement
   * Use -- This function will triggered when user submit the form.
   */
  onEditAnnouncement() {
    let formData: FormData = new FormData();
    formData.append("anouncementTitle_en", this.editAnnouncementForm.get('anouncementTitle_en').value);
    formData.append("anouncementTitle_ur", this.editAnnouncementForm.get('anouncementTitle_ur').value);
    formData.append("description_en", this.editAnnouncementForm.get('description_en').value);
    formData.append("description_ur", this.editAnnouncementForm.get('description_ur').value);
    formData.append("anouncement_pdf_url", this.editAnnouncementForm.get('anouncement_pdf_url').value);
    if(this.changeAnnouncementImg == true)
    {
      formData.append("anouncementImg", this.editAnnouncementForm.get('anouncementImg').value);
    }
    else
    {
      formData.append("oldAnnouncementImg", this.oldAnnouncementImg);
    }
    if(this.changePdf == true)
    {
      formData.append("pdf", this.editAnnouncementForm.get('pdf').value);
    }
    else
    {
      formData.append("oldAnnouncementPdf", this.oldAnnouncementPdf);
    }
    this.announcementService.onUpdateAnnouncement(formData,this.announcementData.id).subscribe((res: any) => {
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
