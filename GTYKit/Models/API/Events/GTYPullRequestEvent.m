//
//  GTYPullRequestEvent.m
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYPullRequestEvent.h"

#import "GTYPullRequest.h"
#import "GTYRepository.h"

#import "GTYRouterBase.h"
#import "GTYUser.h"

@implementation GTYPullRequestEvent

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super initWithDictionary:dictionary]) {
		NSDictionary *payload = [dictionary mps_dictionaryForKey:@"payload"];
		self.action = [payload mps_stringForKey:@"action"];
		self.number = [payload mps_integerForKey:@"number"];
		self.pullRequest = [[GTYPullRequest alloc] initWithDictionary:[payload mps_dictionaryForKey:@"pull_request"]];
	}
	return self;
}

- (id)initWithFauxData {
	if (self = [super initWithFauxData]) {
		
	}
	return self;
}

- (NSString *)title {
	NSString *action = self.action;
	if ([self.action isEqualToString:@"closed"] && self.pullRequest.isMerged) {
		action = @"merged";
	}
	return [NSString stringWithFormat:@"%@ %@ pull request %@#%@", self.actor.login, action, self.repository.name, self.pullRequest.objectID];
}

- (NSArray *)ranges {
	NSMutableArray *mutableRanges = [[super ranges] mutableCopy];
		
	if (self.repository && self.repository.name && self.pullRequest && self.pullRequest.objectID) {
		NSString *stringRange = [NSString stringWithFormat:@"%@#%@", self.repository.name, self.pullRequest.objectID];
        NSRange range = [self.title rangeOfString:stringRange options:NSLiteralSearch];
		[mutableRanges addObject:[NSValue valueWithRange:range]];
	}
	
	return mutableRanges;
}

- (NSArray *)urls {
	NSMutableArray *mutableURLs = [[super urls] mutableCopy];
	
	if (self.repository && self.repository.name && self.pullRequest && self.pullRequest.objectID) {
        [mutableURLs addObject:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/%@", kPullRequestsRoutePrefix, self.repository.name, self.pullRequest.objectID]]];
	}
	
	return mutableURLs;
}

@end
