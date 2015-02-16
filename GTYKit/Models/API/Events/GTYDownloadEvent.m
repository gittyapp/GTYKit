//
//  GTYDownloadEvent.m
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYDownloadEvent.h"

#import "GTYDownload.h"
#import "GTYRepository.h"
#import "GTYRouterBase.h"
#import "GTYUser.h"

@implementation GTYDownloadEvent

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super initWithDictionary:dictionary]) {
		NSDictionary *payload = [dictionary mps_dictionaryForKey:@"payload"];
		self.download = [[GTYDownload alloc] initWithDictionary:[payload mps_dictionaryForKey:@"download"]];
	}
	return self;
}

- (id)initWithFauxData {
	if (self = [super initWithFauxData]) {
		
	}
	return self;
}

- (NSString *)title {
	return [NSString stringWithFormat:@"%@ created download %@ at %@", self.actor.login, self.download.name, self.repository.name];
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
