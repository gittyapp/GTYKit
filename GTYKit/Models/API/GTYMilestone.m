//
//  GTYMilestone.m
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYMilestone.h"

#import "GTYUser.h"

@implementation GTYMilestone

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super initWithDictionary:dictionary]) {
		self.objectID = [dictionary mps_stringForKey:@"number"];		
		self.state = [dictionary mps_stringForKey:@"state"];
		self.title = [dictionary mps_stringForKey:@"title"];
		self.milestoneDescription = [dictionary mps_stringForKey:@"description"];
		self.creator = [[GTYUser alloc] initWithDictionary:[dictionary mps_dictionaryForKey:@"creator"]];
		self.dueOn = [dictionary mps_dateForKey:@"due_on"];
		self.openIssuesCount = [dictionary mps_integerForKey:@"open_issues"];
		self.closedIssuesCount = [dictionary mps_integerForKey:@"closed_issues"];
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
	
    [aCoder encodeObject:self.state forKey:@"state"];
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.milestoneDescription forKey:@"milestoneDescription"];
    [aCoder encodeObject:self.creator forKey:@"creator"];
    [aCoder encodeObject:[self encodeDate:self.dueOn] forKey:@"dueOn"];
    [aCoder encodeInteger:self.openIssuesCount forKey:@"openIssuesCount"];
    [aCoder encodeInteger:self.closedIssuesCount forKey:@"closedIssuesCount"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.state = [aDecoder decodeObjectForKey:@"state"];
		self.title = [aDecoder decodeObjectForKey:@"title"];
		self.milestoneDescription = [aDecoder decodeObjectForKey:@"milestoneDescription"];
		self.creator = [aDecoder decodeObjectForKey:@"creator"];
		self.dueOn = [self decodeDateString:[aDecoder decodeObjectForKey:@"dueOn"]];
		self.openIssuesCount = [aDecoder decodeIntegerForKey:@"openIssuesCount"];
		self.closedIssuesCount = [aDecoder decodeIntegerForKey:@"closedIssuesCount"];
	}
	return self;
}

@end
