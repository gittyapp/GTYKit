#import "GTYRepository.h"

#import "GTYUser.h"

SpecBegin(GTYRepository)

describe(@"GTYRepository", ^{
	__block GTYRepository *_sut;
	
	it(@"should initialize", ^{
		NSDictionary *dictionary = @{
									 @"url": @"https://api.github.com/repos/octocat/Hello-World",
									 @"html_url": @"https://github.com/octocat/Hello-World",
									 @"clone_url": @"https://github.com/octocat/Hello-World.git",
									 @"git_url": @"git://github.com/octocat/Hello-World.git",
									 @"ssh_url": @"git@github.com:octocat/Hello-World.git",
									 @"svn_url": @"https://svn.github.com/octocat/Hello-World",
									 @"mirror_url": @"git://git.example.com/octocat/Hello-World",
									 @"id": @1296269,
									 @"owner": @{
											 @"login": @"octocat"
											 },
									 
									 @"name": @"Hello-World",
									 @"full_name": @"octocat/Hello-World",
									 @"description": @"This your first repo!",
									 @"homepage": @"https://github.com",
									 @"language": NSNull.null,
									 @"private": @NO,
									 @"fork": @NO,
									 @"forks": @9,
									 @"watchers": @80,
									 @"size": @108,
									 @"master_branch": @"master",
									 @"open_issues": @0,
									 @"pushed_at": @"2011-01-26T19:06:43Z",
									 @"created_at": @"2011-01-26T19:01:12Z",
									 @"updated_at": @"2011-01-26T19:14:43Z",
									 @"default_branch": @"master",
									 };
		_sut = [[GTYRepository alloc] initWithDictionary:dictionary];
		
		expect(_sut).toNot.beNil();
		expect(_sut.objectID).to.equal(@"1296269");
		expect(_sut.name).to.equal(@"Hello-World");
		expect(_sut.owner).toNot.beNil();
		expect(_sut.owner.login).to.equal(@"octocat");
	});
});

SpecEnd
