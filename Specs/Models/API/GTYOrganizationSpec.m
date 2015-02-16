#import "GTYOrganization.h"

#import "GTYPlan.h"

SpecBegin(GTYOrganization)

describe(@"GTYOrganization", ^{
	NSDictionary *dictionary = @{
								 @"login": @"github",
								 @"id": @1,
								 @"url": @"https://api.github.com/orgs/github",
								 @"avatar_url": @"https://github.com/images/error/octocat_happy.gif",
								 @"company": @"GitHub",
								 @"blog": @"https://github.com/blog",
								 @"location": @"San Francisco",
								 @"email": @"octocat@github.com",
								 @"public_repos": @2,
								 @"public_gists": @1,
								 @"followers": @20,
								 @"following": @0,
								 @"html_url": @"https://github.com/octocat",
								 @"created_at": @"2008-01-14T04:33:35Z",
								 @"type": @"Organization",
								 @"owned_private_repos": @100,
								 @"private_gists": @81,
								 @"disk_usage": @10000,
								 @"collaborators": @8,
								 @"billing_email": @"support@github.com",
								 @"plan": @{
										 @"name": @"Medium",
										 @"space": @400,
										 @"private_repos": @20
										 }
								 };
	
	__block GTYOrganization *_sut;
	
	it(@"should initialize", ^{
		_sut = [[GTYOrganization alloc] initWithDictionary:dictionary];
		
		expect(_sut).toNot.beNil();
		expect(_sut).to.beKindOf([GTYOrganization class]);
		expect(_sut.login).to.equal(@"github");
		expect(_sut.objectID).to.equal(@"1");
		expect(_sut.avatarURL).to.equal([NSURL URLWithString:@"https://github.com/images/error/octocat_happy.gif"]);
		expect(_sut.company).to.equal(@"GitHub");
		expect(_sut.blog).to.equal(@"https://github.com/blog");
		expect(_sut.email).to.equal(@"octocat@github.com");
		expect(_sut.publicRepoCount).to.equal(2);
		expect(_sut.privateRepoCount).to.equal(100);
		expect(_sut.diskUsage).to.equal(10000);
		expect(_sut.collaborators).to.equal(8);
		
		expect(_sut.plan).notTo.beNil();
		expect(_sut.plan.name).to.equal(@"Medium");
		expect(_sut.plan.space).to.equal(400);
		expect(_sut.plan.privateRepos).to.equal(20);
	});
});

SpecEnd
