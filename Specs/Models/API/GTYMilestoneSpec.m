#import "GTYMilestone.h"

#import "GTYUser.h"

SpecBegin(GTYMilestone)

describe(@"GTYMilestone", ^{
	NSDictionary *dictionary = @{
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
								 };
	
	__block GTYMilestone *_sut;
	
	it(@"should initialize", ^{
		_sut = [[GTYMilestone alloc] initWithDictionary:dictionary];
		
		expect(_sut).toNot.beNil();
		expect(_sut).to.beKindOf([GTYMilestone class]);
		expect(_sut.createdAt).to.equal([[[ISO8601DateFormatter alloc] init] dateFromString:@"2011-04-10 20:09:31 +0000"]);
		expect(_sut.dueOn).to.beNil();
		expect(_sut.state).to.equal(@"open");
		expect(_sut.objectID).to.equal(@"1");
		expect(_sut.title).to.equal(@"v1.0");
		expect(_sut.milestoneDescription).to.equal(@"");
		expect(_sut.creator).toNot.beNil();
		expect(_sut.creator.login).to.equal(@"octocat");
		expect(_sut.openIssuesCount).to.equal(4);
		expect(_sut.closedIssuesCount).to.equal(8);
	});
});

SpecEnd
