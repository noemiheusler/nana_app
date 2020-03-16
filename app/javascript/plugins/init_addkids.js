const container = document.querySelector(".kids-input-container");

const initAddkids = () => {
  const btn = document.getElementById("add")
  if (btn){
    btn.addEventListener("click", (e) => {
      e.preventDefault()
      container.insertAdjacentHTML("beforeend", "<input type='date' html5='true' name='kids[][kid_birthday]'/>")
    })
  }
}

export { initAddkids };
