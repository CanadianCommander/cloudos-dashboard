import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.sass']
})
export class AppComponent {
  statusBarPosition  = STATUS_BAR_POSITION.LEFT;
  statusBarPositions = STATUS_BAR_POSITION;
}

enum STATUS_BAR_POSITION {
  LEFT,
  RIGHT,
}
