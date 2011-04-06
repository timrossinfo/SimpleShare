//
//  SSHTwitterViewController.m
//  SimpleShare
//
//  Created by Timothy Ross on 06/04/2011.
//  Copyright 2011 Blue Key Digital Limited. All rights reserved.
//

#import "SSHTwitterViewController.h"
#import "SSH.h"
#import "SSHConfig.h"
#import "NSString+URLEscape.h"

@interface SSHTwitterViewController()

@property (nonatomic, retain) UIWebView *webView;

@end

@implementation SSHTwitterViewController

@synthesize webView;

- (id)init {
    
    if ((self = [super init])) {
        
        self.title = @"Share on Twitter";
        
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
    
    NSString *twitterUrlString = [NSString stringWithFormat:@"http://twitter.com/share?text=%@", [TWITTER_TEXT urlEscape]];
    NSURL *url = [NSURL URLWithString:twitterUrlString];
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
    [[[SSH currentHelper] callbackDelegate] didFinishSharing];
}

@end
