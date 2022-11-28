import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="rating"
export default class extends Controller {
  connect() {
    console.log("Connected successfully.");
  }
  initialize() {
    this.element.setAttribute("data-action", "click->rating#showModal");
  }
  showModal(event) {
    event.preventDefault();
    this.url = this.element.href;
    console.log(this.url);

    fetch(this.url, {
      headers: {
        Accept: "text/vnd.turbo-stream.html"
      }
    })
        .then(response => response.text())
        .then(html => Turbo.renderStreamMessage(html))
  }
}
