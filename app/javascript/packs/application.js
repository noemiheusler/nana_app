import {initFlatpickr} from  "../plugins/flatpickr";
import "bootstrap";

initFlatpickr()

  const nextBtn = document.querySelectorAll(".next")
  nextBtn.forEach((btn) => {
    btn.addEventListener('click', ()=>{
      if (btn.classList.contains("btn-blocked") || btn.classList.contains("last-btn") ) {
        return "";
      } else {
        console.log("clocked")
        $('.carousel').carousel('next')
      }
    })
  })

const eventCategory = document.getElementById("event_category")

if (eventCategory) {
  eventCategory.addEventListener('change', (event) => {
  if (event.currentTarget.value == 'Private') {
    const invitation = document.getElementById("form-js-input")
    invitation.style.display = "block";
  };
  if (event.currentTarget.value == 'Public') {
    const invitation = document.getElementById("form-js-input")
    invitation.style.display = "none";
  };
  })
}

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';

initMapbox();

import { initAddkids } from '../plugins/init_addkids';

initAddkids();

import { initAutocomplete } from '../plugins/init_autocomplete';

initAutocomplete();

