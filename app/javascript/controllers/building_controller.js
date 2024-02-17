import { Controller } from "@hotwired/stimulus";
import { get } from "@rails/request.js";

export default class extends Controller {
  static targets = ["unitSelect"];

  change(event) {
    let id = event.target.selectedOptions[0].value;
    let target = this.unitSelectTarget.id;

    get(`/building/units?target=${target}&bid=${id}`, {
      responseKind: "turbo-stream",
    });
  }
}
