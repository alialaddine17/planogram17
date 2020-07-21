import { NgModule } from '@angular/core';
import { NbMenuModule, NbTabsetModule, NbCardModule, NbRouteTabsetModule, NbButtonModule, NbSpinnerModule, NbLayoutModule, NbSelectModule, NbDatepickerModule,NbCheckboxModule,NbRadioModule } from '@nebular/theme';

import { ThemeModule } from '../@theme/theme.module';
import { PagesComponent } from './pages.component';
//import { DashboardModule } from './dashboard/dashboard.module';
import { PagesRoutingModule } from './pages-routing.module';
import { MiscellaneousModule } from './miscellaneous/miscellaneous.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { Ng2SmartTableModule } from 'ng2-smart-table';

import { CategoriesComponent } from './categories/categories.component';
import { SubCategoriesComponent } from './sub-categories/sub-categories.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { ModalOverlaysModule } from './modal-overlays/modal-overlays.module';
import { ModalComponent } from './bootstrap/modals/modal/modal.component';
import { AddCategoriesComponent } from './categories/addcategories/addcategories.component';
import { EditCategoriesComponent } from './categories/editcategories/editcategories.component';
import { AddSubCategoriesComponent } from './sub-categories/addsub-categories/addsub-categories.component';
import { EditSubCategoriesComponent } from './sub-categories/editsub-categories/editsub-categories.component';
import { SelectDropDownModule } from 'ngx-select-dropdown';
import { CKEditorComponent } from './editors/ckeditor/ckeditor.component';
import { CKEditorModule } from 'ng2-ckeditor';
import { ChangePasswordComponent } from './change-password/change-password.component';
import { DataTablesModule } from 'angular-datatables';
import { EditprofileComponent } from './editprofile/editprofile.component';
import { ProductsComponent } from './products/products.component';
import { AddproductComponent } from './products/addproduct/addproduct.component';
import { EditproductComponent } from './products/editproduct/editproduct.component';
import { VipcategoryComponent } from './vipcategory/vipcategory.component';
import { AddvipcategoryComponent } from './vipcategory/addvipcategory/addvipcategory.component';
import { EditvipcategoryComponent } from './vipcategory/editvipcategory/editvipcategory.component';
import { AnnouncementComponent } from './announcement/announcement.component';
import { AddannouncementComponent } from './announcement/addannouncement/addannouncement.component';
import { EditannouncementComponent } from './announcement/editannouncement/editannouncement.component';
import { VipdetailsComponent } from './vipdetails/vipdetails.component';
import { AddvipdetailsComponent } from './vipdetails/addvipdetails/addvipdetails.component';
import { EditvipdetailsComponent } from './vipdetails/editvipdetails/editvipdetails.component';
import { VipsettingsComponent } from './vipsettings/vipsettings.component';
import { AddvipsettingsComponent } from './vipsettings/addvipsettings/addvipsettings.component';
import { EditvipsettingsComponent } from './vipsettings/editvipsettings/editvipsettings.component';
import { SettingComponent } from './setting/setting.component';


const PAGES_COMPONENTS = [
  PagesComponent,
];

@NgModule({
  imports: [
    FormsModule,
    PagesRoutingModule,
    ThemeModule,
    NbMenuModule,
    //DashboardModule,
    MiscellaneousModule,
    NbTabsetModule,
    NbCardModule,
    NbTabsetModule,
    NbRouteTabsetModule,
    ReactiveFormsModule.withConfig({ warnOnNgModelWithFormControl: 'never' }),
    NbButtonModule,
    Ng2SmartTableModule,
    NbSpinnerModule,
    NbLayoutModule,
    NbSelectModule,
    ModalOverlaysModule,
    NbDatepickerModule,
    SelectDropDownModule,
    CKEditorModule,
    NbCheckboxModule,
    NbRadioModule,
    DataTablesModule.forRoot()
  ],
  declarations: [
    ...PAGES_COMPONENTS,
    DashboardComponent,
    CategoriesComponent,
    AddCategoriesComponent,
    EditCategoriesComponent,
    SubCategoriesComponent,
    AddSubCategoriesComponent,
    EditSubCategoriesComponent,
    ModalComponent,
    CKEditorComponent,
    ChangePasswordComponent,
    EditprofileComponent,
    ProductsComponent,
    AddproductComponent,
    EditproductComponent,
    VipcategoryComponent,
    AddvipcategoryComponent,
    EditvipcategoryComponent,
    AnnouncementComponent,
    AddannouncementComponent,
    EditannouncementComponent,
    VipdetailsComponent,
    AddvipdetailsComponent,
    EditvipdetailsComponent,
    VipsettingsComponent,
    AddvipsettingsComponent,
    EditvipsettingsComponent,
    SettingComponent
  ],
  entryComponents: [
    ModalComponent,
    AddCategoriesComponent,
    EditCategoriesComponent,
    AddSubCategoriesComponent,
    EditSubCategoriesComponent,
    AddproductComponent,
    EditproductComponent,
    AddvipcategoryComponent,
    EditvipcategoryComponent,
    AddannouncementComponent,
    EditannouncementComponent,
    AddvipdetailsComponent,
    EditvipdetailsComponent,
    AddvipsettingsComponent,
    EditvipsettingsComponent
  ],
})
export class PagesModule {
}
