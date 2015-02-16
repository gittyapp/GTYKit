//
//  GTYObject.m
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYObject.h"

#import "NSDate+SAMAdditions.h"

@implementation GTYObject

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super init]) {
		self.objectID = [dictionary mps_stringForKey:@"id"];
		self.createdAt = [dictionary mps_dateForKey:@"created_at"];
		self.updatedAt = [dictionary mps_dateForKey:@"updated_at"];
	}
	return self;
}

- (id)initWithFauxData {
	if (self = [super init]) {
		
	}
	return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.objectID forKey:@"objectID"];
    [aCoder encodeObject:[self encodeDate:self.createdAt] forKey:@"createdAt"];
    [aCoder encodeObject:[self encodeDate:self.updatedAt] forKey:@"updatedAt"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.objectID = [aDecoder decodeObjectForKey:@"objectID"];
		self.createdAt = [self decodeDateString:[aDecoder decodeObjectForKey:@"createdAt"]];
		self.updatedAt = [self decodeDateString:[aDecoder decodeObjectForKey:@"updatedAt"]];
	}
	return self;
}

- (NSString *)encodeDate:(NSDate *)aDate {
	NSString *dateString = [aDate sam_ISO8601String];
	return dateString;
}

- (NSDate *)decodeDateString:(NSString *)aDateString {
	NSDate *date = [NSDate sam_dateFromISO8601String:aDateString];
	return date;
}

@end
