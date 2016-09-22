import Map from 'can/map/';
import Animation from './animation.coffee!';

export default Map.extend({
  startGame: function() {
    let animation = new Animation('#stage');
    animation.start();
    animation.createDefense(110, 220);
    animation.fire();
  }
});
