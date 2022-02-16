import { Controller } from "@hotwired/stimulus"
import { Sortable } from '@shopify/draggable';

export default class extends Controller {
  static targets = ['item']
  static values = {
    url: String
  }

  connect() {
    console.log("sortable connected")
    baseurl = this.urlValue
    console.log(baseurl)
    if (this.hasItemTarget) {
      console.log(this.itemTarget)
      this.itemTargets.forEach(item => {
        item.setAttribute('style', 'z-index: 1000;')
      })

      const sortable = new Sortable(this.element, {
        draggable: '.list-group-item',
        distance: 5,
        mirror: {
          constrainDimensions: true
        }
      })
      sortable.on('sortable:start', function(event) {
        let task = event.dragEvent.source
        task.setAttribute('style', 'z-index: 1000; background-color: #FFFFAB;')
      })
      sortable.on('sortable:stop', function(event) {
        let item = event.dragEvent.source
        let newIndex = event.data.newIndex
        console.log(event)
        console.log(newIndex)
      })
    }
  }

}
