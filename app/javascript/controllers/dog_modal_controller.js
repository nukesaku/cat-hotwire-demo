import { Controller } from "@hotwired/stimulus"
import { Modal } from "bootstrap"

// Connects to data-controller="dog-modal"
export default class extends Controller {
  connect() {
    this.modal = new Modal(this.element)
  }

  close(event) {
    if (event.detail.success) {
      this.modal.hide();
    }
  }
}
