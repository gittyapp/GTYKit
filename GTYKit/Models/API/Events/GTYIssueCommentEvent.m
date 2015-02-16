//
//  GTYIssueCommentEvent.m
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYIssueCommentEvent.h"

#import "GTYIssue.h"
#import "GTYIssueComment.h"
#import "GTYRepository.h"

#import "GTYRouterBase.h"
#import "GTYUser.h"

@implementation GTYIssueCommentEvent

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super initWithDictionary:dictionary]) {
		NSDictionary *payload = [dictionary mps_dictionaryForKey:@"payload"];
		self.action = [payload mps_stringForKey:@"action"];
		self.issue = [[GTYIssue alloc] initWithDictionary:[payload mps_dictionaryForKey:@"issue"]];
		self.comment = [[GTYIssueComment alloc] initWithDictionary:[payload mps_dictionaryForKey:@"comment"]];
	}
	return self;
}

- (id)initWithFauxData {
	if (self = [super initWithFauxData]) {
		
	}
	return self;
}

- (NSString *)title {
	NSString *issueType = self.issue.isPullRequest ? NSLocalizedString(@"pull request", nil) : @"issue";
	return [NSString stringWithFormat:@"%@ %@ %@ %@/#%@", self.actor.login, NSLocalizedString(@"commented on", nil), issueType, self.repository.name, self.issue.objectID];
}

- (NSArray *)ranges {
	NSMutableArray *mutableRanges = [[super ranges] mutableCopy];
	
	if (self.issue.objectID && self.issue.title) {
		NSString *stringRange = [NSString stringWithFormat:@"%@/#%@", self.repository.name, self.issue.objectID];
        NSRange range = [self.title rangeOfString:stringRange options:NSLiteralSearch];
		[mutableRanges addObject:[NSValue valueWithRange:range]];
	}
	
	return mutableRanges;
}

- (NSArray *)urls {
	NSMutableArray *mutableURLs = [[super urls] mutableCopy];
	
	if (self.issue.objectID && self.issue.title) {
        [mutableURLs addObject:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/%@", kIssuesRoutePrefix, self.repository.name, self.issue.objectID]]];
	}
	
	return mutableURLs;
}

@end
