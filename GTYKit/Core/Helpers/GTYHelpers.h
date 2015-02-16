//
//  GTYHelpers.h
//  gitty
//
//  Created by Matthew Strickland on 5/28/14.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreGraphics/CoreGraphics.h>

@interface GTYHelpers : NSObject

+ (BOOL)isHandset;
+ (BOOL)isTablet;
+ (CGFloat)screenWidth;

@end
