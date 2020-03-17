import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!

const initFlatpickr = () => {
    flatpickr(".datepicker", {
        altInput: true,
        enableTime: true
    })    
}

export {initFlatpickr}