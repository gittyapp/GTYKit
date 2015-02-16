//
//  GTYMilestone.h
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYObject.h"

@class GTYUser;

@interface GTYMilestone : GTYObject<NSCoding>

@property (nonatomic, strong) NSString *state;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *milestoneDescription;
@property (nonatomic, strong) GTYUser *creator;
@property (nonatomic, strong) NSDate *dueOn;
@property (nonatomic) NSInteger openIssuesCount;
@property (nonatomic) NSInteger closedIssuesCount;

@end
