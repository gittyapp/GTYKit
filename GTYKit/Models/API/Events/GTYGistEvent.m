//
//  GTYGistEvent.m
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYGistEvent.h"

#import "GTYGist.h"

#import "GTYRouterBase.h"
#import "GTYUser.h"

@implementation GTYGistEvent

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super initWithDictionary:dictionary]) {
		NSDictionary *payload = [dictionary mps_dictionaryForKey:@"payload"];
		self.action = [payload mps_stringForKey:@"action"];
		self.gist = [[GTYGist alloc] initWithDictionary:[payload mps_dictionaryForKey:@"gist"]];
	}
	return self;
}

- (id)initWithFauxData {
	if (self = [super initWithFauxData]) {
		
	}
	return self;
}

- (NSString *)title {
	NSString *action = @"";
	if ([self.action isEqualToString:@"create"]) {
		action = @"created";
	} else if ([self.action isEqualToString:@"update"]) {
		action = @"updated";
	}
	
	return [NSString stringWithFormat:@"%@ %@ gist: %@", self.actor.login, action, self.gist.objectID];
}

- (NSArray *)ranges {
	NSMutableArray *mutableRanges = [[super ranges] mutableCopy];
	
    if (self.gist && self.gist.objectID) {
		NSString *gistTitle = [NSString stringWithFormat:@"gist: %@", self.gist.objectID];
        NSRange range = [self.title rangeOfString:gistTitle options:NSLiteralSearch];
		[mutableRanges addObject:[NSValue valueWithRange:range]];
    }
	
	return mutableRanges;
}

- (NSArray *)urls {
	NSMutableArray *mutableURLs = [[super urls] mutableCopy];
	
    if (self.gist && self.gist.objectID) {
		NSString *url = [NSString stringWithFormat:@"https://gist.github.com/%@/%@", self.actor.login, self.gist.objectID];		
        [mutableURLs addObject:[NSURL URLWithString:url]];
    }
	
	return mutableURLs;
}

@end
