//
//  SSHActionSheet.m
//  SimpleShare
//
//  Created by Timothy Ross on 06/04/2011.
//

#import "SSHActionSheet.h"
#import "SSH.h"
#import "SSHConfig.h"
#import "SSHWebViewController.h"
#import "SSHEmailViewController.h"
#import "NSString+URLEscape.h"

@implementation SSHActionSheet

+ (SSHActionSheet *)actionSheet {
    
    SSHActionSheet *actionSheet = [[SSHActionSheet alloc]
								  initWithTitle:nil
								  delegate:nil
								  cancelButtonTitle:@"Cancel"
								  destructiveButtonTitle:nil
								  otherButtonTitles:@"Twitter", @"Facebook", @"Email", nil];
	
	actionSheet.title = @"Share";
    actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
	actionSheet.opaque = YES;
    
    return [actionSheet autorelease];
}

-(void)showEmailView {
    
    SSHEmailViewController *emailController = [[SSHEmailViewController alloc] init];
    
	[[[SSH currentHelper] rootViewController] presentModalViewController:emailController animated:YES];

	[emailController release];
}

- (void)showWebView:(NSString *)aTitle withUrl:(NSURL *)aUrl {
    
    SSHWebViewController *webController = [[SSHWebViewController alloc] init];
    [webController setTitle:aTitle];
    [webController requestURL:aUrl];
    
	UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:webController];
	[[[SSH currentHelper] rootViewController] presentModalViewController:navController animated:YES];
	
	[navController release];
	[webController release];
}

- (void)dismissWithClickedButtonIndex:(NSInteger)buttonIndex animated:(BOOL)animated {
    
    if (buttonIndex == 0) {

        NSString *urlString = [NSString stringWithFormat:@"http://twitter.com/share?text=%@", [TWITTER_TEXT urlEscape]];
        [self showWebView:@"Share on Twitter" withUrl:[NSURL URLWithString:urlString]];
    }
    else if (buttonIndex == 1) {
        
        NSString *urlString = [NSString stringWithFormat:@"http://www.facebook.com/dialog/feed?app_id=%@&redirect_uri=http://facebook.com/?sk=lf&message=%@&link=%@&display=touch", FACEBOOK_APP_ID, [FACEBOOK_MESSAGE urlEscape], [FACEBOOK_LINK urlEscape]];
        [self showWebView:@"Share on Facebook" withUrl:[NSURL URLWithString:urlString]];
    }
    else if (buttonIndex == 2) {
        
        [self showEmailView];
    }
    else if(buttonIndex == [self cancelButtonIndex])
    {
        [[[SSH currentHelper] callbackDelegate] didFinishSharing];
    }
	
	[super dismissWithClickedButtonIndex:buttonIndex animated:animated];
}

@end
