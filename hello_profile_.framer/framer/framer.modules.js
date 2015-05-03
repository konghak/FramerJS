require=(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({"flipCard":[function(require,module,exports){
exports.flipCard = function(front, back, perspective, flipCurve, x, y, superLayer) {
  var container, perspectiveLayer;
  perspectiveLayer = new Layer({
    width: front.width + 60,
    height: front.height + 40,
    backgroundColor: "transparent"
  });
  perspectiveLayer.perspective = perspective;
  perspectiveLayer.x = x;
  perspectiveLayer.y = y;
  perspectiveLayer.superLayer = superLayer;
  container = new Layer({
    width: front.width,
    height: front.height,
    backgroundColor: "transparent",
    superLayer: perspectiveLayer
  });
  container.center();
  back.superLayer = container;
  front.superLayer = container;
  back.rotationY = 180;
  front.states.add({
    front: {
      opacity: 1
    },
    back: {
      opacity: 0
    }
  });
  front.states.animationOptions = {
    curve: flipCurve
  };
  front.states.switchInstant("front");
  back.states.add({
    front: {
      opacity: 0
    },
    back: {
      opacity: 1
    }
  });
  back.states.animationOptions = {
    curve: flipCurve
  };
  back.states.switchInstant("front");
  container.states.add({
    front: {
      rotationY: 0
    },
    back: {
      rotationY: 180
    }
  });
  container.states.animationOptions = {
    curve: flipCurve
  };
  container.states.switchInstant("front");
  return container.on(Events.Click, function() {
    this.states.next(["back", "front"]);
    back.states.next(["back", "front"]);
    return front.states.next(["back", "front"]);
  });
};

exports.btn_plue_01 = function() {};



},{}],"myModule":[function(require,module,exports){
exports.myVar = "myVariable";

exports.myFunction = function() {
  return print("myFunction is running");
};

exports.myArray = [1, 2, 3];



},{}]},{},[])
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIm5vZGVfbW9kdWxlcy9icm93c2VyaWZ5L25vZGVfbW9kdWxlcy9icm93c2VyLXBhY2svX3ByZWx1ZGUuanMiLCIvVXNlcnMva29uZ2hhay9EZXNrdG9wL0ZyYW1lckpTL2hlbGxvX3Byb2ZpbGVfLmZyYW1lci9tb2R1bGVzL2ZsaXBDYXJkLmNvZmZlZSIsIi9Vc2Vycy9rb25naGFrL0Rlc2t0b3AvRnJhbWVySlMvaGVsbG9fcHJvZmlsZV8uZnJhbWVyL21vZHVsZXMvbXlNb2R1bGUuY29mZmVlIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiJBQUFBO0FDQUEsT0FBTyxDQUFDLFFBQVIsR0FBbUIsU0FBQyxLQUFELEVBQVEsSUFBUixFQUFjLFdBQWQsRUFBMkIsU0FBM0IsRUFBc0MsQ0FBdEMsRUFBeUMsQ0FBekMsRUFBNEMsVUFBNUMsR0FBQTtBQUVmLE1BQUEsMkJBQUE7QUFBQSxFQUFBLGdCQUFBLEdBQXVCLElBQUEsS0FBQSxDQUNuQjtBQUFBLElBQUEsS0FBQSxFQUFPLEtBQUssQ0FBQyxLQUFOLEdBQWMsRUFBckI7QUFBQSxJQUNBLE1BQUEsRUFBUSxLQUFLLENBQUMsTUFBTixHQUFlLEVBRHZCO0FBQUEsSUFFQSxlQUFBLEVBQWlCLGFBRmpCO0dBRG1CLENBQXZCLENBQUE7QUFBQSxFQUlBLGdCQUFnQixDQUFDLFdBQWpCLEdBQStCLFdBSi9CLENBQUE7QUFBQSxFQUtBLGdCQUFnQixDQUFDLENBQWpCLEdBQXFCLENBTHJCLENBQUE7QUFBQSxFQU1BLGdCQUFnQixDQUFDLENBQWpCLEdBQXFCLENBTnJCLENBQUE7QUFBQSxFQU9BLGdCQUFnQixDQUFDLFVBQWpCLEdBQThCLFVBUDlCLENBQUE7QUFBQSxFQVNBLFNBQUEsR0FBZ0IsSUFBQSxLQUFBLENBQ1o7QUFBQSxJQUFBLEtBQUEsRUFBTyxLQUFLLENBQUMsS0FBYjtBQUFBLElBQ0EsTUFBQSxFQUFRLEtBQUssQ0FBQyxNQURkO0FBQUEsSUFFQSxlQUFBLEVBQWlCLGFBRmpCO0FBQUEsSUFHQSxVQUFBLEVBQVksZ0JBSFo7R0FEWSxDQVRoQixDQUFBO0FBQUEsRUFnQkEsU0FBUyxDQUFDLE1BQVYsQ0FBQSxDQWhCQSxDQUFBO0FBQUEsRUFtQkEsSUFBSSxDQUFDLFVBQUwsR0FBa0IsU0FuQmxCLENBQUE7QUFBQSxFQW9CQSxLQUFLLENBQUMsVUFBTixHQUFtQixTQXBCbkIsQ0FBQTtBQUFBLEVBdUJBLElBQUksQ0FBQyxTQUFMLEdBQWlCLEdBdkJqQixDQUFBO0FBQUEsRUE2QkEsS0FBSyxDQUFDLE1BQU0sQ0FBQyxHQUFiLENBQ0k7QUFBQSxJQUFBLEtBQUEsRUFBTztBQUFBLE1BQUMsT0FBQSxFQUFTLENBQVY7S0FBUDtBQUFBLElBQ0EsSUFBQSxFQUFNO0FBQUEsTUFBQyxPQUFBLEVBQVMsQ0FBVjtLQUROO0dBREosQ0E3QkEsQ0FBQTtBQUFBLEVBZ0NBLEtBQUssQ0FBQyxNQUFNLENBQUMsZ0JBQWIsR0FDSTtBQUFBLElBQUEsS0FBQSxFQUFPLFNBQVA7R0FqQ0osQ0FBQTtBQUFBLEVBa0NBLEtBQUssQ0FBQyxNQUFNLENBQUMsYUFBYixDQUEyQixPQUEzQixDQWxDQSxDQUFBO0FBQUEsRUFvQ0EsSUFBSSxDQUFDLE1BQU0sQ0FBQyxHQUFaLENBQ0k7QUFBQSxJQUFBLEtBQUEsRUFBTztBQUFBLE1BQUMsT0FBQSxFQUFTLENBQVY7S0FBUDtBQUFBLElBQ0EsSUFBQSxFQUFNO0FBQUEsTUFBQyxPQUFBLEVBQVMsQ0FBVjtLQUROO0dBREosQ0FwQ0EsQ0FBQTtBQUFBLEVBdUNBLElBQUksQ0FBQyxNQUFNLENBQUMsZ0JBQVosR0FDSTtBQUFBLElBQUEsS0FBQSxFQUFPLFNBQVA7R0F4Q0osQ0FBQTtBQUFBLEVBeUNBLElBQUksQ0FBQyxNQUFNLENBQUMsYUFBWixDQUEwQixPQUExQixDQXpDQSxDQUFBO0FBQUEsRUEyQ0EsU0FBUyxDQUFDLE1BQU0sQ0FBQyxHQUFqQixDQUNJO0FBQUEsSUFBQSxLQUFBLEVBQU87QUFBQSxNQUFDLFNBQUEsRUFBVyxDQUFaO0tBQVA7QUFBQSxJQUNBLElBQUEsRUFBTTtBQUFBLE1BQUMsU0FBQSxFQUFXLEdBQVo7S0FETjtHQURKLENBM0NBLENBQUE7QUFBQSxFQThDQSxTQUFTLENBQUMsTUFBTSxDQUFDLGdCQUFqQixHQUNJO0FBQUEsSUFBQSxLQUFBLEVBQU8sU0FBUDtHQS9DSixDQUFBO0FBQUEsRUFnREEsU0FBUyxDQUFDLE1BQU0sQ0FBQyxhQUFqQixDQUErQixPQUEvQixDQWhEQSxDQUFBO1NBaURBLFNBQVMsQ0FBQyxFQUFWLENBQWEsTUFBTSxDQUFDLEtBQXBCLEVBQTJCLFNBQUEsR0FBQTtBQUN2QixJQUFBLElBQUksQ0FBQyxNQUFNLENBQUMsSUFBWixDQUFpQixDQUFDLE1BQUQsRUFBUSxPQUFSLENBQWpCLENBQUEsQ0FBQTtBQUFBLElBQ0EsSUFBSSxDQUFDLE1BQU0sQ0FBQyxJQUFaLENBQWlCLENBQUMsTUFBRCxFQUFRLE9BQVIsQ0FBakIsQ0FEQSxDQUFBO1dBRUEsS0FBSyxDQUFDLE1BQU0sQ0FBQyxJQUFiLENBQWtCLENBQUMsTUFBRCxFQUFRLE9BQVIsQ0FBbEIsRUFIdUI7RUFBQSxDQUEzQixFQW5EZTtBQUFBLENBQW5CLENBQUE7O0FBQUEsT0F3RE8sQ0FBQyxXQUFSLEdBQXNCLFNBQUEsR0FBQSxDQXhEdEIsQ0FBQTs7Ozs7QUNJQSxPQUFPLENBQUMsS0FBUixHQUFnQixZQUFoQixDQUFBOztBQUFBLE9BRU8sQ0FBQyxVQUFSLEdBQXFCLFNBQUEsR0FBQTtTQUNwQixLQUFBLENBQU0sdUJBQU4sRUFEb0I7QUFBQSxDQUZyQixDQUFBOztBQUFBLE9BS08sQ0FBQyxPQUFSLEdBQWtCLENBQUMsQ0FBRCxFQUFJLENBQUosRUFBTyxDQUFQLENBTGxCLENBQUEiLCJmaWxlIjoiZ2VuZXJhdGVkLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXNDb250ZW50IjpbIihmdW5jdGlvbiBlKHQsbixyKXtmdW5jdGlvbiBzKG8sdSl7aWYoIW5bb10pe2lmKCF0W29dKXt2YXIgYT10eXBlb2YgcmVxdWlyZT09XCJmdW5jdGlvblwiJiZyZXF1aXJlO2lmKCF1JiZhKXJldHVybiBhKG8sITApO2lmKGkpcmV0dXJuIGkobywhMCk7dmFyIGY9bmV3IEVycm9yKFwiQ2Fubm90IGZpbmQgbW9kdWxlICdcIitvK1wiJ1wiKTt0aHJvdyBmLmNvZGU9XCJNT0RVTEVfTk9UX0ZPVU5EXCIsZn12YXIgbD1uW29dPXtleHBvcnRzOnt9fTt0W29dWzBdLmNhbGwobC5leHBvcnRzLGZ1bmN0aW9uKGUpe3ZhciBuPXRbb11bMV1bZV07cmV0dXJuIHMobj9uOmUpfSxsLGwuZXhwb3J0cyxlLHQsbixyKX1yZXR1cm4gbltvXS5leHBvcnRzfXZhciBpPXR5cGVvZiByZXF1aXJlPT1cImZ1bmN0aW9uXCImJnJlcXVpcmU7Zm9yKHZhciBvPTA7bzxyLmxlbmd0aDtvKyspcyhyW29dKTtyZXR1cm4gc30pIiwiZXhwb3J0cy5mbGlwQ2FyZCA9IChmcm9udCwgYmFjaywgcGVyc3BlY3RpdmUsIGZsaXBDdXJ2ZSwgeCwgeSwgc3VwZXJMYXllcikgLT5cbiAgICAjIENyZWF0ZSBhIG5ldyBjb250YWluZXIgbGF5ZXJcbiAgICBwZXJzcGVjdGl2ZUxheWVyID0gbmV3IExheWVyXG4gICAgICAgIHdpZHRoOiBmcm9udC53aWR0aCArIDYwXG4gICAgICAgIGhlaWdodDogZnJvbnQuaGVpZ2h0ICsgNDBcbiAgICAgICAgYmFja2dyb3VuZENvbG9yOiBcInRyYW5zcGFyZW50XCJcbiAgICBwZXJzcGVjdGl2ZUxheWVyLnBlcnNwZWN0aXZlID0gcGVyc3BlY3RpdmVcbiAgICBwZXJzcGVjdGl2ZUxheWVyLnggPSB4XG4gICAgcGVyc3BlY3RpdmVMYXllci55ID0geVxuICAgIHBlcnNwZWN0aXZlTGF5ZXIuc3VwZXJMYXllciA9IHN1cGVyTGF5ZXJcbiAgICBcbiAgICBjb250YWluZXIgPSBuZXcgTGF5ZXJcbiAgICAgICAgd2lkdGg6IGZyb250LndpZHRoXG4gICAgICAgIGhlaWdodDogZnJvbnQuaGVpZ2h0XG4gICAgICAgIGJhY2tncm91bmRDb2xvcjogXCJ0cmFuc3BhcmVudFwiXG4gICAgICAgIHN1cGVyTGF5ZXI6IHBlcnNwZWN0aXZlTGF5ZXJcblxuICAgICMgQ2VudGVyIHRoZSBjb250YWluZXJcbiAgICBjb250YWluZXIuY2VudGVyKClcbiAgICBcbiAgICAjU2V0IHN1cGVyTGF5ZXIgZm9yIGJvdGggZnJvbnQgYW5kIGJhY2sgbGF5ZXJzXG4gICAgYmFjay5zdXBlckxheWVyID0gY29udGFpbmVyXG4gICAgZnJvbnQuc3VwZXJMYXllciA9IGNvbnRhaW5lclxuICAgIFxuICAgICMgUm90YXRlIHRoZSBiYWNrIGltYWdlIG9uIGludGlhbFxuICAgIGJhY2sucm90YXRpb25ZID0gMTgwICAgIFxuICAgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjXG4gICAgIyBTdGF0ZXNcbiAgICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjI1xuICAgIFxuICAgIFxuICAgIGZyb250LnN0YXRlcy5hZGRcbiAgICAgICAgZnJvbnQ6IHtvcGFjaXR5OiAxfVxuICAgICAgICBiYWNrOiB7b3BhY2l0eTogMH1cbiAgICBmcm9udC5zdGF0ZXMuYW5pbWF0aW9uT3B0aW9ucyA9XG4gICAgICAgIGN1cnZlOiBmbGlwQ3VydmVcbiAgICBmcm9udC5zdGF0ZXMuc3dpdGNoSW5zdGFudChcImZyb250XCIpXG4gICAgXG4gICAgYmFjay5zdGF0ZXMuYWRkXG4gICAgICAgIGZyb250OiB7b3BhY2l0eTogMH1cbiAgICAgICAgYmFjazoge29wYWNpdHk6IDF9XG4gICAgYmFjay5zdGF0ZXMuYW5pbWF0aW9uT3B0aW9ucyA9XG4gICAgICAgIGN1cnZlOiBmbGlwQ3VydmVcbiAgICBiYWNrLnN0YXRlcy5zd2l0Y2hJbnN0YW50KFwiZnJvbnRcIilcbiAgICBcbiAgICBjb250YWluZXIuc3RhdGVzLmFkZFxuICAgICAgICBmcm9udDoge3JvdGF0aW9uWTogMH1cbiAgICAgICAgYmFjazoge3JvdGF0aW9uWTogMTgwfVxuICAgIGNvbnRhaW5lci5zdGF0ZXMuYW5pbWF0aW9uT3B0aW9ucyA9XG4gICAgICAgIGN1cnZlOiBmbGlwQ3VydmVcbiAgICBjb250YWluZXIuc3RhdGVzLnN3aXRjaEluc3RhbnQoXCJmcm9udFwiKVxuICAgIGNvbnRhaW5lci5vbiBFdmVudHMuQ2xpY2ssIC0+XG4gICAgICAgIHRoaXMuc3RhdGVzLm5leHQoW1wiYmFja1wiLFwiZnJvbnRcIl0pXG4gICAgICAgIGJhY2suc3RhdGVzLm5leHQoW1wiYmFja1wiLFwiZnJvbnRcIl0pXG4gICAgICAgIGZyb250LnN0YXRlcy5uZXh0KFtcImJhY2tcIixcImZyb250XCJdKVxuXG5leHBvcnRzLmJ0bl9wbHVlXzAxID0gKCkgLT5cblxuIiwiIyBBZGQgdGhlIGZvbGxvd2luZyBsaW5lIHRvIHlvdXIgcHJvamVjdCBpbiBGcmFtZXIgU3R1ZGlvLiBcbiMgbXlNb2R1bGUgPSByZXF1aXJlIFwibXlNb2R1bGVcIlxuIyBSZWZlcmVuY2UgdGhlIGNvbnRlbnRzIGJ5IG5hbWUsIGxpa2UgbXlNb2R1bGUubXlGdW5jdGlvbigpIG9yIG15TW9kdWxlLm15VmFyXG5cbmV4cG9ydHMubXlWYXIgPSBcIm15VmFyaWFibGVcIlxuXG5leHBvcnRzLm15RnVuY3Rpb24gPSAtPlxuXHRwcmludCBcIm15RnVuY3Rpb24gaXMgcnVubmluZ1wiXG5cbmV4cG9ydHMubXlBcnJheSA9IFsxLCAyLCAzXSJdfQ==
