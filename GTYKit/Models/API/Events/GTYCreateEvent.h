//
//  GTYCreateEvent.h
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYEvent.h"

@interface GTYCreateEvent : GTYEvent

@property (nonatomic, strong) NSString *refType;

@property (nonatomic, strong) NSString *ref;

@property (nonatomic, strong) NSString *masterBranch;

@property (nonatomic, strong) NSString *eventDescription;

@end
