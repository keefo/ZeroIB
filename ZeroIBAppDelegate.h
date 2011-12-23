//
//  ZeroIBAppDelegate.h
//  ZeroIB
//
//  Created by liam on 10-10-22.
//  Copyright 2010 Beyondcow. All rights reserved.
//

#import <Foundation/Foundation.h>
#define USE_WINDOW_CONTROLLER 1

@interface ZeroIBAppDelegate : NSObject {
	NSWindow *window;
	NSButton *button1,*button2;
#if USE_WINDOW_CONTROLLER
	NSWindowController *controller;
#endif
}

@end
