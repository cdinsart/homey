import "bootstrap";

import flatpickr from 'flatpickr';
import 'flatpickr/dist/flatpickr.min.css';
import { toggleTimeSlot } from 'components/booking';

import Typed from 'typed.js';
import { initTyped } from '../plugins/init_typed';

import { initAutocomplete } from '../plugins/init_autocomplete';

import 'mapbox-gl/dist/mapbox-gl.css';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import { initMapbox } from '../plugins/init_mapbox';

import { initStarRating } from '../plugins/init_star_rating';

initTyped();

initAutocomplete();

toggleTimeSlot()
flatpickr(".datepicker", {

});

initMapbox();

initStarRating();
