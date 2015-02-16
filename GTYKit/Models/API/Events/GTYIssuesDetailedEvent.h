//
//  GTYIssuesDetailedEvent.h
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYEvent.h"

@class GTYIssue;
@class GTYUser;

@interface GTYIssuesDetailedEvent : GTYEvent

@property (nonatomic, strong) NSString *action;

@property (nonatomic, strong) GTYUser *actor;

@property (nonatomic, strong) NSString *commitID;

@property (nonatomic, strong) GTYIssue *issue; // Not in JSON

@property (nonatomic, strong) NSString *baseRef;

@property (nonatomic, strong) NSString *headRef;

- (BOOL)isAssigned;

- (BOOL)isClosed;

- (BOOL)isDeleted;

- (BOOL)isDemilestoned;

- (BOOL)isLabeled;

- (BOOL)isLocked;

- (BOOL)isMentioned;

- (BOOL)isMerged;

- (BOOL)isMilestoned;

- (BOOL)isReferenced;

- (BOOL)isRenamed;

- (BOOL)isReopened;

- (BOOL)isRestored;

- (BOOL)isSubscribed;

- (BOOL)isUnassigned;

- (BOOL)isUnknown;

- (BOOL)isUnlabeled;

- (BOOL)isUnlocked;

- (BOOL)couldContainCommitLink;

- (BOOL)hasBaseRef;

- (BOOL)hasHeadRef;

@end
