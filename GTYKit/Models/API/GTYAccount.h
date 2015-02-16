//
//  GTYAccount.h
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYObject.h"

@class GTYPlan;

@interface GTYAccount : GTYObject<NSCoding>

@property (nonatomic, strong) NSString *login;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSURL *avatarURL;
@property (nonatomic, strong) NSString *blog;
@property (nonatomic, strong) NSString *company;
@property (nonatomic, strong) NSString *location;
@property (nonatomic) NSUInteger publicRepoCount;
@property (nonatomic) NSUInteger privateRepoCount;
@property (nonatomic, strong) NSArray *repositories;
@property (nonatomic) NSUInteger diskUsage;
@property (nonatomic) NSUInteger collaborators;

// The plan that this account is on.
@property (nonatomic, strong) GTYPlan *plan;

// Helper property, not returned from API
@property (nonatomic) BOOL currentUserIsFollowing;

- (NSString *)bio;

@end
