//
//  GTYForkApplyEvent.h
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYEvent.h"

@interface GTYForkApplyEvent : GTYEvent

@property (nonatomic, strong) NSString *head;

@property (nonatomic, strong) NSString *before;

@property (nonatomic, strong) NSString *after;

@end
