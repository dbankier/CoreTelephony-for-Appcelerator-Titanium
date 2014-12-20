#import "ComYydigitalCoretelephonyModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import <CoreTelephony/CTCall.h>
#import <CoreTelephony/CTCallCenter.h>

@implementation ComYydigitalCoretelephonyModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"1c74c30c-b16e-452a-8222-02cbd3472dc5";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"com.yydigital.coretelephony";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
	CTCallCenter *callCenter = [[CTCallCenter alloc] init];
    callCenter.callEventHandler=^(CTCall* call)
    {
        NSDictionary *ret = [NSDictionary alloc];
        [ret setValue:call.callState forKey:@"callState"];
        [ret setValue:call.callID forKey:@"callId"];
        [self fireEvent:@"call" withObject:ret];
    };
    
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	[super shutdown:sender];
}

#pragma mark Cleanup

-(void)dealloc
{
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	[super didReceiveMemoryWarning:notification];
}


#pragma Public APIs


//CONSTANTS
-(id)DIALING {
	return CTCallStateDialing;
}
-(id)INCOMING {
	return CTCallStateIncoming;
}
-(id)CONNECTED {
	return CTCallStateConnected;
}
-(id)DISCONNECTED {
	return CTCallStateDisconnected;
}

-(NSArray*)getCurrentCalls:(id)arg {
	CTCallCenter* callCenter = [[CTCallCenter alloc] init];
	
	NSArray* callsArray = [[callCenter.currentCalls allObjects] retain];
	if (callsArray == NULL) {
		return nil;
	}
	
	
	NSMutableArray* calls = [NSMutableArray arrayWithCapacity:[callsArray count]];
	for (CFIndex i=0; i < [callsArray count]; i++) {
		CTCall* curr = [callsArray objectAtIndex:i];
		NSDictionary* call_details = [[NSDictionary alloc] initWithObjectsAndKeys:
                                      [curr callID], @"callID",
                                      [curr callState], @"callState",
                                      nil];
		[calls addObject:call_details];
	}
	
	CFRelease(callsArray);
	CFRelease(callCenter);
    
	return calls;
    
}

@end
