//
//  GTYTree.h
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYObject.h"

@class GTYRepository;

@interface GTYTree : GTYObject<NSCoding>

@property (nonatomic, strong) NSString *path;

@property (nonatomic, strong) GTYRepository *repository;

@property (nonatomic, strong) NSString *sha;

@property (nonatomic, strong) NSMutableArray *blobs;

@property (nonatomic, strong) NSMutableArray *trees;

- (id)initWithRepository:(GTYRepository *)repository sha:(NSString *)sha;

- (void)setPropertiesForDictionary:(NSDictionary *)dictionary;

- (NSString *)treePath;

@end
