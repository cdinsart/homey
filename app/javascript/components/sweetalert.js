import Swal from 'sweetalert2'


const initNotifications = () => {
  successAndRedirect();
  areYouSureNotification();
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
