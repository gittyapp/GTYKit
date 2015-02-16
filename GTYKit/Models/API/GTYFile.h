//
//  GTYFile.h
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYObject.h"

@interface GTYFile : GTYObject

@property (nonatomic, strong) NSString *status;

@property (nonatomic) NSInteger additions;

@property (nonatomic) NSInteger deletions;

@property (nonatomic) NSInteger changes;

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSString *content;

@property (nonatomic, strong) NSString *language;

@property (nonatomic, strong) NSDictionary *payload;

@end
