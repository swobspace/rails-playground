import { Controller } from "@hotwired/stimulus"

import '../src/datatables-bs5'

export default class extends Controller {

  initialize() {
    var myTable = $.fn.dataTable;
    $.extend( true, myTable.Buttons.defaults, {
      "dom": { "button": { "className": 'btn btn-outline-secondary btn-sm' } }
    })
  }

  connect() {
    let dtOptions = {}
    this.compileOptions(dtOptions)
    this.setInputFields()
    const table = $(this.element.querySelector('table'))

    // prepare options, optional add remote processing (not yet implemented)
    let dtable = $(table).DataTable(dtOptions)

    // process search input
    dtable.columns().eq(0).each((colIdx) => {
      $('input[name=idx'+colIdx+']').on( 'keyup change', function() {
	dtable.column(colIdx).search(this.value).draw()
      })
    })
  } // connect

  // search fields for each column
  setInputFields() {
    this.element.querySelectorAll("table tfoot th:not([class='nosearch'])")
        .forEach((th, idx) => {
          th.insertAdjacentHTML('afterbegin', this.searchField(idx))
        })
  }

  // single search input field
  searchField(idx) {
    return `<input type="text" placeholder="search" name="idx${idx}" />`
  }

  // datatables options
  compileOptions(options) {
    options.pagingType = "full_numbers"
    options.dom = "<'row'<'col'l><'col'B><'col'f>>" +
                    "<'row'<'col-sm-12'tr>>" +
                    "<'row'<'col'i><'col'p>>"
    options.stateSave = false
    options.lengthMenu = [ [10, 25, 100, 250, 1000], [10, 25, 100, 250, 1000] ]
    options.buttons = [ { "extend": 'copy',
	                  "exportOptions": {
	                    "columns": ':visible',
	                    "search": ':applied' } },
                        { "extend": 'csv',
	                  "exportOptions": { "search": ':applied' } },
                        { "extend": 'excel',
	                  "exportOptions": { "search": ':applied' } },
                        { "extend": 'pdf',
	                  "orientation": 'landscape',
	                  "pageSize": 'A4',
	                  "exportOptions": { "columns": ':visible',
	                                     "search": ':applied' } },
                        { "extend": 'print'},
                        { "extend": 'colvis', "columns": ':gt(0)' } ]
    options.columnDefs = [ { "targets": "nosort", "orderable": false },
                           { "targets": "notvisible", "visible": false } ]

  }
} // Controller
