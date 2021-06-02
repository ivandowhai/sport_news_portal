import $ from "jquery";
import Map from "ol/Map"
import View from "ol/View"
import Tile from "ol/layer/Tile"
import OSM from "ol/source/OSM"
import { fromLonLat, toLonLat } from "ol/proj"

$(window).on('load', function () {
    let headers = {
      'X-CSRF-Token': document.getElementsByName('csrf-token')[0].content
    }

    $('#category_select').on('change', function (event) {
      $.ajax(`/admin/categories/${event.target.value}/subcategories`, {
        headers: headers,
        success: function (data) {
          refreshSubcategoriesList(data)
        }
      })
    })

  const map = new Map({
    target: 'map',
    layers: [
      new Tile({
        source: new OSM()
      })
    ],
    view: new View({
      center: fromLonLat([49.84149, 24.03186]),
      zoom: 4
    })
  });

  map.on('click', function(evt){
    getLocationFromCoordinates(toLonLat(evt.coordinate))
  });
  }
)
function refreshSubcategoriesList(list) {
  let options = ''
  list.map(category => {
    options += `<option value="${category.id}">${category.name}</option>`
  })
  $('#subcategory_select').html(options)
}

function getLocationFromCoordinates(coords) {
  fetch(`http://nominatim.openstreetmap.org/reverse?format=json&lon=${coords[0]}&lat=${coords[1]}`)
    .then(function(response) {
      return response.json();
    }).then(function(json) {
    $('#location').val(`${json.address.town || json.address.city}, ${json.address.state}, ${json.address.country}`)
  });
}
