import { RouterModule, Routes } from '@angular/router';
import { NgModule } from '@angular/core';

import { PagesComponent } from './pages.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { NotFoundComponent } from './miscellaneous/not-found/not-found.component';
import { AuthGuard } from '../_guards';
import { CategoriesComponent } from './categories/categories.component';
import { SubCategoriesComponent } from './sub-categories/sub-categories.component';
import { ChangePasswordComponent } from './change-password/change-password.component';
import { EditprofileComponent } from './editprofile/editprofile.component';
import { ProductsComponent } from './products/products.component';
import { VipcategoryComponent } from './vipcategory/vipcategory.component';
import { AnnouncementComponent } from './announcement/announcement.component';
import { VipdetailsComponent } from './vipdetails/vipdetails.component';
import { VipsettingsComponent } from './vipsettings/vipsettings.component';
import { SettingComponent } from './setting/setting.component';


const routes: Routes = [{
  path: '',
  canActivate: [AuthGuard],
  component: PagesComponent,
  children: [
    {
      path: 'dashboard',
      component: DashboardComponent,
    },
    {
      path:'change_password',
      component:ChangePasswordComponent
    },
    {
      path: 'editprofile',
      component: EditprofileComponent,
    },
    {
      path: 'categories',
      component : CategoriesComponent
    },
    {
      path: 'sub-categories',
      component : SubCategoriesComponent
    },
    {
      path: 'products',
      component : ProductsComponent
    },
    {
      path: 'vipcategory',
      component : VipcategoryComponent
    },
    {
      path: 'vipdetails',
      component : VipdetailsComponent
    },
    {
      path: 'vipsettings',
      component :VipsettingsComponent
    },
    {
      path: 'announcement',
      component : AnnouncementComponent
    },
    {
      path: 'setting',
      component : SettingComponent
    },
    {
      path: '',
      redirectTo: 'dashboard',
      pathMatch: 'full',
    },
    {
      path: '**',
      component: NotFoundComponent,
    },
  ],
}];


@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class PagesRoutingModule {
}
