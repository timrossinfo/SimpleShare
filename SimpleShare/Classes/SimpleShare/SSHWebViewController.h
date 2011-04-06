//
//  SSHWebViewController.h
//  SimpleShare
//
//  Created by Timothy Ross on 06/04/2011.
//  Copyright 2011 Blue Key Digital Limited. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSHWebViewController : UIViewController <UIWebViewDelegate> {
    
    UIWebView *webView;
    UIActivityIndicatorView *activityIndicator;
}

- (void)requestURL:(NSURL *)aUrl;

@end
