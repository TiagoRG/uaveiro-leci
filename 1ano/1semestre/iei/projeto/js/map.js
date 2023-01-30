let map = new L.Map("myMap", {center: [40.633258,-8.659097],zoom: 15});
let osmUrl="http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png";
let osmAttrib="Map data OpenStreetMap contributors";
let osm = new L.TileLayer(osmUrl, {attribution: osmAttrib});
map.addLayer(osm);

map.on("click", showCoordinates);

function showCoordinates(e){
    var s = document.getElementById("coordinates");
    s.innerHTML = "Latitude, Longitude = "+e.latlng.lat+", "+e.latlng.lng;
}

let pontos = [
    L.marker([40.633258, -8.659097]),
    L.marker([40.642729, -8.747899])
]

for (let i in pontos) {
    pontos[i].addTo(map)
}

L.marker([40.633258, -8.659097]).bindPopup("LABI@DETI").addTo(map);

let grupo = new L.featureGroup(pontos);
map.fitBounds(grupo.getBounds());

let iconeUA = L.icon({ iconUrl: "images/ua.png" });
L.marker([40.633258, -8.659097], {icon: iconeUA}).bindPopup("LABI@DETI").addTo(map);

let reitoria = L.polygon(
    [ [40.63102, -8.65793], [40.63149, -8.65731],
        [40.63126, -8.65699], [40.63078, -8.65759] ],
    { color: "red" } );
reitoria.addTo(map);
reitoria.bindPopup("Reitoria")