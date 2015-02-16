//
//  GTYTree.m
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYTree.h"

#import "GTYBlob.h"
#import "GTYRepository.h"
#import "NSString+GTYAdditions.h"

@implementation GTYTree

- (id)initWithRepository:(GTYRepository *)repository sha:(NSString *)sha {
	if (self = [super init]) {
		self.repository = repository;
		self.sha = sha;
	}
	return self;
}

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super initWithDictionary:dictionary]) {
		[self setPropertiesForDictionary:dictionary];
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
	
    [aCoder encodeObject:self.path forKey:@"path"];
    [aCoder encodeObject:self.repository forKey:@"repository"];
    [aCoder encodeObject:self.sha forKey:@"sha"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.path = [aDecoder decodeObjectForKey:@"path"];
		self.repository = [aDecoder decodeObjectForKey:@"repository"];
		self.sha = [aDecoder decodeObjectForKey:@"sha"];
	}
	return self;
}

- (void)setPropertiesForDictionary:(NSDictionary *)dictionary {
	self.path = [dictionary mps_stringForKey:@"path"];
	self.sha = [dictionary mps_stringForKey:@"sha"];
	
	self.blobs = [NSMutableArray array];
	self.trees = [NSMutableArray array];
	
	NSArray *treeArray = [dictionary mps_arrayForKey:@"tree"];
	
	for (NSDictionary *itemDictionary in treeArray) {
		NSString *type = [itemDictionary mps_stringForKey:@"type"];
		if ([type isEqualToString:@"dir"] || [type isEqualToString:@"tree"]) {
			GTYTree *tree = [[GTYTree alloc] initWithDictionary:itemDictionary];
			tree.repository = self.repository;
			[self.trees addObject:tree];
		} else if ([type isEqualToString:@"blob"] || [type isEqualToString:@"file"]) {
			GTYBlob *blob = [[GTYBlob alloc] initWithTreeDictionary:itemDictionary];
			blob.repository = self.repository;
			[self.blobs addObject:blob];
		}
	}
}

- (NSString *)treePath {
	return [NSString stringWithFormat:@"repos/%@/git/trees/%@", self.repository.meta, [self.sha stringByEscapingForURLArgument]];
}

@end
