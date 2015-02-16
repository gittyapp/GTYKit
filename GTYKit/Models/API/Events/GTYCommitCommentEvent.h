//
//  GTYCommitCommentEvent.h
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYEvent.h"

@class GTYCommitComment;

@interface GTYCommitCommentEvent : GTYEvent

@property (nonatomic, strong) GTYCommitComment *comment;

- (NSString *)commitID;

@end
