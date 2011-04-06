//
//  SSH.h
//  SimpleShare
//
//  Created by Timothy Ross on 06/04/2011.
//  Copyright 2011 Blue Key Digital Limited. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SSH : NSObject {
    
    UIViewController *rootViewController;
}

@property (nonatomic, assign) UIViewController *rootViewController;

+ (SSH *)currentHelper;
+ (void)setRootViewController:(UIViewController *)aViewController;

@end