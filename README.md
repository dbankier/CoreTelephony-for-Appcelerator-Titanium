CoreTelephony Module for Titanium
=================================

This module exposes SOME of the iOS CoreTelephony Framework. It retreives the current
call states and call-ids (not CLID). It was developed because I needed a way of returning
to the app after a call that was initiated from the app ended. See the example for how 
to do it.


Quick Start
-----------
1. Download: com.yydigital.coretelephony-iphone-0.2.zip
2. Unzip it to the titanium directory. (In iOS it is /Library/Application\ Support/Titanium/)
3. Modify the tiapp.xml file to include the module, for example:
    <modules>
        <module version="0.2">com.yydigital.coretelephony</module>
    </modules>


Code snippets
-------------

Example Usage

~~~
  var core = require('com.yydigital.coretelephony');

  var calls = core.getCurrentCalls();

  //Check if there are active calls:
  var are_there_active_calls = (calls != null);

  //This can be used to get the number of active calls:
  var active_calls_number = calls.length;

  //You can get the call state (dialing, incoming, connected and disconnected) of a call as follows:
  calls[0].callState;

  //And callid (which is not CLID so pretty useless):
  calls[0].callID;
~~~

__NEW__: Get notified for call state changes.

~~~
core.addEventListener("call", function(e) {
  if (e.callState === core.INCOMING) {
    //do something
  }
});

~~~


Compiled Module
---------------
Just download com.yydigital.coretelephony-iphone-0.2.zip of you are not interested in the source.

