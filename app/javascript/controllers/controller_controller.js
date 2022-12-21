import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="controller"
export default class extends Controller {
  connect() {
    const startDate = document.getElementById("reservation_start_date");
    const endDate = document.getElementById("reservation_end_date");


    [startDate, endDate].forEach(date => {
      date.addEventListener("change", (event) => {
        console.log(startDate.value);
        console.log(endDate.value);
        let dateDiffInMilliseconds = new Date(endDate.value) - new Date(startDate.value);
        let nbrOfDays = dateDiffInMilliseconds / 86400000;
        const totalDays = document.getElementById("total-days")


        const flatPricePerDay = document.getElementById("flat-price-per-night").innerText;
        const totalPriceElement = document.getElementById("total-price");

        if(startDate.value && endDate.value) {
          // [...]
          totalPriceElement.innerText = nbrOfDays * flatPricePerDay
          totalDays.innerText = nbrOfDays
        }
      });
    })









  }
}
