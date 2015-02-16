//
//  GTYBranch.m
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYBranch.h"

#import "GTYCommit.h"

@implementation GTYBranch

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super initWithDictionary:dictionary]) {
		self.name = [dictionary mps_stringForKey:@"name"];
		self.commit = [[GTYCommit alloc] initWithDictionary:[dictionary mps_dictionaryForKey:@"commit"]];
	}
	return self;
}

- (id)initWithFauxData {
	if (self = [super initWithFauxData]) {
		
	}
	return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.commit forKey:@"commit"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.name = [aDecoder decodeObjectForKey:@"name"];
		self.commit = [aDecoder decodeObjectForKey:@"url"];
	}
	return self;
}

@end
