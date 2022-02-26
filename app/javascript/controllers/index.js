// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import DatatablesController from "./datatables_controller.js"
application.register("datatables", DatatablesController)

import HelloController from "./hello_controller.js"
application.register("hello", HelloController)

import ModalController from "./modal_controller.js"
application.register("modal", ModalController)

import RemoveController from "./remove_controller.js"
application.register("remove", RemoveController)

import SortableController from "./sortable_controller.js"
application.register("sortable", SortableController)
