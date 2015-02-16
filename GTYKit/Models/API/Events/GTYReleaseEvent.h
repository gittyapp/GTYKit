//
//  GTYReleaseEvent.h
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYEvent.h"

@class GTYRelease;

@interface GTYReleaseEvent : GTYEvent

@property (nonatomic, strong) NSString *action;

@property (nonatomic, strong) GTYRelease *theRelease;

@end
