import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form"]

  connect() {
    console.log("Hello World!")
  }

  confirm() {
    if (confirm("Are you sure you want to unenroll from this course?")) {
      this.formTarget.submit()
    }
  }
}
