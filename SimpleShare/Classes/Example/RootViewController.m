//
//  RootViewController.m
//  SimpleShare
//
//  Created by Timothy Ross on 06/04/2011.
//

#import "RootViewController.h"
#import "SSHActionSheet.h"

@implementation RootViewController

- (IBAction)actionButtonPressed {
    
    [SSH setRootViewController:self];
    [SSH setCallbackDelegate:self];
    
    SSHActionSheet *actionSheet = [SSHActionSheet actionSheet];
    
    [actionSheet showInView:self.view];
}

#pragma mark -
#pragma mark SSHCallbackDelegate methods

- (void)didFinishSharing {
    
    NSLog(@"Finished sharing");
}

@end
