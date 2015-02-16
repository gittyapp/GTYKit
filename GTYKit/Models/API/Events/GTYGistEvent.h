//
//  GTYGistEvent.h
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYEvent.h"

@class GTYGist;

@interface GTYGistEvent : GTYEvent

@property (nonatomic, strong) GTYGist *gist;

@property (nonatomic, strong) NSString *action;

@end
