import {Component, Input, OnInit, Output} from '@angular/core';
import {EventEmitter} from "@angular/core";

@Component({
  selector: 'app-icon',
  templateUrl: './app-icon.component.html',
  styleUrls: ['./app-icon.component.sass']
})
export class AppIconComponent implements OnInit {

  @Input("card-text")
  cardText: String = "";

  @Input("card-icon")
  iconName: String = "";

  @Input("card-size")
  cardSizeClass: String = "icon-md";

  @Output("onClick")
  clickedEvent: EventEmitter<null> = new EventEmitter();

  constructor() {
  }

  ngOnInit() {
  }

  onClick() {
    this.clickedEvent.emit(null);
  }
}
