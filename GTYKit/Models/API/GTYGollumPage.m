//
//  GTYGollumPage.m
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYGollumPage.h"

@implementation GTYGollumPage

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super initWithDictionary:dictionary]) {
		self.action = [dictionary mps_stringForKey:@"action"];
		
		NSString *url = [dictionary mps_stringForKey:@"html_url"];
		
		self.htmlURL = [NSURL URLWithString:url];
		
		self.name = [dictionary mps_stringForKey:@"page_name"];
		
		self.sha = [dictionary mps_stringForKey:@"sha"];
		
		self.summary = [dictionary mps_stringForKey:@"summary"];
		
		self.title = [dictionary mps_stringForKey:@"title"];
	}
	return self;
}

- (id)initWithFauxData {
	if (self = [super initWithFauxData]) {
		
	}
	return self;
}

@end
