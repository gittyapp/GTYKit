//
//  GTYRepository.h
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYObject.h"

@class GTYBlob;
@class GTYUser;

@interface GTYRepository : GTYObject<NSCoding>

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) GTYUser *owner;

@property (nonatomic, strong) NSString *fullName;

@property (nonatomic, strong) NSString *language;

@property (nonatomic, strong) NSString *repositoryDescription;

@property (nonatomic) NSInteger stars;

@property (nonatomic) NSInteger forks;

@property (nonatomic) BOOL isPrivate;

@property (nonatomic, strong) GTYBlob *readmeFile;

@property (nonatomic, strong) NSArray *branches;

@property (nonatomic) BOOL hasDownloads;

@property (nonatomic) BOOL hasIssues;

@property (nonatomic) BOOL hasWiki;

@property (nonatomic, strong) NSString *website;

@property (nonatomic) BOOL currentUserHasStarred;

@property (nonatomic) BOOL currentUserIsWatching;

@property (nonatomic) BOOL canEdit;

@property (nonatomic, strong) NSURL *htmlURL;

@property (nonatomic) BOOL isFork;

@property (nonatomic, strong) GTYRepository *parent;

- (NSString *)meta;

- (NSString *)branchesPath;

- (NSString *)collaboratorsPath;

- (NSString *)commitsPath;

- (NSString *)readmePath;

- (NSString *)starredPath;

- (NSString *)subscribedPath;

- (NSString *)fullDescription;

@end
