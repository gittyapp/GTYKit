//
//  GTYPageBuildEvent.m
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYPageBuildEvent.h"

#import "GTYGollumPage.h"

@implementation GTYPageBuildEvent

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super initWithDictionary:dictionary]) {
		NSDictionary *payload = [dictionary mps_dictionaryForKey:@"payload"];
		self.page = [[GTYGollumPage alloc] initWithDictionary:[payload mps_dictionaryForKey:@"build"]];
	}
	return self;
}

- (id)initWithFauxData {
	if (self = [super initWithFauxData]) {
		
	}
	return self;
}

@end
