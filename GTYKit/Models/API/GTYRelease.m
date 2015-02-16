//
//  GTYRelease.m
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYRelease.h"

@implementation GTYRelease

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super initWithDictionary:dictionary]) {
		self.name = [dictionary mps_stringForKey:@"name"];
		self.tagName = [dictionary mps_stringForKey:@"tag_name"];
	}
	return self;
}

- (id)initWithFauxData {
	if (self = [super initWithFauxData]) {
		
	}
	return self;
}

@end
