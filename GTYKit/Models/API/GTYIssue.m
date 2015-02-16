//
//  GTYIssue.m
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYIssue.h"

#import "GTYIssuesDetailedEvent.h"
#import "GTYLabel.h"
#import "GTYMilestone.h"
#import "GTYRepository.h"
#import "GTYUser.h"
#import "NSString+GTYAdditions.h"
#import "NSString+SAMAdditions.h"

@implementation GTYIssue

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super initWithDictionary:dictionary]) {
		self.objectID = [dictionary mps_stringForKey:@"number"];
		
		NSString *url = [dictionary mps_stringForKey:@"html_url"];
		self.htmlURL = [NSURL URLWithString:url];
		
		self.state = [dictionary mps_stringForKey:@"state"];
		self.title = [dictionary mps_stringForKey:@"title"];
		self.body = [dictionary mps_stringForKey:@"body"];
		if (!self.body || [self.body isEqualToString:@""]) {
			self.body = NSLocalizedString(@"No description given.", nil);
		}
		
		NSDictionary *userDictionary = [dictionary mps_dictionaryForKey:@"user"];
		self.user = [[GTYUser alloc] initWithDictionary:userDictionary];
		
		NSDictionary *milestoneDictionary = [dictionary mps_dictionaryForKey:@"milestone"];
		if (milestoneDictionary.allKeys.count > 0) {
			self.milestone = [[GTYMilestone alloc] initWithDictionary:milestoneDictionary];
		}
		
		NSDictionary *assigneeDictionary = [dictionary mps_dictionaryForKey:@"assignee"];
		if (assigneeDictionary.allKeys.count > 0) {
			self.assignee = [[GTYUser alloc] initWithDictionary:assigneeDictionary];
		}
		
		self.closedAt = [dictionary mps_dateForKey:@"closed_at"];
		self.commentsCount = [dictionary mps_integerForKey:@"comments"];
		
		NSMutableArray *mutableLabels = [NSMutableArray array];
		
		for (NSDictionary *labelDictionary in [dictionary mps_arrayForKey:@"labels"]) {
			GTYLabel *label = [[GTYLabel alloc] initWithDictionary:labelDictionary];
			[mutableLabels addObject:label];
		}
		
		self.labels = mutableLabels;
		
		NSDictionary *repositoryDictionary = [dictionary mps_dictionaryForKey:@"repository"];
		self.repository = [[GTYRepository alloc] initWithDictionary:repositoryDictionary];
		
		if ([self.repository.name isEqualToString:@""]) {
			NSString *url = [dictionary mps_stringForKey:@"url"];
			if (url && ![url isEqualToString:@""]) {
				if ([url sam_containsString:@"issues"] && [url sam_containsString:@"repos"]) {
					
					@try {
						NSString *ownerAndName = [url stringBetweenString:@"repos/" andString:@"/issues"];
						NSArray *components = [ownerAndName componentsSeparatedByString:@"/"];
						NSString *owner = components[0];
						NSString *name = components[1];
						
						self.repository.owner.login = owner;
						self.repository.name = name;
					} @catch (NSException *exception) {
						NSLog(@"REPOSITORY OWNER AND NAME PARSING EXCEPTION: %@", exception);
					} @finally {
						
					}
				}
			}
		}
		
		NSDictionary *pullRequestDictionary = [dictionary mps_dictionaryForKey:@"pull_request"];
		NSString *pullRequestUrl = [pullRequestDictionary mps_stringForKey:@"url"];
		if (pullRequestUrl && ![pullRequestUrl isEqualToString:@""]) {
			self.isPullRequest = YES;
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
	
    [aCoder encodeObject:self.htmlURL forKey:@"htmlURL"];
    [aCoder encodeObject:self.state forKey:@"state"];
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.body forKey:@"body"];
    [aCoder encodeObject:self.user forKey:@"user"];
    [aCoder encodeObject:self.milestone forKey:@"milestone"];
    [aCoder encodeObject:self.assignee forKey:@"assignee"];
    [aCoder encodeObject:[self encodeDate:self.closedAt] forKey:@"closedAt"];
    [aCoder encodeInteger:self.commentsCount forKey:@"commentsCount"];
    [aCoder encodeBool:self.isPullRequest forKey:@"isPullRequest"];
    [aCoder encodeObject:self.repository forKey:@"repository"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.htmlURL = [aDecoder decodeObjectForKey:@"htmlURL"];
		self.state = [aDecoder decodeObjectForKey:@"state"];
		self.title = [aDecoder decodeObjectForKey:@"title"];
		self.body = [aDecoder decodeObjectForKey:@"body"];
		self.user = [aDecoder decodeObjectForKey:@"user"];
		self.milestone = [aDecoder decodeObjectForKey:@"milestone"];
		self.assignee = [aDecoder decodeObjectForKey:@"assignee"];
		self.closedAt = [self decodeDateString:[aDecoder decodeObjectForKey:@"closedAt"]];
		self.commentsCount = [aDecoder decodeIntegerForKey:@"commentsCount"];
		self.isPullRequest = [aDecoder decodeBoolForKey:@"isPullRequest"];
		self.repository = [aDecoder decodeObjectForKey:@"repository"];
	}
	return self;
}

- (BOOL)hasComments {
	return self.commentsCount > 0;
}

- (BOOL)isClosed {
	return [self.state isEqualToString:@"closed"];
}

- (BOOL)isLabeled {
	return self.labels.count > 0;
}

- (BOOL)isNew {
	return !self.objectID || [self.objectID isEqualToString:@""];
}

- (BOOL)isOpen {
	return [self.state isEqualToString:@"open"];
}

- (BOOL)isMerged {
	BOOL merged = NO;
	
	if (self.isPullRequest) {
		for (GTYIssuesDetailedEvent *event in self.events) {
			if (event.isMerged) {
				merged = YES;
				break;
			}
		}
	}
	
	return merged;
}

- (NSString *)commentsPath {
	return [NSString stringWithFormat:@"repos/%@/%@/issues/%@/comments", self.repository.owner.login, self.repository.name, self.objectID];
}

- (NSString *)eventsPath {
	return [NSString stringWithFormat:@"repos/%@/%@/issues/%@/events", self.repository.owner.login, self.repository.name, self.objectID];
}

- (NSMutableArray *)activities {
	NSMutableArray *stuff = [NSMutableArray array];
	
	[stuff addObjectsFromArray:self.comments];
	[stuff addObjectsFromArray:self.events];
	
	NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"createdAt" ascending:YES];
	[stuff sortUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
	
	return stuff;
}

- (NSString *)meta {
	return [NSString stringWithFormat:@"#%@ - %@", self.objectID, self.title];
}

- (NSDictionary *)toParams {
	NSMutableDictionary *params = [NSMutableDictionary dictionary];
	[params setObject:self.title forKey:@"title"];
	[params setObject:self.body forKey:@"body"];
	
	if (!self.isNew) {		
		[params setObject:self.assignee ? self.assignee.login : @"" forKey:@"assignee"];
		[params setObject:self.milestone ? self.milestone.objectID : @"" forKey:@"milestone"];
		
		if (self.labels.count > 0) {
			NSMutableArray *labels = [NSMutableArray array];
			
			for (GTYLabel *label in self.labels) {
				[labels addObject:label.name];
			}
			
			[params setObject:labels forKey:@"labels"];
		} else {
			[params setObject:@[] forKey:@"labels"];
		}
		
		[params setObject:self.state forKey:@"state"];
	}
	
	return params;
}

@end
