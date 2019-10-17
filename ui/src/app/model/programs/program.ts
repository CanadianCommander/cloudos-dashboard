
export class Program {

  private _id: Number;
  private _displayName: String;
  private _iconUrl: String;

  constructor (id, displayName, iconUrl)
  {
    this._id = id;
    this._displayName = displayName;
    this._iconUrl = iconUrl;
  }

  get id(): Number {
    return this._id;
  }

  set id(value: Number) {
    this._id = value;
  }

  get displayName(): String {
    return this._displayName;
  }

  set displayName(value: String) {
    this._displayName = value;
  }

  get iconUrl(): String {
    return this._iconUrl;
  }

  set iconUrl(value: String) {
    this._iconUrl = value;
  }
}
