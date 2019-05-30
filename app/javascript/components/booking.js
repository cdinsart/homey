const toggleTimeSlot = () => {
  const timeslots = document.querySelectorAll('.timeslots label');
  [...timeslots].forEach((timeslot) => timeslot.addEventListener(
    'click',
    function () { this.classList.toggle('active') }
  ))
};

export { toggleTimeSlot };
