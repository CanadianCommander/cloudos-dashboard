import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { AppGridComponent } from './views/app-grid/app-grid.component';
import {AppStatusbarComponent} from './statusbar/app-statusbar.component';
import {BrowserAnimationsModule} from "@angular/platform-browser/animations";
import {MatIconModule, MatSidenavModule} from "@angular/material";
import {HttpClientModule} from "@angular/common/http";
import { AppIconComponent } from './common/app-icon/app-icon.component';

@NgModule({
  declarations: [
    AppComponent,
    AppGridComponent,
    AppStatusbarComponent,
    AppIconComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,

    // material cdk
    BrowserAnimationsModule,
    MatSidenavModule,
    MatIconModule,
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
