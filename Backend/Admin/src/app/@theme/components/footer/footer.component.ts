import { Component } from '@angular/core';

@Component({
  selector: 'ngx-footer',
  styleUrls: ['./footer.component.scss'],
  template: `
    <span class="created-by"><b>&copy;<a href="#" target="_blank">RedBull PWA App</a></b> {{yearForCopyRight}}</span>
  `,
})
export class FooterComponent {

  dateForCopyRight:any;
  yearForCopyRight:any;

  constructor() {
    this.dateForCopyRight = new Date();
    this.yearForCopyRight = this.dateForCopyRight.getFullYear();
  }
}
