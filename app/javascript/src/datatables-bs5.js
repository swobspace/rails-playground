import '../src/jquery.js'

// used for Excel button, CSV button doesn't need it
import JSZip from 'jszip'
window.JSZip = JSZip

// used for PDF button
import pdfMake from "pdfmake/build/pdfmake";
import pdfFonts from "pdfmake/build/vfs_fonts";
pdfMake.vfs = pdfFonts.pdfMake.vfs;

require('datatables.net-bs5')();
require('datatables.net-buttons-bs5')();
require('datatables.net-buttons/js/buttons.colVis.js' )();
require('datatables.net-buttons/js/buttons.html5.js' )();
require('datatables.net-buttons/js/buttons.print.js' )();
