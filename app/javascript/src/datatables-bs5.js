import '../src/jquery.js'
import 'jszip'
import 'pdfmake'
import DataTable from 'datatables.net-bs5'
window.DataTable = DataTable()

import buttons from 'datatables.net-buttons-bs5'
buttons(window, $)

import columnVisibility from 'datatables.net-buttons/js/buttons.colVis.js'
columnVisibility(window, $)

import buttonsHtml5 from 'datatables.net-buttons/js/buttons.html5.js'
buttonsHtml5(window, $)

import buttonsPrint from 'datatables.net-buttons/js/buttons.print.js'
buttonsPrint(window, $)
