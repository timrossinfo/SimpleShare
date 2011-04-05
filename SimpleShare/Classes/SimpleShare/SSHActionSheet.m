//
//  SSHActionSheet.m
//  SimpleShare
//
//  Created by Timothy Ross on 06/04/2011.
//  Copyright 2011 Blue Key Digital Limited. All rights reserved.
//

#import "SSHActionSheet.h"

@implementation SSHActionSheet

+ (SSHActionSheet *)actionSheetWithView:(UIView *)aView {
    
    SSHActionSheet *actionSheet = [[SSHActionSheet alloc]
								  initWithTitle:nil
								  delegate:nil
								  cancelButtonTitle:@"Cancel"
								  destructiveButtonTitle:nil
								  otherButtonTitles:@"Twitter", @"Facebook", @"Email", nil];
	
	actionSheet.title = @"Share";
    actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
	actionSheet.opaque = YES;
    [actionSheet showInView:aView];
    [actionSheet release];
    
    return actionSheet;
}

- (void)dismissWithClickedButtonIndex:(NSInteger)buttonIndex animated:(BOOL)animated {
	
	[super dismissWithClickedButtonIndex:buttonIndex animated:animated];
}

@end
