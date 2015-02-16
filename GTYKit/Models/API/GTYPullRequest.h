//
//  GTYPullRequest.h
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYObject.h"

@class GTYRepository;
@class GTYStatus;

@interface GTYPullRequest : GTYObject<NSCoding>

@property (nonatomic, strong) NSURL *htmlURL;

@property (nonatomic) BOOL isMerged;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) GTYRepository *repository;

@property (nonatomic, strong) GTYRepository *headRepository;

@property (nonatomic, strong) NSMutableArray *commits;

@property (nonatomic, strong) NSMutableArray *files;

@property (nonatomic) BOOL isMergeable;

@property (nonatomic, strong) NSMutableDictionary *sourceCommits;

@property (nonatomic, strong) NSMutableArray *sortedCommits;

@property (nonatomic, strong) NSString *baseRef;

@property (nonatomic, strong) NSString *headRef;

@property (nonatomic, strong) NSString *headSha;

@property (nonatomic, strong) GTYStatus *status;

- (NSString *)commitsPath;

- (NSString *)filesPath;

- (void)groupCommits;

@end
