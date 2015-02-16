//
//  GTYCommitComment.h
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYObject.h"

@class GTYUser;

@interface GTYCommitComment : GTYObject

@property (nonatomic, strong) NSURL *htmlURL;

@property (nonatomic, strong) NSURL *url;

@property (nonatomic, strong) NSString *body;

@property (nonatomic, strong) NSString *path;

@property (nonatomic) NSInteger position;

@property (nonatomic) NSInteger line;

@property (nonatomic, strong) NSString *commitID;

@property (nonatomic, strong) GTYUser *user;

@end
