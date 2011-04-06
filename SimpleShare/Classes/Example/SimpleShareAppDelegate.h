//
//  SimpleShareAppDelegate.h
//  SimpleShare
//
//  Created by Timothy Ross on 06/04/2011.
//

#import <UIKit/UIKit.h>

@interface SimpleShareAppDelegate : NSObject <UIApplicationDelegate> {

    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end
