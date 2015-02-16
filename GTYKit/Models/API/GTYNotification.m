//
//  GTYNotification.m
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYNotification.h"

#import "GTYCommit.h"
#import "GTYIssue.h"
#import "GTYPullRequest.h"
#import "GTYRepository.h"

#import "GTYRouterBase.h"
#import "GTYUser.h"

@implementation GTYNotification

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super initWithDictionary:dictionary]) {
		NSDictionary *repositoryDictionary = [dictionary mps_dictionaryForKey:@"repository"];
		self.repository = [[GTYRepository alloc] initWithDictionary:repositoryDictionary];
		
		self.lastReadAtDate = [dictionary mps_dateForKey:@"last_read_at"];
		self.read = [dictionary mps_boolForKey:@"unread"] ? ![dictionary mps_boolForKey:@"unread"] : NO;
		
		NSDictionary *subjectDictionary = [dictionary mps_dictionaryForKey:@"subject"];
		self.title = [subjectDictionary mps_stringForKey:@"title"];
		self.subjectType = [subjectDictionary mps_stringForKey:@"type"];
		
		NSString *subjectURL = [subjectDictionary mps_stringForKey:@"url"];
		
		if ([self.subjectType isEqualToString:@"PullRequest"]) {
			GTYPullRequest *pullRequest = [[GTYPullRequest alloc] init];
			pullRequest.repository = self.repository;
			pullRequest.objectID = [subjectURL lastPathComponent];
			pullRequest.title = self.title;
			self.subject = pullRequest;
		} else if ([self.subjectType isEqualToString:@"Issue"]) {
			GTYIssue *issue = [[GTYIssue alloc] init];
							   issue.repository = self.repository;
			issue.objectID = [subjectURL lastPathComponent];
			issue.title = self.title;
			self.subject = issue;
		} else if ([self.subjectType isEqualToString:@"Commit"]) {
			GTYCommit *commit = [[GTYCommit alloc] init];
			commit.repository = self.repository;
			commit.sha = [subjectURL lastPathComponent];
			commit.message = self.title;
			self.subject = commit;
		}
	}
	return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	
    [aCoder encodeObject:[self encodeDate:self.lastReadAtDate] forKey:@"lastReadAtDate"];
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.subjectType forKey:@"subjectType"];
    [aCoder encodeBool:self.read forKey:@"read"];
	[aCoder encodeObject:self.repository forKey:@"repository"];
	[aCoder encodeObject:self.subject forKey:@"subject"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.lastReadAtDate = [self decodeDateString:[aDecoder decodeObjectForKey:@"lastReadAtDate"]];
		self.title = [aDecoder decodeObjectForKey:@"title"];
		self.subjectType = [aDecoder decodeObjectForKey:@"subjectType"];
		self.read = [aDecoder decodeBoolForKey:@"read"];
		self.repository = [aDecoder decodeObjectForKey:@"repository"];
		self.subject = [aDecoder decodeObjectForKey:@"subject"];
	}
	return self;
}

- (NSString *)subjectRoute {
	NSString *route = @"";
	
	if ([self.subjectType isEqualToString:@"PullRequest"]) {
		GTYPullRequest *pullRequest = (GTYPullRequest *)self.subject;
		route = [NSString stringWithFormat:@"%@/%@/%@/%@", kPullRequestsRoutePrefix, pullRequest.repository.owner.login, pullRequest.repository.name, pullRequest.objectID];
	} else if ([self.subjectType isEqualToString:@"Issue"]) {
		GTYIssue *issue = (GTYIssue *)self.subject;
		route = [NSString stringWithFormat:@"%@/%@/%@/%@", kIssuesRoutePrefix, issue.repository.owner.login, issue.repository.name, issue.objectID];
	} else if ([self.subjectType isEqualToString:@"Commit"]) {
		GTYCommit *commit = (GTYCommit *)self.subject;		
		route = [NSString stringWithFormat:@"%@/%@/%@/%@", kCommitsRoutePrefix, commit.repository.owner.login, commit.repository.name, commit.sha];
	}
	
	return route;
}

@end
