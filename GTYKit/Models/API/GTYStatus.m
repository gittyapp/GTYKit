//
//  GTYRepositoryStatus.m
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYStatus.h"

#import "GTYUser.h"
#import "NSString+GTYAdditions.h"

@implementation GTYStatus

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super initWithDictionary:dictionary]) {
		self.state = [dictionary mps_stringForKey:@"state"];
		
		self.creator = [[GTYUser alloc] initWithDictionary:[dictionary mps_dictionaryForKey:@"creator"]];
		
		self.context = [dictionary mps_stringForKey:@"context"];
		
		self.statusDescription = [dictionary mps_stringForKey:@"description"];
		
		self.url = [NSURL URLWithString:[dictionary mps_stringForKey:@"url"]];
		
		self.targetURL = [NSURL URLWithString:[dictionary mps_stringForKey:@"target_url"]];
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
    [aCoder encodeObject:self.creator forKey:@"creator"];
    [aCoder encodeObject:self.context forKey:@"context"];
    [aCoder encodeObject:self.statusDescription forKey:@"statusDescription"];
    [aCoder encodeObject:self.url forKey:@"url"];
    [aCoder encodeObject:self.targetURL forKey:@"targetURL"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.state = [aDecoder decodeObjectForKey:@"state"];
		self.creator = [aDecoder decodeObjectForKey:@"creator"];
		self.context = [aDecoder decodeObjectForKey:@"context"];
		self.statusDescription = [aDecoder decodeObjectForKey:@"statusDescription"];
		self.url = [aDecoder decodeObjectForKey:@"url"];
		self.targetURL = [aDecoder decodeObjectForKey:@"targetURL"];
	}
	return self;
}

- (BOOL)didFail {
	return [self.state isEqualToString:@"failure"] || [self.state isEqualToString:@"error"];
}

- (BOOL)isPending {
	return [self.state isEqualToString:@"pending"];
}

- (BOOL)wasSuccessful {
	return [self.state isEqualToString:@"success"];
}

- (NSString *)ref {
	NSString *ref = @"";
	
	NSArray *components = self.url.pathComponents;
	
	if (components.count > 0) {
		ref = components.lastObject;
	}
	
	return ref;
}

@end
