//
//  GTYRouter.h
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kBlobsRoute						@"gitty://blobs/:owner/:name/:ref/:path"
#define kBlobsRoutePrefix				@"gitty:/blobs"
#define kCommitsWithRangeRoute			@"gitty://commitrange/:owner/:name/:before/:head"
#define kCommitsWithRangePrefix			@"gitty:/commitrange"
#define kCommitsRoute					@"gitty://commits/:owner/:name/:id"
#define kCommitsRoutePrefix				@"gitty:/commits"
#define kGistsRoute						@"gitty://gists/:id"
#define kGistsRoutePrefix				@"gitty:/gists"
#define kIssuesRoute					@"gitty://issues/:owner/:name/:id"
#define kIssuesRoutePrefix				@"gitty:/issues"
#define kReposRoute						@"gitty://repos/:owner/:name"
#define kReposRoutePrefix				@"gitty:/repos"
#define kPullRequestsRoute				@"gitty://pullRequests/:owner/:name/:id"
#define kPullRequestsRoutePrefix		@"gitty:/pullRequests"
#define kStarsRoute						@"gitty://stars/:userId"
#define kStarsRoutePrefix				@"gitty:/stars"
#define kTreesRoute						@"gitty://trees/:owner/:name/:ref/:path"
#define kTreesRoutePrefix				@"gitty:/trees"
#define kUpdatesWithMenuRoute			@"gitty://updates/:showMenu"
#define kUpdatesRoutePrefix				@"gitty:/updates"
#define kUsersRoute						@"gitty://users/:id"
#define kUsersWithMenuRoute				@"gitty://users/:id/:showMenu"
#define kUsersRoutePrefix				@"gitty:/users"

@interface GTYRouterBase : NSObject

@end
