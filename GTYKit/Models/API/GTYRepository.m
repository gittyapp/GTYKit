//
//  GTYRepository.m
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYRepository.h"

#import "GTYUser.h"

@implementation GTYRepository

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super initWithDictionary:dictionary]) {
		self.name = [dictionary mps_stringForKey:@"name"];
		
		self.owner = [[GTYUser alloc] initWithDictionary:[dictionary mps_dictionaryForKey:@"owner"]];
		
		self.fullName = [dictionary mps_stringForKey:@"full_name"];
		
		self.language = [dictionary mps_stringForKey:@"language"];
		
		self.repositoryDescription = [dictionary mps_stringForKey:@"description"];
		
		self.stars = [dictionary mps_integerForKey:@"watchers"];
		
		self.forks = [dictionary mps_integerForKey:@"forks"];
		
		self.isPrivate = [dictionary mps_boolForKey:@"private"];
		
		self.hasDownloads = [dictionary mps_boolForKey:@"has_downloads"];
		
		self.hasIssues = [dictionary mps_boolForKey:@"has_issues"];
		
		self.hasWiki = [dictionary mps_boolForKey:@"has_wiki"];
		
		self.website = [dictionary mps_stringForKey:@"homepage"];
		
		NSString *url = [dictionary mps_stringForKey:@"html_url"];
		self.htmlURL = [NSURL URLWithString:url];
		
		self.isFork = [dictionary mps_boolForKey:@"fork"];
		
		NSDictionary *parentRepositoryDictionary = [dictionary mps_dictionaryForKey:@"parent"];
		
		if (parentRepositoryDictionary.allKeys.count == 0) {
			parentRepositoryDictionary = [dictionary mps_dictionaryForKey:@"source"];
		}
		
		if (parentRepositoryDictionary.allKeys.count > 0) {
			self.parent = [[GTYRepository alloc] initWithDictionary:parentRepositoryDictionary];
		}
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
	
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.owner forKey:@"owner"];
    [aCoder encodeObject:self.fullName forKey:@"fullName"];
    [aCoder encodeObject:self.language forKey:@"language"];
    [aCoder encodeObject:self.repositoryDescription forKey:@"repositoryDescription"];
	[aCoder encodeBool:self.isPrivate forKey:@"isPrivate"];
	[aCoder encodeBool:self.hasDownloads forKey:@"hasDownloads"];
	[aCoder encodeBool:self.hasIssues forKey:@"hasIssues"];
	[aCoder encodeBool:self.hasWiki forKey:@"hasWiki"];
    [aCoder encodeObject:self.website forKey:@"website"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.name = [aDecoder decodeObjectForKey:@"name"];
		self.owner = [aDecoder decodeObjectForKey:@"owner"];
		self.fullName = [aDecoder decodeObjectForKey:@"fullName"];
		self.language = [aDecoder decodeObjectForKey:@"language"];
		self.repositoryDescription = [aDecoder decodeObjectForKey:@"repositoryDescription"];
		self.isPrivate = [aDecoder decodeBoolForKey:@"isPrivate"];
		self.hasDownloads = [aDecoder decodeBoolForKey:@"hasDownloads"];
		self.hasIssues = [aDecoder decodeBoolForKey:@"hasIssues"];
		self.hasWiki = [aDecoder decodeBoolForKey:@"hasWiki"];
		self.website = [aDecoder decodeObjectForKey:@"website"];
	}
	return self;
}

- (NSString *)meta {
	return [NSString stringWithFormat:@"%@/%@", self.owner.login, self.name];
}

- (NSString *)branchesPath {
	return [NSString stringWithFormat:@"repos/%@/branches", self.meta];
}

- (NSString *)collaboratorsPath {
	return [NSString stringWithFormat:@"repos/%@/collaborators", self.meta];
}

- (NSString *)commitsPath {
	return [NSString stringWithFormat:@"repos/%@/commits", self.meta];
}

- (NSString *)readmePath {
	return [NSString stringWithFormat:@"repos/%@/readme", self.meta];
}

- (NSString *)starredPath {
	return [NSString stringWithFormat:@"user/starred/%@", self.meta];
}

- (NSString *)subscribedPath {
	return [NSString stringWithFormat:@"repos/%@/subscription", self.meta];
}

- (NSString *)fullDescription {
	NSString *fullDescription = @"";
	
	if (![self.website isEqualToString:@""]) {
		if (![fullDescription isEqualToString:@""]) {
			fullDescription = [fullDescription stringByAppendingString:@"\n"];
		}
		fullDescription = [fullDescription stringByAppendingString:self.website];
	}
	
	if (![self.repositoryDescription isEqualToString:@""]) {
		if (![fullDescription isEqualToString:@""]) {
			fullDescription = [fullDescription stringByAppendingString:@"\n"];
		}
		fullDescription = [fullDescription stringByAppendingString:self.repositoryDescription];
	}
	
	return fullDescription;
}

@end
