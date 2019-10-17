import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";

@Injectable({
  providedIn: 'root'
})
export class ProgramsService {

  private PROGRAM_API_BASE: String = '/api/programs';

  constructor(private http: HttpClient) { }

  getAllPrograms()
  {
    return this.http.get(this.PROGRAM_API_BASE + "/list")
  }
}
