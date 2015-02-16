//
//  GTYPlan.m
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYPlan.h"

@implementation GTYPlan

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super initWithDictionary:dictionary]) {
		self.name = [dictionary mps_stringForKey:@"name"];
		self.privateRepos = [dictionary mps_integerForKey:@"private_repos"];
		self.space = [dictionary mps_integerForKey:@"space"];
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
    [aCoder encodeInteger:self.privateRepos forKey:@"privateRepos"];
    [aCoder encodeInteger:self.space forKey:@"space"];
    [aCoder encodeInteger:self.collaborators forKey:@"collaborators"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.name = [aDecoder decodeObjectForKey:@"name"];
		self.privateRepos = [aDecoder decodeIntegerForKey:@"privateRepos"];
		self.space = [aDecoder decodeIntegerForKey:@"space"];
		self.collaborators = [aDecoder decodeIntegerForKey:@"collaborators"];
	}
	return self;
}

@end
