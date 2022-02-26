import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="remove"
export default class extends Controller {
  remove() {
    console.log("remove#remove")
    this.element.remove()
  }
}
