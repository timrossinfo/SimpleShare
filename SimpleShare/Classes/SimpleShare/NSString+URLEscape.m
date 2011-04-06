//
//  URLHelper.m
//  SimpleShare
//
//  Created by Timothy Ross on 06/04/2011.
//  Copyright 2011 Blue Key Digital Limited. All rights reserved.
//

#import "NSString+URLEscape.h"

@implementation NSString (URLEscape)

- (NSString *)urlEscape {
    
    return [self stringByAddingPercentEscapesUsingEncoding:
            NSASCIIStringEncoding];
}

@end
