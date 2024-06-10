import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="deselectable-radio-buttons"
export default class extends Controller {
  connect() {
    this.element.querySelectorAll('input[type="radio"]').forEach(radio => {
      radio.addEventListener('click', this.toggleCheck);
    })
  }

  toggleCheck(event) {
    const radio = event.currentTarget
    if (radio.checked) {
      radio.checked = !radio.checked;
    }
}
