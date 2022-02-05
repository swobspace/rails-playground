import '../src/jquery.js'

// used for Excel button, CSV button doesn't need it
import JSZip from 'jszip'
window.JSZip = JSZip

// used for PDF button
import pdfMake from "pdfmake/build/pdfmake";
import pdfFonts from "pdfmake/build/vfs_fonts";
pdfMake.vfs = pdfFonts.pdfMake.vfs;


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
