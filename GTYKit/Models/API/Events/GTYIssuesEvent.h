//
//  GTYIssuesEvent.h
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYEvent.h"

@class GTYIssue;
@class GTYUser;

@interface GTYIssuesEvent : GTYEvent

@property (nonatomic, strong) NSString *action;

@property (nonatomic, strong) GTYUser *actor;

@property (nonatomic, strong) NSString *commitID;

@property (nonatomic, strong) GTYIssue *issue; // Not in JSON

@end
