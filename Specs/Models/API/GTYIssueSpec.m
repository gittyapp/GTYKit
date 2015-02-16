#import "GTYIssue.h"

#import "GTYMilestone.h"
#import "GTYUser.h"

SpecBegin(GTYIssue)

describe(@"GTYIssue", ^{
	NSDictionary *dictionary = @{
								 @"url": @"https://api.github.com/repos/octocat/Hello-World/issues/1",
								 @"html_url": @"https://github.com/octocat/Hello-World/issues/1",
								 @"number": @1347,
								 @"state": @"open",
								 @"title": @"Found a bug",
								 @"body": @"I'm having a problem with this.",
								 @"user": @{
										 @"login": @"octocat",
										 @"id": @1,
										 @"avatar_url": @"https://github.com/images/error/octocat_happy.gif",
										 @"gravatar_id": @"somehexcode",
										 @"url": @"https://api.github.com/users/octocat"
										 },
								 @"labels": @[
										 @{
											 @"url": @"https://api.github.com/repos/octocat/Hello-World/labels/bug",
											 @"name": @"bug",
											 @"color": @"f29513"
											 }
										 ],
								 @"assignee": @{
										 @"login": @"octocat",
										 @"id": @1,
										 @"avatar_url": @"https://github.com/images/error/octocat_happy.gif",
										 @"gravatar_id": @"somehexcode",
										 @"url": @"https://api.github.com/users/octocat"
										 },
								 @"milestone": @{
										 @"url": @"https://api.github.com/repos/octocat/Hello-World/milestones/1",
										 @"number": @1,
										 @"state": @"open",
										 @"title": @"v1.0",
										 @"description": @"",
										 @"creator": @{
												 @"login": @"octocat",
												 @"id": @1,
												 @"avatar_url": @"https://github.com/images/error/octocat_happy.gif",
												 @"gravatar_id": @"somehexcode",
												 @"url": @"https://api.github.com/users/octocat"
												 },
										 @"open_issues": @4,
										 @"closed_issues": @8,
										 @"created_at": @"2011-04-10T20:09:31Z",
										 @"due_on": NSNull.null
										 },
								 @"comments": @22,
								 @"pull_request": @{
										 @"html_url": @"https://github.com/octocat/Hello-World/issues/1",
										 @"diff_url": @"https://github.com/octocat/Hello-World/issues/1.diff",
										 @"patch_url": @"https://github.com/octocat/Hello-World/issues/1.patch"
										 },
								 @"closed_at": NSNull.null,
								 @"created_at": @"2011-04-22T13:33:48Z",
								 @"updated_at": @"2011-04-22T13:33:48Z"
								 };
	
	__block GTYIssue *_sut;
	
	it(@"should initialize", ^{
		_sut = [[GTYIssue alloc] initWithDictionary:dictionary];
		
		expect(_sut).toNot.beNil();
		expect(_sut).to.beKindOf([GTYIssue class]);
		expect(_sut.createdAt).to.equal([[[ISO8601DateFormatter alloc] init] dateFromString:@"2011-04-22 13:33:48 +0000"]);
		expect(_sut.updatedAt).to.equal([[[ISO8601DateFormatter alloc] init] dateFromString:@"2011-04-22 13:33:48 +0000"]);
		expect(_sut.closedAt).to.beNil();
		expect(_sut.body).to.equal(@"I'm having a problem with this.");
		expect(_sut.htmlURL).to.equal([NSURL URLWithString:@"https://github.com/octocat/Hello-World/issues/1"]);
		expect(_sut.state).to.equal(@"open");
		expect(_sut.isOpen).to.beTruthy();
		expect(_sut.isClosed).to.beFalsy();
		expect(_sut.objectID).to.equal(@"1347");
		expect(_sut.isNew).to.beFalsy();
		expect(_sut.title).to.equal(@"Found a bug");
		expect(_sut.user).toNot.beNil();
		expect(_sut.user.login).to.equal(@"octocat");
		expect(_sut.assignee).toNot.beNil();
		expect(_sut.assignee.login).to.equal(@"octocat");
		expect(_sut.milestone).toNot.beNil();
		expect(_sut.milestone.title).to.equal(@"v1.0");
		expect(_sut.labels.count).to.equal(1);
		expect(_sut.commentsCount).to.equal(22);
	});
});

SpecEnd
