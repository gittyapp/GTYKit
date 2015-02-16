//
//  GTYUser.h
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYAccount.h"

@class GTYRepository;

@interface GTYUser : GTYAccount<NSCoding>

@property (nonatomic) NSUInteger followerCount;
@property (nonatomic) NSUInteger followingCount;
@property (nonatomic, strong) NSString *gravatarID;
@property (nonatomic, strong) NSString *userType;
@property (nonatomic, strong) NSArray *organizations;

@property (nonatomic, strong) GTYRepository *trendingRepository;

- (BOOL)isOrganization;

- (BOOL)isUser;

- (NSString *)organizationsPath;

- (NSString *)authenticatedOrganizationsPath;

@end
