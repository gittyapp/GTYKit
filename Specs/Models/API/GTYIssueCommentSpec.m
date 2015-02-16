#import "GTYIssueComment.h"

#import "GTYUser.h"

SpecBegin(GTYIssueComment)

describe(@"GTYIssueComment", ^{
	__block GTYIssueComment *_sut;
	
	it(@"should initialize", ^{
		NSDictionary *dictionary = @{
									 @"id": @1,
									 @"url": @"https://api.github.com/repos/octocat/Hello-World/issues/comments/1",
									 @"html_url": @"https://github.com/octocat/Hello-World/issues/1347#issuecomment-1",
									 @"body": @"Me too",
									 @"user": @{
											 @"login": @"octocat"
											 },
									 @"created_at": @"2011-04-14T16:00:49Z",
									 @"updated_at": @"2011-04-14T18:00:49Z"
									 };
		_sut = [[GTYIssueComment alloc] initWithDictionary:dictionary];
		
		expect(_sut).toNot.beNil();
		expect(_sut.objectID).to.equal(@"1");
		expect(_sut.body).to.equal(@"Me too");
		expect(_sut.commenter).toNot.beNil();
		expect(_sut.commenter.login).to.equal(@"octocat");
		expect(_sut.createdAt).to.equal([[[ISO8601DateFormatter alloc] init] dateFromString:@"2011-04-14 16:00:49 +0000"]);
		expect(_sut.updatedAt).to.equal([[[ISO8601DateFormatter alloc] init] dateFromString:@"2011-04-14 18:00:49 +0000"]);
	});
});

SpecEnd
