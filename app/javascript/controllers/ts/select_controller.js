import { Controller } from "@hotwired/stimulus"
// import TomSelect from "tom-select"
import TomSelect from 'tom-select/dist/js/tom-select.complete.js';


// Connects to data-controller="select"
export default class extends Controller {
  connect() {
    // set basic options
    let options = {
      create: false,
      allowEmptyOption: true,
      closeAfterSelect: true, 
      sortField: {
        field: "text",
        direction: "asc"
      },
      plugins: ['clear_button']
    }

    new TomSelect(this.element, options)
  }
}
