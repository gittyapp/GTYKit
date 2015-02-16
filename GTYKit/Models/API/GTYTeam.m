//
//  GTYTeam.m
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYTeam.h"

@implementation GTYTeam

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super initWithDictionary:dictionary]) {
		self.name = [dictionary mps_stringForKey:@"name"];
	}
	return self;
}

- (id)initWithFauxData {
	if (self = [super initWithFauxData]) {
		
	}
	return self;
}

- (NSString *)title {
	return self.name && ![self.name isEqualToString:@""] ? [NSString stringWithFormat:@" to %@", self.name] : @"";
}

@end
