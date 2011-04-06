//
//  SSH.h
//  SimpleShare
//
//  Created by Timothy Ross on 06/04/2011.
//  Copyright 2011 Blue Key Digital Limited. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SSHCallbackDelegate

- (void)didFinishSharing;

@end

@interface SSH : NSObject {
    
    UIViewController *rootViewController;
    id<SSHCallbackDelegate> callbackDelegate;
}

@property (nonatomic, assign) UIViewController *rootViewController;
@property (nonatomic, assign) id<SSHCallbackDelegate> callbackDelegate;

+ (SSH *)currentHelper;
+ (void)setRootViewController:(UIViewController *)aViewController;
+ (void)setCallbackDelegate:(id<SSHCallbackDelegate>)aCallbackDelegate;

@end
