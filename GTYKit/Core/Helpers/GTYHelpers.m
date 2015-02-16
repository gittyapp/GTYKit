//
//  GTYHelpers.m
//  gitty
//
//  Created by Matthew Strickland on 5/28/14.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYHelpers.h"

#import <UIKit/UIKit.h>

@implementation GTYHelpers

+ (BOOL)isHandset {
	return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone;
}

+ (BOOL)isTablet {
	return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
}

+ (CGFloat)screenWidth {
    if (UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        return [[UIScreen mainScreen] applicationFrame].size.height + [[UIScreen mainScreen] applicationFrame].origin.y;
    }
    return [[UIScreen mainScreen] applicationFrame].size.width;
}

@end
