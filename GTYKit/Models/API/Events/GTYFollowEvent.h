//
//  GTYFollowEvent.h
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYEvent.h"

@class GTYUser;

@interface GTYFollowEvent : GTYEvent

@property (nonatomic, strong) GTYUser *followedUser;

@end
