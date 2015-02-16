#import "GTYLabel.h"

SpecBegin(GTYLabel)

describe(@"GTYLabel", ^{
	NSDictionary *dictionary = @{
								 @"url": @"https://api.github.com/repos/octocat/Hello-World/labels/bug",
								 @"name": @"bug",
								 @"color": @"f29513"
								 };
	
	__block GTYLabel *_sut;
	
	it(@"should initialize", ^{
		_sut = [[GTYLabel alloc] initWithDictionary:dictionary];
		
		expect(_sut.name).to.equal(@"bug");
		expect(_sut.backgroundColor).to.equal(@"f29513");
	});
});

SpecEnd
