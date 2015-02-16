//
//  GTYDeleteEvent.h
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYEvent.h"

@interface GTYDeleteEvent : GTYEvent

@property (nonatomic, strong) NSString *refType;

@property (nonatomic, strong) NSString *ref;

@end
