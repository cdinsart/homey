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
        timer: 3500,
        allowOutsideClick: true,
        confirmButtonText: "Cool !",
        confirmButtonColor: "#28CC9E",
        onAfterClose: () => window.location.pathname = btn.dataset.url
      })
    })
  }
}

const areYouSureNotification = () => {
  if (false) {
    Swal.fire({
      position: 'center',
      type: 'error',
      title: 'Are you sure?',
      showConfirmButton: false,
      timer: 3500
    })
  }
}

export { initNotifications };
