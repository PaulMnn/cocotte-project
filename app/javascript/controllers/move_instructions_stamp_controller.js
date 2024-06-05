import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="move-instructions-stamp"
export default class extends Controller {
  static targets = ["content"]

  connect() {
    console.log("hello from stimulus")
  }

  moveCard() {
    console.log("hello")
    this.contentTarget.classList.toggle("expanded")
}
}
