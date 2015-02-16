//
//  GTYIssueCommentEvent.h
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYEvent.h"

@class GTYIssue;
@class GTYIssueComment;

@interface GTYIssueCommentEvent : GTYEvent

@property (nonatomic, strong) NSString *action;

@property (nonatomic, strong) GTYIssue *issue;

@property (nonatomic, strong) GTYIssueComment *comment;

@end
