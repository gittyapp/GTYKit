//
//  GTYDeploymentEvent.m
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYDeploymentEvent.h"

@implementation GTYDeploymentEvent

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super initWithDictionary:dictionary]) {
		NSDictionary *payload = [dictionary mps_dictionaryForKey:@"payload"];
		
		self.sha = [payload mps_stringForKey:@"sha"];
		
		self.name = [payload mps_stringForKey:@"name"];
		
		self.payloadString = [payload mps_stringForKey:@"payload"];
		
		self.eventDescription = [payload mps_stringForKey:@"description"];
	}
	return self;
}

- (id)initWithFauxData {
	if (self = [super initWithFauxData]) {
		
	}
	return self;
}

@end
