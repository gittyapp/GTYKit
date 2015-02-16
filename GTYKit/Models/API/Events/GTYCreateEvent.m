//
//  GTYCreateEvent.m
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYCreateEvent.h"

#import "GTYRouterBase.h"
#import "GTYRepository.h"
#import "GTYUser.h"

@implementation GTYCreateEvent

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super initWithDictionary:dictionary]) {
		NSDictionary *payload = [dictionary mps_dictionaryForKey:@"payload"];
		self.refType = [payload mps_stringForKey:@"ref_type"];
		self.ref = [payload mps_stringForKey:@"ref"];
		self.masterBranch = [payload mps_stringForKey:@"master_branch"];
		self.eventDescription = [payload mps_stringForKey:@"description"];
	}
	return self;
}

- (id)initWithFauxData {
	if (self = [super initWithFauxData]) {
		
	}
	return self;
}

- (NSString *)title {
	NSString *eventTitle = @"";
	if ([self.refType isEqualToString:@"repository"]) {
		eventTitle = [NSString stringWithFormat:@"%@ created %@", self.actor.login, self.repository.name];
	} else {
		eventTitle = [NSString stringWithFormat:@"%@ created %@ %@ at %@", self.actor.login, self.refType, self.ref, self.repository.name];
	}
	
	return eventTitle;
}

- (NSArray *)ranges {
	NSMutableArray *mutableRanges = [[super ranges] mutableCopy];
	
    if (self.repository && self.repository.name) {
        NSRange range = [self.title rangeOfString:self.repository.name options:NSLiteralSearch];
		[mutableRanges addObject:[NSValue valueWithRange:range]];
    }
	
	if (self.ref && self.refType) {
		// TODO: link branch
	}
	
	return mutableRanges;
}

- (NSArray *)urls {
	NSMutableArray *mutableURLs = [[super urls] mutableCopy];
	
    if (self.repository && self.repository.name) {
        [mutableURLs addObject:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@", kReposRoutePrefix, self.repository.name]]];
    }
	
	if (self.ref && self.refType) {
		// TODO: link branch
	}
	
	return mutableURLs;
}

@end
