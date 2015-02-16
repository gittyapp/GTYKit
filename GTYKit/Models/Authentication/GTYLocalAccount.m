//
//  GTYLocalAccount.m
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYLocalAccount.h"

#import "GTYUser.h"

#define kUserLoginKey               @"GTYLogin"
#define kUserAvatarURLKey           @"GTYUserAvatarURL"
#define kUserAuthTokenKey           @"GTYAuthToken"

@implementation GTYLocalAccount

- (id)initWithAuthToken:(NSString *)authToken {
    if (self = [super init]) {
        self.authToken = authToken;
		
        self.avatarURL = nil;
		
		self.endpoint = @"";
		
        self.login = @"";
    }
    return self;
}

- (id)initWithUser:(GTYUser *)user authToken:(NSString *)authToken {
    if (self = [self initWithAuthToken:authToken]) {
        [self setUser:user];
    }
    return self;
}

- (void)setUser:(GTYUser *)user {
    self.login = user.login;
	
    self.avatarURL = user.avatarURL;
}

#pragma mark - NSCoding Protocol

- (void)encodeWithCoder:(NSCoder *)encoder {
	[encoder encodeObject:self.login forKey:kUserLoginKey];
	[encoder encodeObject:self.avatarURL forKey:kUserAvatarURLKey];
	[encoder encodeObject:self.authToken forKey:kUserAuthTokenKey];
	[encoder encodeObject:self.endpoint forKey:@"endpoint"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        self.login = [decoder decodeObjectForKey:kUserLoginKey];
        self.avatarURL = [decoder decodeObjectForKey:kUserAvatarURLKey];
        self.authToken = [decoder decodeObjectForKey:kUserAuthTokenKey];
		self.endpoint = [decoder decodeObjectForKey:@"endpoint"];
    }
	return self;
}

- (GTYUser *)toUser {
	GTYUser *user = [[GTYUser alloc] init];
	user.login = self.login;
	user.avatarURL = self.avatarURL;	
	return user;
}

- (BOOL)isEnterpriseUser {
	return self.endpoint != nil && ![self.endpoint isEqualToString:@""];
}

@end
