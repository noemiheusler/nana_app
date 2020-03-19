const container = document.querySelector(".kids-input-container");

const initAddkids = () => {
  const btn = document.getElementById("add")
  var today = new Date();
var dd = today.getDate() -1;
var mm = today.getMonth()+1; //January is 0!
var yyyy = today.getFullYear();
 if(dd<10){
        dd='0'+dd
    }
    if(mm<10){
        mm='0'+mm
    }

today = yyyy+'-'+mm+'-'+dd;

  if (btn){
    btn.addEventListener("click", (e) => {
      e.preventDefault()
      container.insertAdjacentHTML("beforeend", `<input type='date' html5='true' name='kids[][kid_birthday]' class='datepicker form-control my-2' max='${today}' />`)
    })
  }
}

export { initAddkids };
