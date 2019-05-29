import "bootstrap";

import Typed from 'typed.js';
import { initTyped } from '../plugins/init_typed'

initTyped();

import flatpickr from 'flatpickr';
import 'flatpickr/dist/flatpickr.min.css';
import { toggleTimeSlot } from 'components/booking';

toggleTimeSlot()
flatpickr(".datepicker", {

});
