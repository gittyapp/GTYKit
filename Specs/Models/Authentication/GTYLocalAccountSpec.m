#import "GTYLocalAccount.h"

#import "GTYUser.h"

SpecBegin(GTYLocalAccount)

describe(@"GTYLocalAccount", ^{
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
								 @"following": @0
								 };
	
	__block GTYLocalAccount *_sut;
	__block GTYUser *_user;
	__block NSString *_token;
	
	describe(@"initWithAuthToken", ^{
		before(^{
			_token = @"123456";
			
			_sut = [[GTYLocalAccount alloc] initWithAuthToken:_token];
		});
		
		it(@"should initialize", ^{
			expect(_sut).toNot.beNil();			
			expect(_sut.authToken).to.equal(@"123456");
			expect(_sut.login).to.equal(@"");
			expect(_sut.avatarURL).to.beNil();
		});
	});
	
	describe(@"initWithUser:authToken", ^{
		before(^{
			_user = [[GTYUser alloc] initWithDictionary:dictionary];
			_token = @"123456";
			
			_sut = [[GTYLocalAccount alloc] initWithUser:_user authToken:_token];
		});
		
		it(@"should initialize", ^{
			expect(_sut).toNot.beNil();
			expect(_sut.authToken).to.equal(@"123456");
			expect(_sut.login).to.equal(@"octocat");
			expect(_sut.avatarURL).toNot.beNil();
			expect(_sut.avatarURL).to.equal([NSURL URLWithString:@"https://github.com/images/error/octocat_happy.gif"]);
		});
	});
});

SpecEnd
