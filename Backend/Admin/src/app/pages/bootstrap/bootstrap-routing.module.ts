import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { BootstrapComponent } from './bootstrap.component';
import { ModalsComponent } from './modals/modals.component';


const routes: Routes = [{
  path: '',
  component: BootstrapComponent,
  children: [
    {
      path: 'modal',
      component: ModalsComponent,
    },
  ],
}];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class BootstrapRoutingModule { }
