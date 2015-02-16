//
//  GTYFollowEvent.m
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYFollowEvent.h"


#import "GTYRouterBase.h"
#import "GTYUser.h"

@implementation GTYFollowEvent

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super initWithDictionary:dictionary]) {
		NSDictionary *payload = [dictionary mps_dictionaryForKey:@"payload"];
		self.followedUser = [[GTYUser alloc] initWithDictionary:[payload mps_dictionaryForKey:@"target"]];
	}
	return self;
}

- (id)initWithFauxData {
	if (self = [super initWithFauxData]) {
		
	}
	return self;
}

- (NSString *)title {
	return [NSString stringWithFormat:@"%@ started following %@", self.actor.login, self.followedUser.login];
}

- (NSArray *)ranges {
	NSMutableArray *mutableRanges = [[super ranges] mutableCopy];
	
    if (self.followedUser && self.followedUser.login) {
        NSRange range = [self.title rangeOfString:self.followedUser.login options:NSLiteralSearch];
		[mutableRanges addObject:[NSValue valueWithRange:range]];
    }
	
	return mutableRanges;
}

- (NSArray *)urls {
	NSMutableArray *mutableURLs = [[super urls] mutableCopy];
	
    if (self.followedUser && self.followedUser.login) {
        [mutableURLs addObject:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@", kUsersRoutePrefix, self.followedUser.login]]];
    }
	
	return mutableURLs;
}

@end
