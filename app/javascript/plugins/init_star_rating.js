import "jquery-bar-rating";
import "jquery-bar-rating/dist/themes/css-stars";
import $ from 'jquery';

const initStarRating = () => {
  $('#review_desk_rating').barrating({
    theme: 'css-stars'
  });
};

export { initStarRating };
