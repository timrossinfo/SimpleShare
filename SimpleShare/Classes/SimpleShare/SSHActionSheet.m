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
#import "SSHFacebookViewController.h"
#import "SSHEmailViewController.h"

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

-(void)showTwitterViewController {
    
    SSHTwitterViewController *twitterController = [[SSHTwitterViewController alloc] init];
    
	UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:twitterController];
	[[[SSH currentHelper] rootViewController] presentModalViewController:navController animated:YES];
	
	[navController release];
	[twitterController release];
}

-(void)showFacebookViewController {
    
    SSHFacebookViewController *facebookController = [[SSHFacebookViewController alloc] init];
    
	UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:facebookController];
	[[[SSH currentHelper] rootViewController] presentModalViewController:navController animated:YES];
	
	[navController release];
	[facebookController release];
}

-(void)showEmailViewController {
    
    SSHEmailViewController *emailController = [[SSHEmailViewController alloc] init];
    
	[[[SSH currentHelper] rootViewController] presentModalViewController:emailController animated:YES];

	[emailController release];
}

- (void)dismissWithClickedButtonIndex:(NSInteger)buttonIndex animated:(BOOL)animated {
    
    if (buttonIndex == 0) {

        [self showTwitterViewController];
    }
    else if (buttonIndex == 1) {
        
        [self showFacebookViewController];
    }
    else if (buttonIndex == 2) {
        
        [self showEmailViewController];
    }
    else if(buttonIndex == [self cancelButtonIndex])
    {
        [[[SSH currentHelper] callbackDelegate] didFinishSharing];
    }
	
	[super dismissWithClickedButtonIndex:buttonIndex animated:animated];
}

@end
