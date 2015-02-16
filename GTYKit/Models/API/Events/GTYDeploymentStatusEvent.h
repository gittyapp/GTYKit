//
//  GTYDeploymentStatusEvent.h
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYEvent.h"

@interface GTYDeploymentStatusEvent : GTYEvent

@property (nonatomic, strong) NSString *sha;

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSString *state;

@property (nonatomic, strong) NSURL *targetURL;

@property (nonatomic, strong) NSString *eventDescription;

@end
