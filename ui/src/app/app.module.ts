import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { AppGridComponent } from './app-grid/app-grid.component';
import {StatusbarComponent} from './statusbar/statusbar.component';

@NgModule({
  declarations: [
    AppComponent,
    AppGridComponent,
    StatusbarComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
