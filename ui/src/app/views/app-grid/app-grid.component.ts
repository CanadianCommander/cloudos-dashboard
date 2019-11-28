import { Component } from '@angular/core';
import {ProgramsService} from "../../service/programs/programs.service";
import {Program} from "../../model/programs/program";
import {MatIconRegistry} from "@angular/material";
import {DomSanitizer} from "@angular/platform-browser";

@Component({
  selector: 'app-grid',
  templateUrl: './app-grid.component.html',
  styleUrls: ['./app-grid.component.sass']
})
export class AppGridComponent {

  programs: Program[] = [];

  constructor (private programsService: ProgramsService,
               private matIconReg: MatIconRegistry,
               private domSanitizer: DomSanitizer) {

    this.loadIconSet();

    programsService.getAllPrograms().subscribe(
      result => {
        //success
        (<any>result).data.forEach( progData => {
          this.programs.push(new Program(progData.id, progData.name, progData.icon_path));
        });

      },
      err => {
        //error
        console.error("Failed to fetch program list with error: " + err.toString());
      }
    )
  }

  loadIconSet() {
    //default app icon
    this.matIconReg.addSvgIcon('app_default_icon',
      this.domSanitizer.bypassSecurityTrustResourceUrl('assets/img/app_default_icon.svg'));
  }

  appClicked(app: Program) {
    console.log(app)
  }

}
