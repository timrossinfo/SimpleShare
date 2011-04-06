//
//  SSHEmailViewController.m
//  SimpleShare
//
//  Created by Timothy Ross on 06/04/2011.
//  Copyright 2011 Blue Key Digital Limited. All rights reserved.
//

#import "SSHEmailViewController.h"
#import "SSHConfig.h"
#import "SSH.h"

@implementation SSHEmailViewController

- (id)init {
    
    Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
    if (mailClass != nil) {
        
        if ([mailClass canSendMail]) {
            
            if((self = [super init])) {
                
                [self setMailComposeDelegate:self];
                [self setSubject:EMAIL_SUBJECT];
                [self setMessageBody:EMAIL_BODY isHTML:NO];
            }
        }
    }
    
    return self;
}

#pragma mark -
#pragma mark MFMailComposeViewControllerDelegate methods

- (void)mailComposeController:(MFMailComposeViewController *)controller 
		  didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
	
	[self dismissModalViewControllerAnimated:YES];
}

@end