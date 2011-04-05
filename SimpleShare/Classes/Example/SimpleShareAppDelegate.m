//
//  SimpleShareAppDelegate.m
//  SimpleShare
//
//  Created by Timothy Ross on 06/04/2011.
//  Copyright 2011 Blue Key Digital Limited. All rights reserved.
//

#import "SimpleShareAppDelegate.h"

@implementation SimpleShareAppDelegate

@synthesize window;
@synthesize navigationController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [self.window addSubview:[navigationController view]];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)dealloc {
    
    [navigationController release];
    [window release];
    
    [super dealloc];
}

@end
