//
//  GTYObject.h
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NSDictionary+MPSAdditions.h"

@interface GTYObject : NSObject<NSCoding>

@property (nonatomic, strong) NSString *objectID;

@property (nonatomic, strong) NSDate *createdAt;

@property (nonatomic, strong) NSDate *updatedAt;

- (id)initWithDictionary:(NSDictionary *)dictionary;

- (id)initWithFauxData;

- (NSString *)encodeDate:(NSDate *)aDate;

- (NSDate *)decodeDateString:(NSString *)aDateString;

@end
