//
//  GTYIssueComment.m
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYIssueComment.h"

#import "GTYUser.h"

@implementation GTYIssueComment

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super initWithDictionary:dictionary]) {
		self.body = [dictionary mps_stringForKey:@"body"];
		self.commenter = [[GTYUser alloc] initWithDictionary:[dictionary mps_dictionaryForKey:@"user"]];
		
		NSString *pullRequestURLString = [dictionary mps_stringForKey:@"pull_request_url"];
		self.pullRequestURL = [NSURL URLWithString:pullRequestURLString];
	}
	return self;
}

- (id)initWithFauxData {
	if (self = [super initWithFauxData]) {
		
	}
	return self;
}

@end
