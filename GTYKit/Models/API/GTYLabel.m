//
//  GTYLabel.m
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYLabel.h"

@implementation GTYLabel

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super initWithDictionary:dictionary]) {
		self.name = [dictionary mps_stringForKey:@"name"];
		self.backgroundColor = [dictionary mps_stringForKey:@"color"];
		self.textColor = @"FFFFFF";
	}
	return self;
}

- (id)initWithFauxData {
	if (self = [super initWithFauxData]) {
		
	}
	return self;
}

+ (GTYLabel *)emptyLabel {
	GTYLabel *label = [[self alloc] init];
	label.name = @"None yet";
	label.textColor = @"d1d1d1";
	label.backgroundColor = @"FFFFFF";
	return label;
}

@end
