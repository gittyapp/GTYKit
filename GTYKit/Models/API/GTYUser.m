//
//  GTYUser.m
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYUser.h"

@implementation GTYUser

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super initWithDictionary:dictionary]) {
		self.gravatarID = [dictionary mps_stringForKey:@"gravatar_id"];
		self.followerCount = [dictionary mps_integerForKey:@"followers"];
		self.followingCount = [dictionary mps_integerForKey:@"following"];		
		self.userType = [[dictionary mps_stringForKey:@"type"] lowercaseString];
	}
	return self;
}

- (id)initWithFauxData {
	if (self = [super initWithFauxData]) {
		
	}
	return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	
    [aCoder encodeObject:self.gravatarID forKey:@"gravatarID"];
    [aCoder encodeInteger:self.followerCount forKey:@"followerCount"];
    [aCoder encodeInteger:self.followingCount forKey:@"followingCount"];
	[aCoder encodeObject:self.userType forKey:@"userType"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.gravatarID = [aDecoder decodeObjectForKey:@"gravatarID"];
		self.followerCount = [aDecoder decodeIntegerForKey:@"followerCount"];
		self.followingCount = [aDecoder decodeIntegerForKey:@"followingCount"];
	}
	return self;
}

- (BOOL)isEqual:(GTYUser *)user {
	if (self == user) return YES;
	if (![user isKindOfClass:self.class]) return NO;
	
//	BOOL equalServers = [user.server isEqual:self.server];
//	if (!equalServers) return NO;
	
	if (self.objectID != nil || user.objectID != nil) return [user.objectID isEqual:self.objectID];
//	if (self.rawLogin != nil || user.rawLogin != nil) return [user.rawLogin isEqual:self.rawLogin];
	
	return [user.login isEqualToString:self.login];
}

- (BOOL)isOrganization {
	return [self.userType isEqualToString:@"organization"];
}

- (BOOL)isUser {
	return !self.isOrganization;
}

- (NSString *)organizationsPath {
	return [NSString stringWithFormat:@"users/%@/orgs?per_page=30", self.login];
}

- (NSString *)authenticatedOrganizationsPath {
	return @"users/orgs?per_page=30";
}

@end
