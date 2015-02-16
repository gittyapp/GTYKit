//
//  GTYBlob.m
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYBlob.h"

#import "GTYRepository.h"
#import "MF_Base64Additions.h"
#import "NSString+GTYAdditions.h"

@implementation GTYBlob

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super initWithDictionary:dictionary]) {
		self.encoding = [dictionary mps_stringForKey:@"encoding"];
		
		if ([self.encoding isEqualToString:@"utf-8"]) {
			self.content = [dictionary mps_stringForKey:@"content"];
		} else if ([self.encoding isEqualToString:@"base64"]) {
			NSString *base64String = [dictionary mps_stringForKey:@"content"];
			self.contentData = [NSData dataWithBase64String:base64String];
			self.content = [NSString stringFromBase64String:base64String];
		}
				
		self.name = [dictionary mps_stringForKey:@"name"];
		self.objectID = [dictionary mps_stringForKey:@"sha"]; // sha
		self.sha = [dictionary mps_stringForKey:@"sha"];
		self.size = [dictionary mps_integerForKey:@"size"];
		self.url = [dictionary mps_stringForKey:@"url"];
	}
	return self;
}

- (id)initWithTreeDictionary:(NSDictionary *)dictionary {
	if (self = [super initWithDictionary:dictionary]) {
		self.name = [dictionary mps_stringForKey:@"path"];
		self.objectID = [dictionary mps_stringForKey:@"sha"]; // sha
		self.sha = [dictionary mps_stringForKey:@"sha"];
		self.size = [dictionary mps_integerForKey:@"size"];
		self.url = [dictionary mps_stringForKey:@"url"];
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
	
    [aCoder encodeObject:self.content forKey:@"content"];
    [aCoder encodeObject:self.contentData forKey:@"contentData"];
    [aCoder encodeObject:self.encoding forKey:@"encoding"];
    [aCoder encodeObject:self.name forKey:@"name"];
	[aCoder encodeInteger:self.size forKey:@"size"];
    [aCoder encodeObject:self.sha forKey:@"sha"];
    [aCoder encodeObject:self.url forKey:@"url"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.content = [aDecoder decodeObjectForKey:@"content"];
		self.contentData = [aDecoder decodeObjectForKey:@"contentData"];
		self.encoding = [aDecoder decodeObjectForKey:@"encoding"];
		self.name = [aDecoder decodeObjectForKey:@"name"];
		self.sha = [aDecoder decodeObjectForKey:@"sha"];
		self.size = [aDecoder decodeIntegerForKey:@"size"];
		self.url = [aDecoder decodeObjectForKey:@"url"];
	}
	return self;
}

- (NSString *)blobPath {
	return [NSString stringWithFormat:@"repos/%@/git/blobs/%@", self.repository.meta, [self.sha stringByEscapingForURLArgument]];
}

- (BOOL)isImage {
	NSString *ext = [self.name pathExtension];
	NSArray *imageTypes = @[ @"jpg", @"jpeg", @"png", @"tif", @"tiff" ];
	return [imageTypes containsObject:ext];
}

- (BOOL)isMarkdown {
	NSString *ext = [self.name pathExtension];
	NSArray *imageTypes = @[ @"mark", @"markdown", @"md", @"mdml", @"mdown", @"mdtext", @"mdtxt", @"mdwn", @"mkd", @"mkdn" ];
	return [imageTypes containsObject:ext];
}

@end
