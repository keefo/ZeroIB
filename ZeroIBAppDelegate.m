//
//  ZeroIBAppDelegate.m
//  ZeroIB
//
//  Created by liam on 10-10-22.
//  Copyright 2010 Beyondcow. All rights reserved.
//

#import "ZeroIBAppDelegate.h"
#import "ZeroIBMainMenu.h"

@implementation ZeroIBAppDelegate


- (void)buttonAction:(id)sender
{
	if(button1==sender){
		[button1 setTitle:@"Button1"];
		[button2 setTitle:@"1 clicked"];
	}else {
		[button2 setTitle:@"Button2"];
		[button1 setTitle:@"2 clicked"];
	}
}

#pragma mark Application Delegate

- (void)applicationWillFinishLaunching:(NSNotification *)aNotification {
	
	NSSize screenSize=[[NSScreen mainScreen] visibleFrame].size;
	float windowWidth=390;
	float windowHeight=100;
	
	window=[[NSWindow alloc] initWithContentRect:NSMakeRect((screenSize.width-windowWidth)/2, (screenSize.height-windowHeight)/2, windowWidth, windowHeight) 
									   styleMask:NSTitledWindowMask | NSResizableWindowMask | NSClosableWindowMask | NSTexturedBackgroundWindowMask 
										 backing:NSBackingStoreBuffered 
										   defer:YES];		
	[ZeroIBMainMenu populateMainMenu];
	
	button1=[[NSButton alloc] init];
	[button1 setFrame:NSMakeRect(20, 30, 80, 25)];
	[button1 setBezelStyle:NSTexturedRoundedBezelStyle];
	[button1 setTitle:@"Button1"];
	[button1 setTarget:self];
	[button1 setAction:@selector(buttonAction:)];
	[[window contentView] addSubview:button1];
	[button1 release];
	
	button2=[[NSButton alloc] init];
	[button2 setFrame:NSMakeRect(140, 30, 80, 25)];
	[button2 setBezelStyle:NSTexturedRoundedBezelStyle];
	[button2 setTitle:@"Button2"];
	[button2 setTarget:self];
	[button2 setAction:@selector(buttonAction:)];
	[[window contentView] addSubview:button2];
	[button2 release];
	
#if USE_WINDOW_CONTROLLER
	controller=[[NSWindowController alloc] initWithWindow:window];
#endif
	
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
#if USE_WINDOW_CONTROLLER
	[controller showWindow:self];
	NSLog(@"use controller");
#else
	[window makeKeyAndOrderFront:self];	
#endif
}

- (BOOL) applicationShouldHandleReopen:(NSApplication *)theApplication hasVisibleWindows:(BOOL)flag {
	return YES;
}

- (BOOL) applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication {
	return YES;
}

- (void) applicationWillTerminate:(NSNotification *)notification {
	[window release];
	window=nil;
#if USE_WINDOW_CONTROLLER
	[controller release];
	controller=nil;
#endif
}

@end
