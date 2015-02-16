//
//  NSString+GTYAdditions.h
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (GTYAdditions)

- (NSString *)stringBetweenString:(NSString *)start andString:(NSString *)end;

// https://github.com/joshaber/Marketplace/blob/master/Classes/NSString%2BAdditions.m#L18
- (NSString *)stringByEscapingForURLArgument;

- (NSString *)gty_smallSha;

- (NSString *)gty_compareSha;

@end
