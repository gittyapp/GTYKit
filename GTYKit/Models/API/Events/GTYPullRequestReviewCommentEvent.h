//
//  GTYPullRequestReviewCommentEvent.h
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYEvent.h"

@class GTYIssueComment;

@interface GTYPullRequestReviewCommentEvent : GTYEvent

@property (nonatomic, strong) GTYIssueComment *comment;

@end
