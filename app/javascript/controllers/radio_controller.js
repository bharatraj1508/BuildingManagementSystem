import { Controller } from "@hotwired/stimulus";
import { get } from "@rails/request.js";

export default class extends Controller {
  static targets = ["showUnit"];

  show_unit(event) {
    const isResident = this.element.querySelector(".resident").checked;
    if (isResident) {
      this.showUnitTarget.classList.remove("hidden");
    } else {
      this.showUnitTarget.classList.add("hidden");
    }
  }
}
