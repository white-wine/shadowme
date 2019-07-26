import flatpickr from "flatpickr"
import "flatpickr/dist/themes/light.css"

const options =
{
    altInput: true,
    altFormat: "F j, Y",
    dateFormat: "Y-m-d",
    minDate: "today",
    mode: "range",
    dateFormat: "Y-m-d",
    disable: [
        {
            from: "2025-04-01",
            to: "2025-05-01"
        },
        {
            from: "2025-09-01",
            to: "2025-12-01"
        }
    ]
}



flatpickr(".datepicker", options)

document.getElementById("booking-date").nextSibling.setAttribute("style", "background-color: #403b3b; border: 1px solid #a5a5a7; color: white;")
