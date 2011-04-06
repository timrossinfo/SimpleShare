//
//  SSH.m
//  SimpleShare
//
//  Created by Timothy Ross on 06/04/2011.
//  Copyright 2011 Blue Key Digital Limited. All rights reserved.
//

#import "SSH.h"

@implementation SSH

static SSH *currentHelper = nil;

@synthesize rootViewController;

+ (SSH *)currentHelper
{
	if (currentHelper == nil)
		currentHelper = [[SSH alloc] init];
	
	return currentHelper;
}

+ (void)setRootViewController:(UIViewController *)aViewController
{	
	SSH *helper = [self currentHelper];
	[helper setRootViewController:aViewController];
}

- (void)dealloc {
    
    [rootViewController release];
    [super dealloc];
}

@end