let map = new L.Map("about-map", {center: [40.633258,-8.659097],zoom: 15});
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
    L.marker([40.63130996789477, -8.657639622688295])
]

for (let i in pontos) {
    pontos[i].addTo(map)
}

L.marker([40.633258, -8.659097]).bindPopup("LABI@DETI").addTo(map);

let grupo = new L.featureGroup(pontos);
map.fitBounds(grupo.getBounds());

let iconeUA = L.icon({ iconUrl: "images/ualogo.png", iconSize: [40, 40] });
L.marker([40.633258, -8.659097]).bindPopup("LABI@DETI").addTo(map);
L.marker([40.63130996789477, -8.657639622688295]).bindPopup("REITORIA").addTo(map);

let reitoria = L.polygon(
    [ [40.63102, -8.65793], [40.63149, -8.65731],
        [40.63126, -8.65699], [40.63078, -8.65759] ],
    { color: "red" } );
reitoria.addTo(map);
reitoria.bindPopup("Reitoria")

let deti = L.polygon(
    [   [40.632806095219365, -8.659114837646486], [40.63281016626841, -8.65928113460541],
        [40.63307478392277, -8.659291863441469], [40.63308292598783, -8.659313321113588],
        [40.63318470171706, -8.659313321113588], [40.63318063069089, -8.65928113460541],
        [40.63322948298879, -8.65928113460541], [40.633225411965334, -8.659120202064516] ],
    {color: "green"} );
deti.bindPopup("DETI").addTo(map);