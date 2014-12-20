/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "TiModule.h"

@interface ComYydigitalCoretelephonyModule : TiModule 
{
}
//METHOD
-(id)getCurrentCalls:(id)args;

//CONSTANTS
@property(nonatomic,readonly) id DIALING;
@property(nonatomic,readonly) id INCOMING;
@property(nonatomic,readonly) id CONNECTED;
@property(nonatomic,readonly) id DISCONNECTED;

@end
