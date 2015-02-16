//
//  GTYIssuesDetailedEvent.m
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYIssuesDetailedEvent.h"

#import "GTYIssue.h"
#import "GTYRepository.h"
#import "GTYRouterBase.h"
#import "GTYUser.h"
#import "NSString+GTYAdditions.h"

@implementation GTYIssuesDetailedEvent

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super initWithDictionary:dictionary]) {
		self.action = [dictionary mps_stringForKey:@"event"];
		
		self.actor = [[GTYUser alloc] initWithDictionary:[dictionary mps_dictionaryForKey:@"actor"]];
		
		self.commitID = [[dictionary mps_stringForKey:@"commit_id"] gty_smallSha];
		
		NSDictionary *payload = [dictionary mps_dictionaryForKey:@"payload"];
		
		if (payload.allKeys.count > 0) {
			self.issue = [[GTYIssue alloc] initWithDictionary:[payload mps_dictionaryForKey:@"issue"]];
			
			self.action = [payload mps_stringForKey:@"action"];
		}
	}
	return self;
}

- (id)initWithFauxData {
	if (self = [super initWithFauxData]) {
		
	}
	return self;
}

- (BOOL)isAssigned {
	return [self.action isEqualToString:@"assigned"];
}

- (BOOL)isClosed {
	return [self.action isEqualToString:@"closed"];
}

- (BOOL)isDeleted {
	return [self.action isEqualToString:@"head_ref_deleted"];
}

- (BOOL)isDemilestoned {
	return [self.action isEqualToString:@"demilestoned"];
}

- (BOOL)isLabeled {
	return [self.action isEqualToString:@"labeled"];
}

- (BOOL)isLocked {
	return [self.action isEqualToString:@"locked"];
}

- (BOOL)isMentioned {
	return [self.action isEqualToString:@"mentioned"];
}

- (BOOL)isMerged {
	return [self.action isEqualToString:@"merged"];
}

- (BOOL)isMilestoned {
	return [self.action isEqualToString:@"milestoned"];
}

- (BOOL)isReferenced {
	return [self.action isEqualToString:@"referenced"];
}

- (BOOL)isRenamed {
	return [self.action isEqualToString:@"renamed"];
}

- (BOOL)isReopened {
	return [self.action isEqualToString:@"reopened"];
}

- (BOOL)isRestored {
	return [self.action isEqualToString:@"head_ref_restored"];
}

- (BOOL)isSubscribed {
	return [self.action isEqualToString:@"subscribed"];
}

- (BOOL)isUnassigned {
	return [self.action isEqualToString:@"unassigned"];
}

- (BOOL)isUnknown {
	return !self.isAssigned && !self.isClosed && !self.isDeleted & !self.isDemilestoned && !self.isLabeled && !self.isLocked && !self.isMentioned && !self.isMerged && !self.isMilestoned && !self.isReferenced && !self.isRenamed && !self.isReopened && !self.isRestored && !self.isSubscribed && !self.isUnassigned && !self.isUnlabeled && !self.isUnlocked;
}

- (BOOL)isUnlabeled {
	return [self.action isEqualToString:@"unlabeled"];
}

- (BOOL)isUnlocked {
	return [self.action isEqualToString:@"unlocked"];
}

- (BOOL)couldContainCommitLink {
	return self.isClosed || self.isMerged || self.isReferenced;
}

- (BOOL)hasBaseRef {
	return self.baseRef != nil && ![self.baseRef isEqualToString:@""];
}

- (BOOL)hasHeadRef {
	return self.headRef != nil && ![self.headRef isEqualToString:@""];
}

- (NSString *)title {
	NSString *format = @"";
	NSString *thing = self.issue.isPullRequest ? NSLocalizedString(@"pull request", nil) : NSLocalizedString(@"issue", nil);
	
	if (self.isAssigned) {
		format = [NSString stringWithFormat:@"%@ %@ %@ %@ by %@", NSLocalizedString(@"This", nil), thing, NSLocalizedString(@"was assigned", nil), @"%@", self.actor.login];
	} else if (self.isClosed) {
		if (self.commitID != nil && ![self.commitID isEqualToString:@""]) {
			format = [NSString stringWithFormat:@"%@ %@ %@ %@ %@ by %@", NSLocalizedString(@"This", nil), thing, NSLocalizedString(@"was closed in", nil), self.commitID, @"%@", self.actor.login];
		} else {
			format = [NSString stringWithFormat:@"%@ %@ %@ %@ by %@", NSLocalizedString(@"This", nil), thing, NSLocalizedString(@"was closed", nil), @"%@", self.actor.login];
		}
	} else if (self.isDeleted) {
		if (self.hasHeadRef) {
			format = [NSString stringWithFormat:@"%@ %@ %@ %@ by %@", NSLocalizedString(@"The", nil), self.headRef, NSLocalizedString(@"branch was deleted", nil), @"%@", self.actor.login];
		} else {
			format = [NSString stringWithFormat:@"%@ %@ %@ %@ by %@", NSLocalizedString(@"This", nil), thing, NSLocalizedString(@"was deleted", nil), @"%@", self.actor.login];
		}
	} else if (self.isDemilestoned) {
        format = [NSString stringWithFormat:@"%@ %@ %@", self.actor.login, NSLocalizedString(@"removed this from the milestone", nil), @"%@"];
	} else if (self.isLabeled) {
        format = [NSString stringWithFormat:@"%@ %@ %@", self.actor.login, NSLocalizedString(@"added some labels", nil), @"%@"];
	} else if (self.isLocked) {
        format = [NSString stringWithFormat:@"%@ %@ %@ %@ %@", NSLocalizedString(@"This", nil), thing, NSLocalizedString(@"was locked by", nil), self.actor.login, @"%@"];
	} else if (self.isMerged) {
		if (self.commitID != nil && ![self.commitID isEqualToString:@""]) {
			if (self.hasBaseRef && self.hasHeadRef) {
				format = [NSString stringWithFormat:@"%@ %@ %@ %@ %@ %@ %@ by %@", NSLocalizedString(@"Merged commit", nil), self.commitID, NSLocalizedString(@"into", nil), self.baseRef, NSLocalizedString(@"from", nil), self.headRef, @"%@", self.actor.login];
			} else {
				format = [NSString stringWithFormat:@"%@ %@ %@ by %@", NSLocalizedString(@"Merged commit", nil), self.commitID, @"%@", self.actor.login];
			}
		} else {
			format = [NSString stringWithFormat:@"%@ %@ %@ %@ by %@", NSLocalizedString(@"This", nil), thing, NSLocalizedString(@"was merged", nil), @"%@", self.actor.login];
		}
	} else if (self.isMilestoned) {
        format = [NSString stringWithFormat:@"%@ %@ %@", self.actor.login, NSLocalizedString(@"added this to the milestone", nil), @"%@"];
	} else if (self.isReferenced) {
		if (self.commitID != nil && ![self.commitID isEqualToString:@""]) {
			format = [NSString stringWithFormat:@"%@ %@ %@ %@ %@ by %@", NSLocalizedString(@"This", nil), thing, NSLocalizedString(@"was referenced from commit", nil), self.commitID, @"%@", self.actor.login];
		} else {
			format = [NSString stringWithFormat:@"%@ %@ %@ %@ by %@", NSLocalizedString(@"This", nil), thing, NSLocalizedString(@"was referenced", nil), @"%@", self.actor.login];
		}
	} else if (self.isRenamed) {
        format = [NSString stringWithFormat:@"%@ %@ %@ %@", self.actor.login, NSLocalizedString(@"changed the title of this", nil), thing, @"%@"];
	} else if (self.isReopened) {
		format = [NSString stringWithFormat:@"%@ %@ %@ %@ by %@", NSLocalizedString(@"This", nil), thing, NSLocalizedString(@"was reopened", nil), @"%@", self.actor.login];
	} else if (self.isRestored) {
		if (self.hasHeadRef) {
			format = [NSString stringWithFormat:@"%@ %@ %@ %@ by %@", NSLocalizedString(@"The", nil), self.headRef, NSLocalizedString(@"branch was restored", nil), @"%@", self.actor.login];
		} else {
			format = [NSString stringWithFormat:@"%@ %@ %@ %@ by %@", NSLocalizedString(@"This", nil), thing, NSLocalizedString(@"was restored", nil), @"%@", self.actor.login];
		}
	} else if (self.isUnassigned) {
        format = [NSString stringWithFormat:@"%@ %@ %@", self.actor.login, NSLocalizedString(@"removed the assignee", nil), @"%@"];
	} else if (self.isUnlabeled) {
        format = [NSString stringWithFormat:@"%@ %@ %@", self.actor.login, NSLocalizedString(@"removed some labels", nil), @"%@"];
	} else if (self.isUnlocked) {
        format = [NSString stringWithFormat:@"%@ %@ %@ %@ %@", NSLocalizedString(@"This", nil), thing, NSLocalizedString(@"was unlocked by", nil), self.actor.login, @"%@"];
	}
	
	return format;
}

- (NSArray *)urls {
	NSMutableArray *mutableURLs = [[super urls] mutableCopy];
	
	if (self.couldContainCommitLink && self.url != nil && ![self.url isEqualToString:@""] && self.commitID != nil && ![self.commitID isEqualToString:@""]) {
		NSURL *fullURL = [NSURL URLWithString:self.url];
		NSArray *components = fullURL.pathComponents;
		
		if (components.count >= 4) {
			NSString *owner = components[2];
			NSString *name = components[3];
			NSString *commitURL = [NSString stringWithFormat:@"%@/%@/%@/%@", kCommitsRoutePrefix, owner, name, self.commitID];
			[mutableURLs addObject:[NSURL URLWithString:commitURL]];
		}
	}
	
	return mutableURLs;
}

@end
