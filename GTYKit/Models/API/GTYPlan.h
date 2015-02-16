//
//  GTYPlan.h
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYObject.h"

// Represents the billing plan of a GitHub account.
@interface GTYPlan : GTYObject<NSCoding>

// The name of this plan.
@property (nonatomic, strong) NSString *name;

// The number of collaborators allowed by this plan.
@property (nonatomic) NSUInteger collaborators;

// The number of kilobytes of disk space allowed by this plan.
@property (nonatomic) NSUInteger space;

// The number of private repositories allowed by this plan.
@property (nonatomic) NSUInteger privateRepos;

@end
