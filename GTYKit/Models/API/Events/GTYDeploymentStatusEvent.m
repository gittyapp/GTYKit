//
//  GTYDeploymentStatusEvent.m
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYDeploymentStatusEvent.h"

@implementation GTYDeploymentStatusEvent

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super initWithDictionary:dictionary]) {
		NSDictionary *payload = [dictionary mps_dictionaryForKey:@"payload"];
		self.sha = [payload mps_stringForKey:@"sha"];
		self.name = [payload mps_stringForKey:@"name"];
		self.state = [payload mps_stringForKey:@"state"];
		self.targetURL = [NSURL URLWithString:[dictionary mps_stringForKey:@"target_url"]];
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
