function initTyped() {
  if (document.querySelector('.homepage-typed')) {
    var options = {
      strings: ["Barcelona", "London", "Berlin", "Amsterdam", "Brussels", "Paris", "Bali", "Sydney", "San Diego"],
      typeSpeed: 100,
      loop: true
    }
    var typed = new Typed('.homepage-typed', options)
  }
}

export { initTyped }
