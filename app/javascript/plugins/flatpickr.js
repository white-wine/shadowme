import flatpickr from "flatpickr"
import "flatpickr/dist/themes/dark.css"

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

document.getElementsByClassName("datepicker")[1].style.backgroundColor = "#403b3b";
document.getElementsByClassName("datepicker")[1].style.color = "white";
document.getElementsByClassName("datepicker")[1].style.border = "1px solid #a5a5a7";
