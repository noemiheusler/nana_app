import "bootstrap";

  const nextBtn = document.querySelectorAll(".next")
  nextBtn.forEach((btn) => {
    btn.addEventListener('click', ()=>{
      console.log("clocked")
      $('.carousel').carousel('next')
    })
  })
