//
//  GTYPullRequestReviewCommentEvent.m
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYPullRequestReviewCommentEvent.h"

#import "GTYIssueComment.h"
#import "GTYRepository.h"

#import "GTYRouterBase.h"
#import "GTYUser.h"

@implementation GTYPullRequestReviewCommentEvent

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super initWithDictionary:dictionary]) {
		NSDictionary *payload = [dictionary mps_dictionaryForKey:@"payload"];
		self.comment = [[GTYIssueComment alloc] initWithDictionary:[payload mps_dictionaryForKey:@"comment"]];
	}
	return self;
}

- (id)initWithFauxData {
	if (self = [super initWithFauxData]) {
		
	}
	return self;
}

- (NSString *)pullRequestNumber {
	NSString *pullRequestNumber = [self.comment.pullRequestURL lastPathComponent];
	return pullRequestNumber;
}

- (NSString *)title {
	return [NSString stringWithFormat:@"%@ %@ pull request %@#%@", self.actor.login, NSLocalizedString(@"commented on", nil), self.repository.name, self.pullRequestNumber];
}

- (NSArray *)ranges {
	NSMutableArray *mutableRanges = [[super ranges] mutableCopy];
	
    if (self.repository && self.repository.name && self.pullRequestNumber) {
        NSRange range = [self.title rangeOfString:self.repository.name options:NSLiteralSearch];
		[mutableRanges addObject:[NSValue valueWithRange:range]];
    }
	
	return mutableRanges;
}

- (NSArray *)urls {
	NSMutableArray *mutableURLs = [[super urls] mutableCopy];
	
    if (self.repository && self.repository.name && self.pullRequestNumber) {
        [mutableURLs addObject:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/%@", kPullRequestsRoutePrefix, self.repository.name, self.pullRequestNumber]]];
    }
	
	return mutableURLs;
}

@end
