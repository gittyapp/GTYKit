//
//  GTYRepositoryStatus.h
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYObject.h"

@class GTYUser;

@interface GTYStatus : GTYObject<NSCoding>

@property (nonatomic, strong) NSString *state;

@property (nonatomic, strong) NSURL *targetURL;

@property (nonatomic, strong) NSURL *url;

@property (nonatomic, strong) NSString *context;

@property (nonatomic, strong) NSString *statusDescription;

@property (nonatomic, strong) GTYUser *creator;

- (BOOL)didFail;

- (BOOL)isPending;

- (BOOL)wasSuccessful;

- (NSString *)ref;

@end
