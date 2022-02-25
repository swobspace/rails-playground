import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  // auto-open modal on connect
  connect() {
    // console.log("modal#connect")
    this.modal = new bootstrap.Modal(this.element)
    this.modal.show()
  }

  disconnect() {
    // console.log("modal#disconnect")
    this.close()
  }

  close() {
    // console.log("modal#close")
    // close modal element
    this.modal.hide()
  }

  /* close the modal form only if submission is successful
     catch turbo:submit-end via action 
     (don't include the controller here, modal controller is always
      included via sharedModal)

     <%= form_for(@mymodel,
         data: { action: "turbo:submit-end->modal#handleSubmit" }) do |f| %>
   */

  handleSubmit = (event) => {
    // console.log("modal#handleSubmit")
    // close modal if form submission is successful
    if (event.detail.success) {
      this.close()
    }
  }

}
