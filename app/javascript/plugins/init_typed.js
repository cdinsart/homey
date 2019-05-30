function initTyped() {
  if (document.querySelector('.homepage-typed')) {
    var options = {
      strings: ["Be Productive Anywhere", "Rent Your Desk For A Day"],
      typeSpeed: 80,
      loop: true
    }
    var typed = new Typed('.homepage-typed', options)
  }
}

export { initTyped }
