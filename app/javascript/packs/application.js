import "bootstrap";

  const nextBtn = document.querySelectorAll(".next")
  nextBtn.forEach((btn) => {
    btn.addEventListener('click', ()=>{
      console.log("clocked")
      $('.carousel').carousel('next')
    })
  })

document.getElementById("event_category").addEventListener('change', (event) => {
  if (event.currentTarget.value == 'Private') {
    const invitation = document.getElementById("form-js-input")
    invitation.style.display = "block";
  };
  if (event.currentTarget.value == 'Public') {
    const invitation = document.getElementById("form-js-input")
    invitation.style.display = "none";
  };
})

