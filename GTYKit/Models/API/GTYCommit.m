//
//  GTYCommit.m
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYCommit.h"

#import "GTYFile.h"
#import "GTYRepository.h"
#import "GTYUser.h"
#import "NSString+GTYAdditions.h"

@implementation GTYCommit

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super initWithDictionary:dictionary]) {
		self.sha = [dictionary mps_stringForKey:@"sha"];
		
		NSDictionary *treeDictionary = [dictionary mps_dictionaryForKey:@"tree"];
		self.treeSHA = [treeDictionary mps_stringForKey:@"sha"];
		self.treeURL = [NSURL URLWithString:[treeDictionary mps_stringForKey:@"url"]];
		
		NSDictionary *commitDictionary = [dictionary mps_dictionaryForKey:@"commit"];
		self.message = [commitDictionary mps_stringForKey:@"message"];
		
		if ([self.message isEqualToString:@""]) {
			self.message = [dictionary mps_stringForKey:@"message"];
		}
		
		self.author = [[GTYUser alloc] initWithDictionary:[dictionary mps_dictionaryForKey:@"author"]];
		
		self.committer = [[GTYUser alloc] initWithDictionary:[dictionary mps_dictionaryForKey:@"committer"]];
		
		NSDictionary *authorDictionary = [commitDictionary mps_dictionaryForKey:@"author"];
		self.authoredDate = [authorDictionary mps_dateForKey:@"date"];
		
		NSDictionary *committerDictionary = [commitDictionary mps_dictionaryForKey:@"committer"];
		self.committedDate = [committerDictionary mps_dateForKey:@"date"];
		
		NSArray *filesArray = [dictionary mps_arrayForKey:@"files"];
		NSMutableArray *mutableFiles = [NSMutableArray array];
				
		for (NSDictionary *fileDictionary in filesArray) {
			GTYFile *file = [[GTYFile alloc] initWithDictionary:fileDictionary];
			[mutableFiles addObject:file];
		}
		
		self.files = mutableFiles;
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
	
    [aCoder encodeObject:self.sha forKey:@"sha"];
    [aCoder encodeObject:self.treeSHA forKey:@"treeSHA"];
    [aCoder encodeObject:self.treeURL forKey:@"treeURL"];
    [aCoder encodeObject:self.message forKey:@"message"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.sha = [aDecoder decodeObjectForKey:@"sha"];
		self.treeSHA = [aDecoder decodeObjectForKey:@"treeSHA"];
		self.treeURL = [aDecoder decodeObjectForKey:@"treeURL"];
		self.message = [aDecoder decodeObjectForKey:@"message"];
	}
	return self;
}

- (NSString *)smallSha {
	return [self.sha gty_smallSha];
}

- (NSString *)filesExplanation {
    NSInteger additions = [[self.files valueForKeyPath:@"@sum.additions"] integerValue];
    
    NSInteger deletions = [[self.files valueForKeyPath:@"@sum.deletions"] integerValue];
    
	return [NSString stringWithFormat:@"%@ %lu %@%@ %@ %lu %@ %lu %@", NSLocalizedString(@"Showing", nil), self.files.count, NSLocalizedString(@"changed file", nil), self.files.count == 1 ? @"" : @"s", NSLocalizedString(@"with", nil), additions, NSLocalizedString(@"additions and", nil), (long)deletions, NSLocalizedString(@"deletions.", nil)];
}

@end
