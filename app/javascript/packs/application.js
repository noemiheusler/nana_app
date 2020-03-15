import "bootstrap";

  const nextBtn = document.querySelectorAll(".next")
  nextBtn.forEach((btn) => {
    btn.addEventListener('click', ()=>{
      console.log("clocked")
      $('.carousel').carousel('next')
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
