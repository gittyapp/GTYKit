//
//  GTYPushEvent.m
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYPushEvent.h"

#import "GTYCommit.h"
#import "GTYRepository.h"

#import "GTYRouterBase.h"
#import "GTYUser.h"

@implementation GTYPushEvent

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super initWithDictionary:dictionary]) {
		NSDictionary *payload = [dictionary mps_dictionaryForKey:@"payload"];
		self.before = [payload mps_stringForKey:@"before"];
		self.head = [payload mps_stringForKey:@"head"];
		self.ref = [payload mps_stringForKey:@"ref"];
		self.size = [payload mps_integerForKey:@"size"];
		
		NSMutableArray *mutableCommits = [NSMutableArray array];
		
		for (NSDictionary *commitDictionary in [payload mps_arrayForKey:@"commits"]) {
			GTYCommit *commit = [[GTYCommit alloc] initWithDictionary:commitDictionary];
			commit.repository = self.repository;
			[mutableCommits addObject:commit];
		}
		
		self.commits = [[mutableCommits reverseObjectEnumerator] allObjects];
	}
	return self;
}

- (id)initWithFauxData {
	if (self = [super initWithFauxData]) {
		
	}
	return self;
}

- (NSString *)branch {
	NSString *branch = [self.ref stringByReplacingOccurrencesOfString:@"refs/heads/" withString:@""];
	return branch;
}

- (NSString *)title {
	NSString *title = [NSString stringWithFormat:@"%@ pushed to %@ at %@", self.actor.login, self.branch, self.repository.name];
	
	if (![self.commitTitles isEqualToString:@""]) {
		title = [title stringByAppendingString:@"\n\n"];
		
		title = [title stringByAppendingString:self.commitTitles];
	}
	
	return title;
}

- (NSString *)commitTitles {
	NSString *titles = @"";
	
	if (self.commits.count > 0) {
		NSInteger totalCount = self.commits.count;
		
		for (GTYCommit *commit in self.commits) {
			NSInteger currentIndex = [self.commits indexOfObject:commit];
			
			if ([commit.smallSha isEqualToString:@""]) continue;
			
			if (currentIndex > 1 && totalCount > 2) {
				NSInteger remainingCommits = self.size - currentIndex;
				
				NSString *message = [NSString stringWithFormat:@"%ld more commit%@ »", (long)remainingCommits, remainingCommits > 1 ? @"s" : @""];
				
				titles = [titles stringByAppendingString:message];
				break;
			} else {
				NSString *commitMessage = commit.message;
				commitMessage = [commitMessage stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
				
				NSString *message = [NSString stringWithFormat:@"%@ - %@", commit.smallSha, commitMessage];
				
				titles = [titles stringByAppendingString:message];
				
				if (currentIndex + 1 != totalCount) {
					titles = [titles stringByAppendingString:@"\n\n"];
				}
			}
			
			if (currentIndex == 1 && totalCount == 2) {
				NSString *message = @"\n\nView comparison for these 2 commits »";
				
				titles = [titles stringByAppendingString:message];
				break;
			}
		}
	}
	
	return titles;
}

- (NSArray *)ranges {
	NSMutableArray *mutableRanges = [[super ranges] mutableCopy];
	
    if (self.repository && self.repository.name) {
        NSRange range = [self.title rangeOfString:self.repository.name options:NSLiteralSearch];
		[mutableRanges addObject:[NSValue valueWithRange:range]];
    }
	
	if (self.commits.count > 0) {
		NSInteger totalCount = self.commits.count;
		
		for (GTYCommit *commit in self.commits) {
			NSInteger currentIndex = [self.commits indexOfObject:commit];
			
			if ([commit.smallSha isEqualToString:@""]) continue;
			
			if (currentIndex > 1 && totalCount > 2) {
				NSInteger remainingCommits = self.size - currentIndex;
				
				NSString *message = [NSString stringWithFormat:@"%ld more commit%@ »", (long)remainingCommits, remainingCommits > 1 ? @"s" : @""];
				
				NSRange range = [self.title rangeOfString:message options:NSLiteralSearch];
				
				[mutableRanges addObject:[NSValue valueWithRange:range]];
				break;
			} else {
				NSRange range = [self.title rangeOfString:commit.smallSha options:NSLiteralSearch];
				
				[mutableRanges addObject:[NSValue valueWithRange:range]];
			}
			
			if (currentIndex == 1 && totalCount == 2) {
				NSString *message = @"View comparison for these 2 commits »";
				
				NSRange range = [self.title rangeOfString:message options:NSLiteralSearch];
				
				[mutableRanges addObject:[NSValue valueWithRange:range]];
				break;
			}
		}
	}
	
	return mutableRanges;
}

- (NSArray *)urls {
	NSMutableArray *mutableURLs = [[super urls] mutableCopy];
	
    if (self.repository && self.repository.name) {
        [mutableURLs addObject:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@", kReposRoutePrefix, self.repository.name]]];
    }
	
	if (self.commits.count > 0) {
		NSInteger totalCount = self.commits.count;
		
		for (GTYCommit *commit in self.commits) {
			NSInteger currentIndex = [self.commits indexOfObject:commit];
			
			if ([commit.smallSha isEqualToString:@""]) continue;
			
			if (currentIndex > 1 && totalCount > 2) {
				//before to head
				NSString *path = [NSString stringWithFormat:@"%@/%@/%@/%@", kCommitsWithRangePrefix, commit.repository.name, self.before, self.head];
				[mutableURLs addObject:[NSURL URLWithString:path]];
				break;
			} else {
				[mutableURLs addObject:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/%@", kCommitsRoutePrefix, commit.repository.name, commit.smallSha]]];
			}
			
			if (currentIndex == 1 && totalCount == 2) {
				NSString *path = [NSString stringWithFormat:@"%@/%@/%@/%@", kCommitsWithRangePrefix, commit.repository.name, self.before, self.head];
				[mutableURLs addObject:[NSURL URLWithString:path]];
				break;
			}
		}
	}
	
	return mutableURLs;
}

@end
