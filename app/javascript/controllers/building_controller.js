import { Controller } from "@hotwired/stimulus";
import { get } from "@rails/request.js";

export default class extends Controller {
  static targets = ["unitSelect", "userSelect", "moveUnitSelect"];

  building_change(event) {
    let id = event.target.selectedOptions[0].value;
    let target = this.unitSelectTarget.id;

    get(`/building/units?target=${target}&bid=${id}`, {
      responseKind: "turbo-stream",
    });
  }

  multiple_change(event) {
    let id = event.target.selectedOptions[0].value;
    let target1 = this.unitSelectTarget.id;
    let target2 = this.moveUnitSelectTarget.id;

    get(`/building/units?target1=${target1}&target2=${target2}&bid=${id}`, {
      responseKind: "turbo-stream",
    });
  }

  unit_change(event) {
    let id = event.target.selectedOptions[0].value;
    let target = this.userSelectTarget.id;

    get(`/unit/users?target=${target}&bid=${id}`, {
      responseKind: "turbo-stream",
    });
  }

  building_user(event) {
    let id = event.target.selectedOptions[0].value;
    let target = this.userSelectTarget.id;

    get(`/building/users?target=${target}&bid=${id}`, {
      responseKind: "turbo-stream",
    });
  }
}
