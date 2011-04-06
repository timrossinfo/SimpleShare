//
//  NSString+URLEscape.m
//  SimpleShare
//
//  Created by Timothy Ross on 06/04/2011.
//

#import "NSString+URLEscape.h"

@implementation NSString (URLEscape)

- (NSString *)urlEscape {
    
    return [self stringByAddingPercentEscapesUsingEncoding:
            NSASCIIStringEncoding];
}

@end
