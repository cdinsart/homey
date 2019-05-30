import "bootstrap";

import flatpickr from 'flatpickr';
import 'flatpickr/dist/flatpickr.min.css';
import { toggleTimeSlot } from 'components/booking';

import Typed from 'typed.js';
import { initTyped } from '../plugins/init_typed';

import { initAutocomplete } from '../plugins/init_autocomplete';

initTyped();

initAutocomplete();

toggleTimeSlot()
flatpickr(".datepicker", {

});
