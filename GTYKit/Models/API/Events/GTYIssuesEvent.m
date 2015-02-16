//
//  GTYIssuesEvent.m
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYIssuesEvent.h"

#import "GTYIssue.h"
#import "GTYRepository.h"
#import "GTYRouterBase.h"
#import "GTYUser.h"
#import "NSString+GTYAdditions.h"

@implementation GTYIssuesEvent

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super initWithDictionary:dictionary]) {
		self.action = [dictionary mps_stringForKey:@"event"];
		
		self.actor = [[GTYUser alloc] initWithDictionary:[dictionary mps_dictionaryForKey:@"actor"]];
		
		self.commitID = [[dictionary mps_stringForKey:@"commit_id"] gty_smallSha];
		
		NSDictionary *payload = [dictionary mps_dictionaryForKey:@"payload"];
		
		if (payload.allKeys.count > 0) {
			self.issue = [[GTYIssue alloc] initWithDictionary:[payload mps_dictionaryForKey:@"issue"]];
			
			self.action = [payload mps_stringForKey:@"action"];
		}
	}
	return self;
}

- (id)initWithFauxData {
	if (self = [super initWithFauxData]) {
		
	}
	return self;
}

- (NSString *)title {
	return [NSString stringWithFormat:@"%@ %@ issue %@/#%@", self.actor.login, self.action, self.repository.name, self.issue.objectID];
}

- (NSArray *)ranges {
	NSMutableArray *mutableRanges = [[super ranges] mutableCopy];
	
	if (self.repository && self.repository.name && self.issue.objectID) {
		NSString *stringRange = [NSString stringWithFormat:@"%@/#%@", self.repository.name, self.issue.objectID];
        NSRange range = [self.title rangeOfString:stringRange options:NSLiteralSearch];
		[mutableRanges addObject:[NSValue valueWithRange:range]];
	}
	
	return mutableRanges;
}

- (NSArray *)urls {
	NSMutableArray *mutableURLs = [[super urls] mutableCopy];
	
	if (self.repository && self.repository.name && self.issue.objectID) {
        [mutableURLs addObject:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/%@", kIssuesRoutePrefix, self.repository.name, self.issue.objectID]]];
	}
	
	return mutableURLs;
}

@end
