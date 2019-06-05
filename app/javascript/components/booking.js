const toggleTimeSlot = () => {
  const timeslots = document.querySelectorAll('.timeslots label');
  [...timeslots].forEach((timeslot) => timeslot.addEventListener(
    'click',
    function () { this.classList.toggle('active') }
  ))
};

const setPriceButton = () => {
  const deskPrice = document.getElementById('deskprice');
  const halfDeskPrice = document.getElementById('halfdeskprice');
  const priceButton = document.getElementById('book-submit');
  const bookingBar = document.querySelector('.search-bar-show');
  const checkedBoxes = bookingBar.querySelectorAll('input[type=checkbox]:checked').length;
  // console.log(checkedBoxes);
  // console.log(deskPrice.innerHTML);
  // console.log(halfDeskPrice.innerHTML);
  if (checkedBoxes == 0) {
    priceButton.value = "Book"
    priceButton.disabled = true
  } else if (checkedBoxes == 1) {
    priceButton.disabled = false
    priceButton.value = "Book |"+halfDeskPrice.innerHTML
  } else {
    priceButton.disabled = false
    priceButton.value = "Book |"+deskPrice.innerHTML
  };
};

export { toggleTimeSlot };
export { setPriceButton };
