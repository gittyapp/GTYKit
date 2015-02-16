//
//  GTYNotification.h
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYObject.h"

@class GTYRepository;

@interface GTYNotification : GTYObject<NSCoding>

@property (nonatomic, strong) GTYRepository *repository;
@property (nonatomic, strong) GTYObject *subject;
@property (nonatomic, strong) NSDate *lastReadAtDate;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subjectType;
@property (nonatomic) BOOL read;

- (NSString *)subjectRoute;

@end
