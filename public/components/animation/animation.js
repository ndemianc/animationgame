import can from 'can';
import Component from 'can/component/';
import ViewModel from './animation.viewmodel';
import template from './animation.stache!';
import './animation.less!';
import 'gsap';
import 'jquery-nearest';

export default Component.extend({
  tag: 'sd-animation',
  viewModel: ViewModel,
  template: template
});
