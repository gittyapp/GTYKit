//
//  GTYPullRequest.m
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYPullRequest.h"

#import "GTYCommit.h"
#import "GTYRepository.h"

@implementation GTYPullRequest

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super initWithDictionary:dictionary]) {
		self.objectID = [dictionary mps_stringForKey:@"number"];
		
		NSString *url = [dictionary mps_stringForKey:@"html_url"];
		self.htmlURL = [NSURL URLWithString:url];
		
		self.isMerged = [dictionary mps_boolForKey:@"merged"];
		
		self.title = [dictionary mps_stringForKey:@"title"];
		
		self.isMergeable = [dictionary mps_boolForKey:@"mergeable"];
		
		NSDictionary *repositoryDictionary = [dictionary mps_dictionaryForKey:@"repository"];
		
		if (repositoryDictionary.allKeys.count == 0) {
			repositoryDictionary = [[dictionary mps_dictionaryForKey:@"head"] mps_dictionaryForKey:@"repo"];
		}
		
		self.repository = [[GTYRepository alloc] initWithDictionary:repositoryDictionary];
		
		self.commits = [NSMutableArray array];
		
		self.files = [NSMutableArray array];
		
		NSDictionary *baseDictionary = [dictionary mps_dictionaryForKey:@"base"];
		
		self.baseRef = [baseDictionary mps_stringForKey:@"ref"];
		
		NSDictionary *headDictionary = [dictionary mps_dictionaryForKey:@"head"];
		
		self.headRef = [headDictionary mps_stringForKey:@"ref"];
		
		self.headRepository = [[GTYRepository alloc] initWithDictionary:[headDictionary mps_dictionaryForKey:@"repo"]];
		
		self.headSha = [headDictionary mps_stringForKey:@"sha"];
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
	
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeBool:self.isMerged forKey:@"isMerged"];
    [aCoder encodeObject:self.repository forKey:@"repository"];
    [aCoder encodeObject:self.headRepository forKey:@"headRepository"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.title = [aDecoder decodeObjectForKey:@"title"];
		self.isMerged = [aDecoder decodeBoolForKey:@"isMerged"];
		self.repository = [aDecoder decodeObjectForKey:@"repository"];
		self.headRepository = [aDecoder decodeObjectForKey:@"headRepository"];
	}
	return self;
}

- (NSString *)commitsPath {
	return [NSString stringWithFormat:@"repos/%@/pulls/%@/commits", self.repository.meta, self.objectID];
}

- (NSString *)filesPath {
	return [NSString stringWithFormat:@"repos/%@/pulls/%@/files", self.repository.meta, self.objectID];
}

- (void)groupCommits {
	self.sortedCommits = [NSMutableArray arrayWithCapacity:0];
	self.sourceCommits = [NSMutableDictionary dictionaryWithCapacity:0];
	
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	dateFormatter.locale = [NSLocale currentLocale];
	dateFormatter.timeZone = calendar.timeZone;
	[dateFormatter setDateStyle:NSDateFormatterMediumStyle];
	
	NSUInteger dateComponents = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
	NSInteger previousYear = -1;
	NSInteger previousMonth = -1;
	NSInteger previousDay = -1;
	NSMutableArray *tableViewCellsForSection = nil;
	
	for (GTYCommit *commit in self.commits) {
		NSDateComponents *components = [calendar components:dateComponents fromDate:commit.committedDate];
		NSInteger year = [components year];
		NSInteger month = [components month];
		NSInteger day = [components day];
		
		if (year != previousYear || month != previousMonth || day != previousDay) {
			NSString *sectionHeading = [dateFormatter stringFromDate:commit.committedDate];
			[self.sortedCommits addObject:sectionHeading];
			
			tableViewCellsForSection = [NSMutableArray arrayWithCapacity:0];
			[self.sourceCommits setObject:tableViewCellsForSection forKey:sectionHeading];
			
			previousYear = year;
			previousMonth = month;
			previousDay = day;
		}
		[tableViewCellsForSection addObject:commit];
	}
}

@end
