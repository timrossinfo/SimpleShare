//
//  SSHFacebookViewController.m
//  SimpleShare
//
//  Created by Timothy Ross on 06/04/2011.
//  Copyright 2011 Blue Key Digital Limited. All rights reserved.
//

#import "SSHFacebookViewController.h"
#import "SSHConfig.h"
#import "NSString+URLEscape.h"

@interface SSHFacebookViewController()

@property (nonatomic, retain) UIWebView *webView;

@end

@implementation SSHFacebookViewController

@synthesize webView;

- (id)init {
    
    if ((self = [super init])) {
        
        self.title = @"Share on Facebook";
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done)];
    }
    return self;
}

- (void)viewDidLoad {
    
    CGSize contentSize = self.view.bounds.size;
    CGSize navbarSize = self.navigationController.navigationBar.bounds.size;
    UIWebView *wv = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, contentSize.width, contentSize.height-navbarSize.height)];
    self.webView = wv;
    [wv release];
    [self.webView setDelegate:self];
    [self.view addSubview:self.webView];
    
    NSString *facebookUrlString = [NSString stringWithFormat:@"http://www.facebook.com/dialog/feed?app_id=%@&redirect_uri=http://facebook.com/?sk=lf&link=%@&display=touch", FACEBOOK_APP_ID, [FACEBOOK_LINK urlEscape]];
    NSURL *url = [NSURL URLWithString:facebookUrlString];
	NSURLRequest *request = [NSURLRequest requestWithURL:url];
	[self.webView loadRequest:request];
    
    [super viewDidLoad];
}

- (void)viewDidUnload {
    
    self.webView = nil;
    [super viewDidUnload];
}

- (void)dealloc {
    
    [webView release];
    [super dealloc];
}

- (void)done {
    
    [self dismissModalViewControllerAnimated:YES];
}

@end
