//
//  GTYStatusEvent.m
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYStatusEvent.h"

#import "GTYBranch.h"

@implementation GTYStatusEvent

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super initWithDictionary:dictionary]) {
		NSDictionary *payload = [dictionary mps_dictionaryForKey:@"payload"];
		self.sha = [payload mps_stringForKey:@"sha"];
		self.state = [payload mps_stringForKey:@"name"];
		self.targetURL = [NSURL URLWithString:[payload mps_stringForKey:@"payload"]];
				
		NSMutableArray *mutableBranches = [NSMutableArray array];
		
		for (NSDictionary *branchDictionary in [dictionary mps_arrayForKey:@"branches"]) {
			GTYBranch *branch = [[GTYBranch alloc] initWithDictionary:branchDictionary];
			[mutableBranches addObject:branch];
		}
		
		self.branches = mutableBranches;
	}
	return self;
}

- (id)initWithFauxData {
	if (self = [super initWithFauxData]) {
		
	}
	return self;
}

@end
