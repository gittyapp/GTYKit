//
//  GTYWatchEvent.m
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYWatchEvent.h"

#import "GTYRepository.h"

#import "GTYRouterBase.h"
#import "GTYUser.h"

@implementation GTYWatchEvent

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super initWithDictionary:dictionary]) {
		NSDictionary *payload = [dictionary mps_dictionaryForKey:@"payload"];
		self.action = [payload mps_stringForKey:@"action"];
	}
	return self;
}

- (id)initWithFauxData {
	if (self = [super initWithFauxData]) {
		
	}
	return self;
}

- (NSString *)title {
	return [NSString stringWithFormat:@"%@ starred %@", self.actor.login, self.repository.name];
}

- (NSArray *)ranges {
	NSMutableArray *mutableRanges = [[super ranges] mutableCopy];
	
    if (self.repository && self.repository.name) {
        NSRange range = [self.title rangeOfString:self.repository.name options:NSLiteralSearch];
		[mutableRanges addObject:[NSValue valueWithRange:range]];
    }
	
	return mutableRanges;
}

- (NSArray *)urls {
	NSMutableArray *mutableURLs = [[super urls] mutableCopy];
	
    if (self.repository && self.repository.name) {
        [mutableURLs addObject:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@", kReposRoutePrefix, self.repository.name]]];
    }
	
	return mutableURLs;
}

@end
