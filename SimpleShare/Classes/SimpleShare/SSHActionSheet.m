//
//  SSHActionSheet.m
//  SimpleShare
//
//  Created by Timothy Ross on 06/04/2011.
//  Copyright 2011 Blue Key Digital Limited. All rights reserved.
//

#import "SSHActionSheet.h"
#import "SSH.h"
#import "SSHTwitterViewController.h"

@implementation SSHActionSheet

+ (SSHActionSheet *)actionSheet {
    
    SSHActionSheet *actionSheet = [[SSHActionSheet alloc]
								  initWithTitle:nil
								  delegate:nil
								  cancelButtonTitle:@"Cancel"
								  destructiveButtonTitle:nil
								  otherButtonTitles:@"Twitter", @"Facebook", @"Email", nil];
	
	actionSheet.title = @"Share";
    actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
	actionSheet.opaque = YES;
    
    return [actionSheet autorelease];
}

-(void)showTwitter {
    
    SSHTwitterViewController *twitterController = [[SSHTwitterViewController alloc] init];
    
	UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:twitterController];
	[[[SSH currentHelper] rootViewController] presentModalViewController:navController animated:YES];
	
	[navController release];
	[twitterController release];
}

- (void)dismissWithClickedButtonIndex:(NSInteger)buttonIndex animated:(BOOL)animated {
    
    if (buttonIndex == 0) {

        [self showTwitter];
    }
	
	[super dismissWithClickedButtonIndex:buttonIndex animated:animated];
}

@end
