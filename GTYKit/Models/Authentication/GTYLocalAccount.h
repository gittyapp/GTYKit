//
//  GTYLocalAccount.h
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GTYUser;

@interface GTYLocalAccount : NSObject<NSCoding>

@property (nonatomic, strong) NSString *login;

@property (nonatomic, strong) NSURL *avatarURL;

@property (nonatomic, strong) NSString *authToken;

@property (nonatomic, strong) NSString *endpoint;

- (id)initWithAuthToken:(NSString *)authToken;

- (id)initWithUser:(GTYUser *)user authToken:(NSString *)authToken;

- (GTYUser *)toUser;

- (BOOL)isEnterpriseUser;

@end
