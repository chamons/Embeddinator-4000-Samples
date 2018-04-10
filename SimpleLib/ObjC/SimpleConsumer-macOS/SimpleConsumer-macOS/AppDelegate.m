//
//  AppDelegate.m
//  SimpleConsumer-macOS
//
//  Created by Chris Hamons on 4/10/18.
//  Copyright © 2018 Chris Hamons. All rights reserved.
//

#import "AppDelegate.h"
#include "SimpleLib/SimpleLib.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    SimpleLib_Adder* adder = [[SimpleLib_Adder alloc] initWithX:2 y:3];
    NSAlert * alert = [[NSAlert alloc] init];
    alert.messageText = [NSString stringWithFormat: @"2 + 3 = %d", [adder value]];
    [alert runModal];
    [NSApp terminate:nil];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
