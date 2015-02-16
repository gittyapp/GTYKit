//
//  GTYStatusEvent.h
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYEvent.h"

@interface GTYStatusEvent : GTYEvent

@property (nonatomic, strong) NSString *sha;

@property (nonatomic, strong) NSString *state;

@property (nonatomic, strong) NSString *statusDescription;

@property (nonatomic, strong) NSURL *targetURL;

@property (nonatomic, strong) NSArray *branches;

@end
