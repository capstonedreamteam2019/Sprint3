
import './background-images';
import './prism';
import mrSmoothScroll from './smooth-scroll';
import mrSticky from './sticky';
import mrUtil from './util';
import './video';
import './wizard';

(() => {
  if (typeof $ === 'undefined') {
    throw new TypeError('Medium Rare JavaScript requires jQuery. jQuery must be included before theme.js.');
  }
})();

export {
  mrSmoothScroll,
  mrSticky,
  mrUtil,
};
