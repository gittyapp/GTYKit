//
//  GTYPullRequestEvent.h
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYEvent.h"

@class GTYPullRequest;

@interface GTYPullRequestEvent : GTYEvent

@property (nonatomic, strong) NSString *action;

@property (nonatomic) NSInteger number;

@property (nonatomic, strong) GTYPullRequest *pullRequest;

@end
