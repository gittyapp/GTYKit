//
//  GTYPageBuildEvent.h
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYEvent.h"

@class GTYGollumPage;

@interface GTYPageBuildEvent : GTYEvent

@property (nonatomic, strong) GTYGollumPage *page;

@end
