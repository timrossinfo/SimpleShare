//
//  SSHTwitterViewController.m
//  SimpleShare
//
//  Created by Timothy Ross on 06/04/2011.
//  Copyright 2011 Blue Key Digital Limited. All rights reserved.
//

#import "SSHTwitterViewController.h"
#import "SSHConfig.h"

@interface SSHTwitterViewController()

@property (nonatomic, retain) UIWebView *webView;

@end

@implementation SSHTwitterViewController

@synthesize webView;

- (id)init {
    
    if ((self = [super init])) {
        
        self.title = @"Share on Twitter";
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done)];
    }
    return self;
}

- (NSString *)urlEscape:(NSString *)urlString {
    
    return [urlString stringByAddingPercentEscapesUsingEncoding:
     NSASCIIStringEncoding];
}

- (void)viewDidLoad {
    
    UIWebView *wv = [[UIWebView alloc] initWithFrame:self.view.bounds];
    self.webView = wv;
    [wv release];
    [self.webView setDelegate:self];
    [self.view addSubview:self.webView];
    
    NSString *twitterUrlString = [NSString stringWithFormat:@"http://twitter.com/share?text=%@", [self urlEscape:TWITTER_TEXT]];
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
}

@end
