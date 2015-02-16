//
//  GTYForkEvent.h
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYEvent.h"

@class GTYRepository;

@interface GTYForkEvent : GTYEvent

@property (nonatomic, strong) GTYRepository *forkee;

@end
