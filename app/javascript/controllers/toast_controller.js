import { Controller } from "@hotwired/stimulus"
import { Toast } from "bootstrap/dist/js/bootstrap.esm.js"

// Connects to data-controller="toast"
export default class extends Controller {
  connect() {
    console.log("toast#connect")
    this.toast = new bootstrap.Toast(this.element)
    this.toast.show()
  }
}
