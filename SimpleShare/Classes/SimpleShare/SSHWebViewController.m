//
//  SSHWebViewController.m
//  SimpleShare
//
//  Created by Timothy Ross on 06/04/2011.
//  Copyright 2011 Blue Key Digital Limited. All rights reserved.
//

#import "SSHWebViewController.h"
#import "SSH.h"

@interface SSHWebViewController()

@property (nonatomic, retain) UIWebView *webView;
@property (nonatomic, retain) UIActivityIndicatorView *activityIndicator;

@end

@implementation SSHWebViewController

@synthesize webView;
@synthesize activityIndicator;

- (id)init {
    
    if ((self = [super init])) {
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done)];
        
        UIActivityIndicatorView *aiv = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        [aiv startAnimating];
        self.activityIndicator = aiv;
        [aiv release];
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
    
    [super viewDidLoad];
}

- (void)viewDidUnload {
    
    self.webView = nil;
    self.activityIndicator = nil;
    [super viewDidUnload];
}

- (void)dealloc {
    
    [webView release];
    [activityIndicator release];
    [super dealloc];
}

- (void)done {
    
    [self dismissModalViewControllerAnimated:YES];
    [[[SSH currentHelper] callbackDelegate] didFinishSharing];
}

- (void)requestURL:(NSURL *)aUrl {
    
    NSURLRequest *request = [NSURLRequest requestWithURL:aUrl];
    self.view; // not sure why we have to do this?
    [self.webView loadRequest:request];
}

#pragma mark -
#pragma mark UIWebViewDelegate methods

- (void)webViewDidStartLoad:(UIWebView*)webView {
    
    UIBarButtonItem * barButton = [[UIBarButtonItem alloc] initWithCustomView:self.activityIndicator];
    [[self navigationItem] setRightBarButtonItem:barButton];
    [barButton release];
}

- (void)webViewDidFinishLoad:(UIWebView*)webView {
    
    [[self navigationItem] setRightBarButtonItem:nil];
}

@end