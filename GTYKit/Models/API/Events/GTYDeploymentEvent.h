//
//  GTYDeploymentEvent.h
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYEvent.h"

@interface GTYDeploymentEvent : GTYEvent

@property (nonatomic, strong) NSString *sha;

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSString *payloadString;

@property (nonatomic, strong) NSString *eventDescription;

@end
