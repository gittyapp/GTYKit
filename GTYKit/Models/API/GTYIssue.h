//
//  GTYIssue.h
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYObject.h"

@class GTYMilestone;
@class GTYPullRequest;
@class GTYRepository;
@class GTYUser;

@interface GTYIssue : GTYObject

@property (nonatomic, strong) NSURL *htmlURL;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *body;
@property (nonatomic, strong) GTYUser *user;
@property (nonatomic, strong) NSMutableArray *labels;
@property (nonatomic, strong) GTYUser *assignee;
@property (nonatomic, strong) GTYMilestone *milestone;
@property (nonatomic, strong) NSDate *closedAt;
@property (nonatomic) NSInteger commentsCount;
@property (nonatomic, strong) GTYRepository *repository;
@property (nonatomic) BOOL isPullRequest;
@property (nonatomic, strong) NSMutableArray *comments;
@property (nonatomic, strong) NSMutableArray *events;
@property (nonatomic, strong) GTYPullRequest *pullRequest;

@property (nonatomic) BOOL canEdit;

- (BOOL)hasComments;

- (BOOL)isClosed;

- (BOOL)isLabeled;

- (BOOL)isNew;

- (BOOL)isOpen;

- (BOOL)isMerged;

- (NSString *)commentsPath;

- (NSString *)eventsPath;

- (NSMutableArray *)activities;

- (NSString *)meta;

- (NSDictionary *)toParams;

@end
