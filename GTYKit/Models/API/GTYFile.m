//
//  GTYFile.m
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYFile.h"

@implementation GTYFile

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super initWithDictionary:dictionary]) {
		self.objectID = [dictionary mps_stringForKey:@"sha"]; // sha
		self.status = [dictionary mps_stringForKey:@"status"];
		self.name = [dictionary mps_stringForKey:@"filename"];
		self.content = [dictionary mps_stringForKey:@"content"];
		self.language = [[dictionary mps_stringForKey:@"language"] lowercaseString];
		
		if (self.content == nil || [self.content isEqualToString:@""]) {
			self.content = [dictionary mps_stringForKey:@"patch"];
			self.language = @"diff";
			self.additions = [dictionary mps_integerForKey:@"additions"];
			self.deletions = [dictionary mps_integerForKey:@"deletions"];
			self.changes = [dictionary mps_integerForKey:@"changes"];
		}
		
		self.payload = dictionary;
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
	
    [aCoder encodeObject:self.status forKey:@"status"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.content forKey:@"content"];
    [aCoder encodeObject:self.language forKey:@"language"];
    [aCoder encodeObject:self.payload forKey:@"payload"];
	[aCoder encodeInteger:self.additions forKey:@"additions"];
	[aCoder encodeInteger:self.deletions forKey:@"deletions"];
	[aCoder encodeInteger:self.changes forKey:@"changes"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.status = [aDecoder decodeObjectForKey:@"status"];
		self.name = [aDecoder decodeObjectForKey:@"name"];
		self.content = [aDecoder decodeObjectForKey:@"content"];
		self.language = [aDecoder decodeObjectForKey:@"language"];
		self.payload = [aDecoder decodeObjectForKey:@"payload"];
		self.additions = [aDecoder decodeIntegerForKey:@"additions"];
		self.deletions = [aDecoder decodeIntegerForKey:@"deletions"];
		self.changes = [aDecoder decodeIntegerForKey:@"changes"];
	}
	return self;
}

@end