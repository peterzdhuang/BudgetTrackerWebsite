import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  selectDate(event) {
    // You can add custom behavior here when a date is selected
    const date = event.currentTarget.dataset.calendarDateParam
    
    // Dispatch a custom event that other parts of your app can listen to
    const customEvent = new CustomEvent('spending:dateSelected', {
      detail: { date },
      bubbles: true
    })
    this.element.dispatchEvent(customEvent)
  }

  // Optional: Add animations or other interactive features
  connect() {
    console.log("Calendar controller connected")
  }
}