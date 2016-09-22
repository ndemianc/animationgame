import can from 'can';
import $ from 'jquery';
import 'can/view/autorender/';
import template from './main.stache!';
import './components/animation/';

can.$('#content').html(template);
