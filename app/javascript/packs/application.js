import "jquery";
import "bootstrap";
import flatpickr from 'flatpickr';
import 'flatpickr/dist/flatpickr.min.css';
import { toggleTimeSlot } from 'components/booking';
import { setPriceButton } from 'components/booking';

import Typed from 'typed.js';
import { initTyped } from '../plugins/init_typed';

import { initAutocomplete } from '../plugins/init_autocomplete';

import 'mapbox-gl/dist/mapbox-gl.css';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import { initMapbox } from '../plugins/init_mapbox';

import { initStarRating } from '../plugins/init_star_rating';

import { initNotifications } from '../components/sweetalert';

initTyped();
initNotifications();

initAutocomplete();

toggleTimeSlot();

flatpickr(".datepicker", {
  disableMobile: true,
  altInput: true,
  altFormat: "F j",
  dateFormat: "Y-m-d"
});

initMapbox();

initStarRating();

const searchBarShow = document.querySelector('.search-bar-show')
if (searchBarShow) { searchBarShow.addEventListener('change', setPriceButton) }

const tabs = document.querySelector('.nav-tabs');
if (tabs) {
  if (window.location.hash != "") {
    console.log(window.location.hash);
    const link = tabs.querySelector('a[href="' + window.location.hash + '"]');
    link.click();
  }
}

