import {Component, OnInit, ViewChild} from '@angular/core';
import {MatIconRegistry, MatSidenav} from "@angular/material";
import {DomSanitizer} from "@angular/platform-browser";

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.sass']
})
export class AppComponent
{

  @ViewChild('sidenav', {static: true})
  sideNav: MatSidenav;

  constructor(matIcoReg: MatIconRegistry, domSanitizer: DomSanitizer){
    matIcoReg.addSvgIcon('arrow_right',
      domSanitizer.bypassSecurityTrustResourceUrl('assets/img/arrow_right.svg'));
  }

  handleKeyDown(event) {
    switch (event.key) {
      case 'Escape':
        this.sideNav.close();
        break;
      case '`':
        this.sideNav.toggle();
        break;
    }
  }

}
