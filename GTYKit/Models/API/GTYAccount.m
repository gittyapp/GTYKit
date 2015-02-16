//
//  GTYAccount.m
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYAccount.h"

#import "GTYPlan.h"

@implementation GTYAccount

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super initWithDictionary:dictionary]) {
		self.login = [dictionary mps_stringForKey:@"login"];
		self.email = [dictionary mps_stringForKey:@"email"];
		self.name = [dictionary mps_stringForKey:@"name"];
		self.company = [dictionary mps_stringForKey:@"company"];
		self.blog = [dictionary mps_stringForKey:@"blog"];
		self.location = [dictionary mps_stringForKey:@"location"];
		self.publicRepoCount = [dictionary mps_integerForKey:@"public_repos"];
		self.collaborators = [dictionary mps_integerForKey:@"collaborators"];
		self.diskUsage = [dictionary mps_integerForKey:@"disk_usage"];
		self.privateRepoCount = [dictionary mps_integerForKey:@"owned_private_repos"];
	
		NSString *avatarURL = [dictionary mps_stringForKey:@"avatar_url"];
		self.avatarURL = [NSURL URLWithString:avatarURL];
		
		self.plan = [[GTYPlan alloc] initWithDictionary:[dictionary mps_dictionaryForKey:@"plan"]];
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
	
    [aCoder encodeObject:self.login forKey:@"login"];
    [aCoder encodeObject:self.email forKey:@"email"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.company forKey:@"company"];
    [aCoder encodeObject:self.blog forKey:@"blog"];
    [aCoder encodeInteger:self.publicRepoCount forKey:@"publicRepoCount"];
    [aCoder encodeInteger:self.collaborators forKey:@"collaborators"];
    [aCoder encodeInteger:self.diskUsage forKey:@"diskUsage"];
    [aCoder encodeInteger:self.privateRepoCount forKey:@"privateRepoCount"];
	[aCoder encodeObject:self.avatarURL forKey:@"avatarURL"];
	[aCoder encodeObject:self.plan forKey:@"plan"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.login = [aDecoder decodeObjectForKey:@"login"];
		self.email = [aDecoder decodeObjectForKey:@"email"];
		self.name = [aDecoder decodeObjectForKey:@"name"];
		self.company = [aDecoder decodeObjectForKey:@"company"];
		self.blog = [aDecoder decodeObjectForKey:@"blog"];
		self.publicRepoCount = [aDecoder decodeIntegerForKey:@"publicRepoCount"];
		self.collaborators = [aDecoder decodeIntegerForKey:@"collaborators"];
		self.diskUsage = [aDecoder decodeIntegerForKey:@"diskUsage"];
		self.privateRepoCount = [aDecoder decodeIntegerForKey:@"privateRepoCount"];
		self.avatarURL = [aDecoder decodeObjectForKey:@"avatarURL"];
		self.plan = [aDecoder decodeObjectForKey:@"plan"];
	}
	return self;
}

- (NSString *)bio {
	NSString *bio = @"";
	
	if (![self.location isEqualToString:@""]) {
		if (![bio isEqualToString:@""]) {
			bio = [bio stringByAppendingString:@"\n"];
		}
		bio = [bio stringByAppendingString:self.location];
	}
	
	if (![self.company isEqualToString:@""]) {
		if (![bio isEqualToString:@""]) {
			bio = [bio stringByAppendingString:@"\n"];
		}
		bio = [bio stringByAppendingString:self.company];
	}
	
	if (![self.blog isEqualToString:@""]) {
		if (![bio isEqualToString:@""]) {
			bio = [bio stringByAppendingString:@"\n"];
		}
		bio = [bio stringByAppendingString:self.blog];
	}
	
	return bio;
}

@end
