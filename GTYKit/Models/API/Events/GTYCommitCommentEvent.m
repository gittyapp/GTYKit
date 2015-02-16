//
//  GTYCommitCommentEvent.m
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYCommitCommentEvent.h"

#import "GTYCommitComment.h"
#import "GTYOrganization.h"
#import "GTYRepository.h"
#import "GTYRouterBase.h"
#import "GTYUser.h"
#import "NSString+GTYAdditions.h"

@implementation GTYCommitCommentEvent

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super initWithDictionary:dictionary]) {
		NSDictionary *payload = [dictionary mps_dictionaryForKey:@"payload"];
		self.comment = [[GTYCommitComment alloc] initWithDictionary:[payload mps_dictionaryForKey:@"comment"]];
	}
	return self;
}

- (id)initWithFauxData {
	if (self = [super initWithFauxData]) {
		
	}
	return self;
}

- (NSString *)commitID {
	return [self.comment.commitID gty_smallSha];
}

- (NSString *)title {
	NSString *commitID = self.commitID;
	return [NSString stringWithFormat:@"%@ commented on %@ at %@", self.actor.login, commitID, self.repository.name];
}

- (NSArray *)ranges {
	NSMutableArray *mutableRanges = [[super ranges] mutableCopy];
	
    if (self.repository && self.repository.name) {
        NSRange range = [self.title rangeOfString:self.repository.name options:NSLiteralSearch];
		[mutableRanges addObject:[NSValue valueWithRange:range]];
    }
	
	if (self.commitID) {
		NSRange range = [self.title rangeOfString:[NSString stringWithFormat:@"%@", self.commitID]];
		[mutableRanges addObject:[NSValue valueWithRange:range]];
	}
	
	return mutableRanges;
}

- (NSArray *)urls {
	NSMutableArray *mutableURLs = [[super urls] mutableCopy];
	
    if (self.repository && self.repository.name) {
        [mutableURLs addObject:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@", kReposRoutePrefix, self.repository.name]]];
    }
	
	if (self.commitID) {
		[mutableURLs addObject:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/%@", kCommitsRoutePrefix, self.repository.name, self.commitID]]];
	}
	
	return mutableURLs;
}

@end
