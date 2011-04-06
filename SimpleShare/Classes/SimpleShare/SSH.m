//
//  SSH.m
//  SimpleShare
//
//  Created by Timothy Ross on 06/04/2011.
//

#import "SSH.h"

@implementation SSH

static SSH *currentHelper = nil;

@synthesize rootViewController;
@synthesize callbackDelegate;

+ (SSH *)currentHelper {
    
	if (currentHelper == nil)
		currentHelper = [[SSH alloc] init];
	
	return currentHelper;
}

+ (void)setRootViewController:(UIViewController *)aViewController {
	
	SSH *helper = [self currentHelper];
	[helper setRootViewController:aViewController];
}

+ (void)setCallbackDelegate:(id<SSHCallbackDelegate>)aCallbackDelegate {
    
    SSH *helper = [self currentHelper];
	[helper setCallbackDelegate:aCallbackDelegate];
}

- (void)dealloc {
    
    [rootViewController release];
    [super dealloc];
}

@end
