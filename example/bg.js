var core = require('com.yydigital.coretelephony');
var calls = core.getCurrentCalls();
var calls_length = calls == null ? 0 : calls.length;

// Regularly Check Call State
var timer = setInterval( function () {
    // Get the amount of current calls
	var calls = core.getCurrentCalls();
	if (calls_length == null) {
		calls_length = calls == null ? 0 : calls.length;
	} else if (calls == null) { // Popup when ALL calls have ended
		var notification = Ti.App.iOS.scheduleLocalNotification({
			alertBody:"Return to App?",
			alertAction:"OK",
			userInfo: {
				"hello":"world"
			},
			date:new Date(new Date().getTime() + 10)
		});
		clearTimeout(timer);
		Ti.App.currentService.stop();
	} else if (calls_length < calls.length) { // New Call In			
           calls_length = calls.length;
	}
},1000);

