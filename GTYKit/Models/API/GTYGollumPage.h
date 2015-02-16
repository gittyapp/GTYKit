//
//  GTYGollumPage.h
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYObject.h"

@interface GTYGollumPage : GTYObject

@property (nonatomic, strong) NSString *action;

@property (nonatomic, strong) NSURL *htmlURL;

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSString *sha;

@property (nonatomic, strong) NSString *summary;

@property (nonatomic, strong) NSString *title;

@end
