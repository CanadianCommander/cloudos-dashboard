import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import {AppGridComponent} from './views/app-grid/app-grid.component';


const routes: Routes = [
  {
    path: '',
    component: AppGridComponent
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
