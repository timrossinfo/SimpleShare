//
//  RootViewController.m
//  SimpleShare
//
//  Created by Timothy Ross on 06/04/2011.
//  Copyright 2011 Blue Key Digital Limited. All rights reserved.
//

#import "RootViewController.h"
#import "SSH.h"
#import "SSHActionSheet.h"

@implementation RootViewController

- (IBAction)actionButtonPressed {
    
    [SSH setRootViewController:self];
    
    SSHActionSheet *actionSheet = [SSHActionSheet actionSheet];
    [actionSheet setDelegate:self];
    
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    
    NSLog(@"Action sheet dismissed");
}

@end
