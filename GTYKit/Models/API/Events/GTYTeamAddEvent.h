//
//  GTYTeamAddEvent.h
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYEvent.h"

@class GTYRepository;
@class GTYTeam;
@class GTYUser;

@interface GTYTeamAddEvent : GTYEvent

@property (nonatomic, strong) GTYTeam *team;

@property (nonatomic, strong) GTYUser *user;

@property (nonatomic, strong) GTYRepository *repository;

@end
