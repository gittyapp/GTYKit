//
//  GTYTeamAddEvent.m
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYTeamAddEvent.h"

#import "GTYRepository.h"
#import "GTYRouterBase.h"
#import "GTYTeam.h"
#import "GTYUser.h"

@implementation GTYTeamAddEvent

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super initWithDictionary:dictionary]) {
		NSDictionary *payload = [dictionary mps_dictionaryForKey:@"payload"];
		self.repository = [[GTYRepository alloc] initWithDictionary:[payload mps_dictionaryForKey:@"repository"]];
		self.team = [[GTYTeam alloc] initWithDictionary:[payload mps_dictionaryForKey:@"team"]];
		self.user = [[GTYUser alloc] initWithDictionary:[payload mps_dictionaryForKey:@"user"]];
	}
	return self;
}

- (id)initWithFauxData {
	if (self = [super initWithFauxData]) {
		
	}
	return self;
}

- (NSString *)title {
	if (self.user && ![self.user.login isEqualToString:@""]) {
		return [NSString stringWithFormat:@"%@ added %@%@", self.actor.login, self.user.login, self.team.title];
	} else {
		return [NSString stringWithFormat:@"%@ added %@%@", self.actor.login, self.repository.name, self.team.title];
	}
}

- (NSArray *)ranges {
	NSMutableArray *mutableRanges = [[super ranges] mutableCopy];
	
    if (self.repository && self.repository.name) {
        NSRange range = [self.title rangeOfString:self.repository.name options:NSLiteralSearch];
		[mutableRanges addObject:[NSValue valueWithRange:range]];
    }
	
	if (self.user && self.user.login) {
        NSRange range = [self.title rangeOfString:self.user.login options:NSLiteralSearch];
		[mutableRanges addObject:[NSValue valueWithRange:range]];
	}
	
	return mutableRanges;
}

- (NSArray *)urls {
	NSMutableArray *mutableURLs = [[super urls] mutableCopy];
	
    if (self.repository && self.repository.name) {
        [mutableURLs addObject:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@", kReposRoutePrefix, self.repository.fullName]]];
    }
	
	if (self.user && self.user.login) {
        [mutableURLs addObject:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@", kUsersRoutePrefix, self.user.login]]];
	}
	
	return mutableURLs;
}

@end
