//
//  GTYCommit.h
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYObject.h"

@class GTYRepository;
@class GTYUser;

@interface GTYCommit : GTYObject

@property (nonatomic, strong) GTYRepository *repository;

@property (nonatomic, strong) NSString *sha;

@property (nonatomic, strong) NSString *message;

@property (nonatomic, strong) NSURL *treeURL;

// The SHA of the tree that this commit points to.
@property (nonatomic, strong) NSString *treeSHA;

@property (nonatomic, strong) GTYUser *author;

@property (nonatomic, strong) NSDate *authoredDate;

@property (nonatomic, strong) GTYUser *committer;

@property (nonatomic, strong) NSDate *committedDate;

@property (nonatomic, strong) NSMutableArray *files;

- (NSString *)smallSha;

- (NSString *)filesExplanation;

@end
