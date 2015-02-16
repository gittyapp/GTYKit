//
//  NSString+GTYAdditions.m
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "NSString+GTYAdditions.h"

#import "NSDictionary+MPSAdditions.h"

@implementation NSString (GTYAdditions)

- (NSString *)stringBetweenString:(NSString *)start andString:(NSString *)end {
    NSScanner* scanner = [NSScanner scannerWithString:self];
    [scanner setCharactersToBeSkipped:nil];
    [scanner scanUpToString:start intoString:NULL];
    if ([scanner scanString:start intoString:NULL]) {
        NSString* result = nil;
        if ([scanner scanUpToString:end intoString:&result]) {
            return result;
        }
    }
    return nil;
}

- (NSString *)stringByEscapingForURLArgument {
    // Encode all the reserved characters, per RFC 3986
    // (<http://www.ietf.org/rfc/rfc3986.txt>)
    CFStringRef escaped =
    CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                            (CFStringRef)self,
                                            NULL,
                                            (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                            kCFStringEncodingUTF8);
    return (NSString *) CFBridgingRelease(escaped);
}

- (NSString *)gty_smallSha {
	NSString *commitID = @"";
	if (self && self.length >= 8) {
		commitID = [self substringToIndex:7];
	}
	return commitID;
}

- (NSString *)gty_compareSha {
	NSString *commitID = @"";
	if (self && self.length >= 11) {
		commitID = [self substringToIndex:10];
	}
	return commitID;
}

@end
