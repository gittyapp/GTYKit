//
//  GTYMemberEvent.m
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYMemberEvent.h"

#import "GTYRepository.h"

#import "GTYRouterBase.h"
#import "GTYUser.h"

@implementation GTYMemberEvent

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super initWithDictionary:dictionary]) {
		NSDictionary *payload = [dictionary mps_dictionaryForKey:@"payload"];
		self.action = [payload mps_stringForKey:@"action"];
		self.member = [[GTYUser alloc] initWithDictionary:[payload mps_dictionaryForKey:@"member"]];
	}
	return self;
}

- (id)initWithFauxData {
	if (self = [super initWithFauxData]) {
		
	}
	return self;
}

- (NSString *)title {
	return [NSString stringWithFormat:@"%@ %@ %@ to %@", self.actor.login, self.action, self.member.login, self.repository.name];
}

- (NSArray *)ranges {
	NSMutableArray *mutableRanges = [[super ranges] mutableCopy];
	
    if (self.repository && self.repository.name) {
        NSRange range = [self.title rangeOfString:self.repository.name options:NSLiteralSearch];
		[mutableRanges addObject:[NSValue valueWithRange:range]];
    }
	
	if (self.member && self.member.login) {
        NSRange range = [self.title rangeOfString:self.member.login options:NSLiteralSearch];
		[mutableRanges addObject:[NSValue valueWithRange:range]];
	}
	
	return mutableRanges;
}

- (NSArray *)urls {
	NSMutableArray *mutableURLs = [[super urls] mutableCopy];
	
    if (self.repository && self.repository.name) {
        [mutableURLs addObject:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@", kReposRoutePrefix, self.repository.name]]];
    }
	
	if (self.member && self.member.login) {
        [mutableURLs addObject:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@", kUsersRoutePrefix, self.member.login]]];
	}
	
	return mutableURLs;
}

@end
