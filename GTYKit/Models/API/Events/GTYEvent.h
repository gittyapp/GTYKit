//
//  GTYEvent.h
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYObject.h"

@class GTYOrganization;
@class GTYRepository;
@class GTYUser;

@interface GTYEvent : GTYObject

@property (nonatomic, strong) GTYUser *actor;

@property (nonatomic, strong) GTYOrganization *organization;

@property (nonatomic, strong) GTYRepository *repository;

@property (nonatomic, strong) NSDictionary *payload;

@property (nonatomic, strong) NSString *url;

+ (id)eventWithDictionary:(NSDictionary *)dictionary;

- (NSString *)title;

- (NSArray *)ranges;

- (NSArray *)urls;

@end
