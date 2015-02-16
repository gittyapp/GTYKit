//
//  GTYEvent.m
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYEvent.h"

#import "GTYOrganization.h"
#import "GTYRepository.h"

#import "GTYRouterBase.h"
#import "GTYUser.h"

@implementation GTYEvent

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super initWithDictionary:dictionary]) {
		self.actor = [[GTYUser alloc] initWithDictionary:[dictionary mps_dictionaryForKey:@"actor"]];
		self.organization = [[GTYOrganization alloc] initWithDictionary:[dictionary mps_dictionaryForKey:@"org"]];
		self.repository = [[GTYRepository alloc] initWithDictionary:[dictionary mps_dictionaryForKey:@"repo"]];
		self.payload = [dictionary mps_dictionaryForKey:@"payload"];
		self.url = [dictionary mps_stringForKey:@"url"];
	}
	return self;
}

- (id)initWithFauxData {
	if (self = [super initWithFauxData]) {
		
	}
	return self;
}

+ (id)eventWithDictionary:(NSDictionary *)dictionary {
	NSString *eventType = [dictionary mps_stringForKey:@"type"];
	id event = nil;
	@try {
		NSString *gtyEvent = [NSString stringWithFormat:@"GTY%@", eventType];
		Class eventClass = NSClassFromString(gtyEvent);
		event = [[eventClass alloc] initWithDictionary:dictionary];
	}
	@catch (NSException *exception) {
		NSLog(@"EVENT CREATION EXCEPTION: %@", exception);
	}
	@finally {
		
	}
	return event;
}

- (NSString *)title {
	return @""; // overridden in subclass
}

- (NSArray *)ranges {
	NSMutableArray *mutableRanges = [NSMutableArray array];
    
    if (self.actor && self.actor.login) {
        NSRange range = [self.title rangeOfString:self.actor.login options:NSLiteralSearch];
		[mutableRanges addObject:[NSValue valueWithRange:range]];
    }
	
	return mutableRanges;
}

- (NSArray *)urls {
	NSMutableArray *mutableURLs = [NSMutableArray array];
    
    if (self.actor && self.actor.login) {
        [mutableURLs addObject:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@", kUsersRoutePrefix, self.actor.login]]];
    }
    
	return mutableURLs;
}

@end
