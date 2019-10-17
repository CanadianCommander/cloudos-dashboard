import { Component } from '@angular/core';
import {ProgramsService} from "../../service/programs/programs.service";
import {Program} from "../../model/programs/program";

@Component({
  selector: 'app-grid',
  templateUrl: './app-grid.component.html',
  styleUrls: ['./app-grid.component.sass']
})
export class AppGridComponent {

  programs: Program[] = [];

  constructor (private programsService: ProgramsService) {
    programsService.getAllPrograms().subscribe(
      result => {
        //success
        (<any>result).data.forEach( progData => {
          this.programs.push(new Program(progData.id, progData.name, progData.icon_path))
        })
      },
      err => {
        //error
        console.error("Failed to fetch program list with error: " + err.toString())
      }
    )
  }


}
