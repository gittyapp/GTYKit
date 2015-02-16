//
//  GTYCommitComment.m
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYCommitComment.h"

#import "GTYUser.h"

@implementation GTYCommitComment

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super initWithDictionary:dictionary]) {
		self.htmlURL = [NSURL URLWithString:[dictionary mps_stringForKey:@"body"]];
		self.url = [NSURL URLWithString:[dictionary mps_stringForKey:@"body"]];
		self.body = [dictionary mps_stringForKey:@"body"];
		self.path = [dictionary mps_stringForKey:@"path"];
		self.position = [dictionary mps_integerForKey:@"position"];
		self.line = [dictionary mps_integerForKey:@"line"];
		self.commitID = [dictionary mps_stringForKey:@"commit_id"];
		self.user = [[GTYUser alloc] initWithDictionary:[dictionary mps_dictionaryForKey:@"user"]];
	}
	return self;
}

- (id)initWithFauxData {
	if (self = [super initWithFauxData]) {
		
	}
	return self;
}

@end
