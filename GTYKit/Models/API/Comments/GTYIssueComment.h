//
//  GTYIssueComment.h
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYObject.h"

@class GTYUser;

@interface GTYIssueComment : GTYObject

@property (nonatomic, strong) NSString *body;
@property (nonatomic, strong) GTYUser *commenter;
@property (nonatomic, strong) NSURL *pullRequestURL;

@end
