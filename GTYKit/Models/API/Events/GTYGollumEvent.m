//
//  GTYGollumEvent.m
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYGollumEvent.h"

#import "GTYGollumPage.h"
#import "GTYRepository.h"
#import "GTYRouterBase.h"
#import "GTYUser.h"

@implementation GTYGollumEvent

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super initWithDictionary:dictionary]) {
		NSMutableArray *mutablePages = [NSMutableArray array];
		
		for (NSDictionary *pageDictionary in [self.payload mps_arrayForKey:@"pages"]) {
			GTYGollumPage *page = [[GTYGollumPage alloc] initWithDictionary:pageDictionary];
			[mutablePages addObject:page];
		}
		
		self.pages = mutablePages;
	}
	return self;
}

- (id)initWithFauxData {
	if (self = [super initWithFauxData]) {
		
	}
	return self;
}

- (NSString *)title {
	GTYGollumPage *page = self.pages.firstObject;
	return [NSString stringWithFormat:@"%@ %@ \"%@\" in the %@ wiki", self.actor.login, page.action, page.name, self.repository.name];
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
