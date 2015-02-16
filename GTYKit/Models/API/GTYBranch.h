//
//  GTYBranch.h
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYObject.h"

@class GTYCommit;

@interface GTYBranch : GTYObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) GTYCommit *commit;

@end
