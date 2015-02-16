#import "GTYUser.h"

SpecBegin(GTYUser)

describe(@"GTYUser", ^{
	NSDictionary *dictionary = @{
								 @"login": @"octocat",
								 @"id": @1,
								 @"avatar_url": @"https://github.com/images/error/octocat_happy.gif",
								 @"gravatar_id": @"somehexcode",
								 @"name": @"monalisa octocat",
								 @"company": @"GitHub",
								 @"blog": @"https://github.com/blog",
								 @"location": @"San Francisco",
								 @"email": @"octocat@github.com",
								 @"public_repos": @2,
								 @"followers": @20,
								 @"following": @0,
								 @"type": @"User",
								 };
	
	__block GTYUser *_sut;
	
	it(@"should initialize", ^{
		_sut = [[GTYUser alloc] initWithDictionary:dictionary];
		
		expect(_sut).toNot.beNil();
		expect(_sut).to.beKindOf([GTYUser class]);
		expect(_sut.login).to.equal(@"octocat");
		expect(_sut.email).to.equal(@"octocat@github.com");
		expect(_sut.name).to.equal(@"monalisa octocat");
		expect(_sut.objectID).to.equal(@"1");
		expect(_sut.avatarURL).to.equal([NSURL URLWithString:@"https://github.com/images/error/octocat_happy.gif"]);
		expect(_sut.gravatarID).to.equal(@"somehexcode");
		expect(_sut.company).to.equal(@"GitHub");
		expect(_sut.blog).to.equal(@"https://github.com/blog");
		expect(_sut.publicRepoCount).to.equal(2);
		expect(_sut.followerCount).to.equal(20);
		expect(_sut.followingCount).to.equal(0);
		expect(_sut.userType).to.equal(@"user");
	});
	
	describe(@"equality", ^{		
		it(@"should prefer objectID equivalence", ^{
			GTYUser *user1 = [[GTYUser alloc] initWithDictionary:@{ @"login" : @"joshaber", @"id" : @42 }];
			GTYUser *user2 = [[GTYUser alloc] initWithDictionary:@{ @"login" : @"joshaber1", @"id" : @42 }];
			expect(user1).notTo.beNil();
			expect(user2).notTo.beNil();
			expect(user1).to.equal(user2);
		});
		
		it(@"should never treat a user with an ID as equivalent to a user without", ^{
			GTYUser *user1 = [[GTYUser alloc] initWithDictionary:@{ @"login" : @"joshaber" }];
			GTYUser *user2 = [[GTYUser alloc] initWithDictionary:@{ @"login" : @"joshaber", @"id" : @42 }];
			expect(user1).notTo.equal(user2);
		});
	});
	
	describe(@"isOrganization", ^{
		it(@"should indicate if the user is an organization", ^{
			_sut.userType = @"user";
			expect(_sut.isOrganization).to.beFalsy();
			
			_sut.userType = @"organization";
			expect(_sut.isOrganization).to.beTruthy();
		});
	});
	
	describe(@"isOrganization", ^{
		it(@"should indicate if the user is an organization", ^{
			_sut.userType = @"organization";
			expect(_sut.isUser).to.beFalsy();
			
			_sut.userType = @"";
			expect(_sut.isUser).to.beTruthy();
			
			_sut.userType = @"user";
			expect(_sut.isUser).to.beTruthy();
		});
	});
});

SpecEnd
