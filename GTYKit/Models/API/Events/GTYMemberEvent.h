//
//  GTYMemberEvent.h
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYEvent.h"

@class GTYUser;

@interface GTYMemberEvent : GTYEvent

@property (nonatomic, strong) NSString *action;

@property (nonatomic, strong) GTYUser *member;

@end
