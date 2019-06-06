import Swal from 'sweetalert2'


const initNotifications = () => {
  successAndRedirect();
  areYouSureNotification();
  leaveReview();
}


const successAndRedirect = () => {
  const btn = document.querySelector('[data-url]')

  if (btn) {
    btn.addEventListener('click', (e) => {
      e.preventDefault();
      Swal.fire({
        position: 'center',
        type: 'success',
        title: btn.dataset.title,
        showConfirmButton: true,
        allowOutsideClick: true,
        confirmButtonText: "Cool !",
        confirmButtonColor: "#28CC9E",
        onAfterClose: () => window.location.pathname = btn.dataset.url
      })
    })
  }
}

const areYouSureNotification = () => {
  const btns = document.querySelectorAll('[data-delete]')
  btns.forEach(btn => {
    btn.addEventListener('click', (event) => {
      console.log(event)
      event.preventDefault();
      Swal.fire({
        position: 'center',
        type: 'warning',
        title: 'Are you sure?',
        showConfirmButton: true
      })
      .then(result => confirmed(result, btn))
    })
  })
}

const confirmed = (result, btn) => {
  if (result.value) {
    btn.removeAttribute('data-delete');
    // btn.click();
  }
}

export { initNotifications };

// ------------------------------------------------------------

const leaveReview = () => {
  const btn = document.querySelector('.btn-review')

  if (btn) {
    btn.addEventListener('click', (e) => {
      e.preventDefault();
      Swal.fire({
        type: 'question',
        input: 'textarea',
        inputPlaceholder: 'Type your message here...',
        title: 'Give a rating from 1 to 5',
        input: 'range',
        inputAttributes: {
          min: 1,
          max: 5,
          step: 1
        },
        inputValue: 5,
        position: 'center',
        showConfirmButton: true,
        confirmButtonText: "Leave a review",
        confirmButtonColor: "#28CC9E",
      })
    })
  }
}
