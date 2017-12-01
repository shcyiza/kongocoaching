function G_mapper (input_field, distance_node, map_node) {
  this.input_field = input_field;
  this.distance_node = distance_node;
  this.map_node = map_node;
};

function calculateAndDisplayRoute(Obj, directionsService, directionsDisplay) {
  directionsService.route({
    // New York, NY, USA (40.7127837, -74.0059413)
    origin: Obj.getGeopointA(),
    //Baltimore, MD, USA (39.2903848, -76.6121893)
    destination: Obj.getGeopointB(),
    travelMode: google.maps.TravelMode.DRIVING
   }, function(response, status) {
    if (status === google.maps.DirectionsStatus.OK) {
      var totaldistance = 0;
      var totalduration = 0;
      var route = response.routes[0];
      // display total distance information.
      for (var i = 0; i < route.legs.length; i++) {
        totaldistance = totaldistance + route.legs[i].distance.value;
      }
      for (var i = 0; i < route.legs.length; i++) {
        totalduration = totalduration + route.legs[i].duration.value;
      }
      Obj.distance_node.innerHTML += "<b>" + (totaldistance / 1000).toFixed(2) + " km</b>" +
        " et <b>"+ (totalduration / 60 ).toFixed(0) +" min</b> <br> en voiture de <u>"+ Obj.startPlacename() +"</u>";
      directionsDisplay.setDirections(response);
    } else {
      window.alert('Directions request failed due to ' + status);
    }
  });
};

G_mapper.prototype = {
   getGeopointA: function () {
    return this.input_field.value;
  },
  getGeopointB: function () {
    return this.distance_node.getAttribute('data-gmapper-endpoint');
  },
  startPlacename: function() {
    if ( this.distance_node.getAttribute('data-gmapper-placename') != "" ) {
      return this.getGeopointB()
    } else {
      return "de votre club"
    }
  },
  initMap: function() {
    if ( this.getGeopointA() !== "" ) {
      var directionsService = new google.maps.DirectionsService;
      var directionsDisplay = new google.maps.DirectionsRenderer;
      directionsDisplay.setMap(new google.maps.Map(this.map_node, {}));
      calculateAndDisplayRoute(this, directionsService, directionsDisplay);
    } else {
      this.distance_node.innerHTML = "<b>Remplissez-une addresse a gauche...</b>";
    };
  },
  reloadMap: function() {
    this.distance_node.innerHTML = "";
    this.map_node.innerHTML = "";
    this.initMap();
  },
  init: function() {
    var self = this
    self.initMap();
    console.log("map initialized")
  },
};
