import { NgModule } from '@angular/core';

import { ThemeModule } from '../../@theme/theme.module';

import { BootstrapRoutingModule } from './bootstrap-routing.module';
import { ModalsComponent } from './modals/modals.component';
import { ModalComponent } from './modals/modal/modal.component';
import { BootstrapComponent } from './bootstrap.component';
import { NbCardModule } from '@nebular/theme';

const COMPONENTS = [
  BootstrapComponent,
  ModalsComponent,
];

const ENTRY_COMPONENTS = [
  ModalComponent,
];

@NgModule({
  imports: [
    ThemeModule,
    NbCardModule,
    BootstrapRoutingModule,
  ],
  declarations: [
    ...COMPONENTS,
  ],
  entryComponents: [
    ...ENTRY_COMPONENTS,
  ],
})
export class BootstrapModule { }
