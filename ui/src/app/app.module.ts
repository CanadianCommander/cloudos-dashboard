import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { AppGridComponent } from './app-grid/app-grid.component';
import {StatusbarComponent} from './statusbar/statusbar.component';
import {BrowserAnimationsModule} from "@angular/platform-browser/animations";
import {MatSidenavModule} from "@angular/material";

@NgModule({
  declarations: [
    AppComponent,
    AppGridComponent,
    StatusbarComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,

    // material cdk
    BrowserAnimationsModule,
    MatSidenavModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
