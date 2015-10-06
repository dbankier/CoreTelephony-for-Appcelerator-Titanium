var number_to_dial = "123456790" // CHANGE THIS
// open a single window
var window = Ti.UI.createWindow({
	backgroundColor:'white'
});
var but = Ti.UI.createButton({
    title: "Dial Static Number"
});
but.addEventListener("click", function () {
    Ti.Platform.openURL('tel:' + number_to_dial);
    if	(Titanium.Platform.name == 'iPhone OS' && parseInt(Titanium.Platform.version.split(".")[0], 10) >=4) {
        Ti.App.iOS.registerBackgroundService({
            url:'bg.js'
        });
    }
});
window.add(but);
window.open();
