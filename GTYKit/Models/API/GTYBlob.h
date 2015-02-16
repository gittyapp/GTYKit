//
//  GTYBlob.h
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYObject.h"

@class GTYRepository;

@interface GTYBlob : GTYObject<NSCoding>

@property (nonatomic, strong) GTYRepository *repository;

@property (nonatomic, strong) NSString *content;

@property (nonatomic, strong) NSData *contentData;

@property (nonatomic, strong) NSString *encoding;

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSString *sha;

@property (nonatomic) NSUInteger size;

@property (nonatomic, strong) NSString *url;

- (id)initWithTreeDictionary:(NSDictionary *)dictionary;

- (NSString *)blobPath;

- (BOOL)isImage;

- (BOOL)isMarkdown;

@end
