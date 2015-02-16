#import "GTYIssuesEvent.h"

SpecBegin(GTYIssuesEvent)

describe(@"GTYIssuesEvent", ^{
	__block GTYIssuesEvent *_sut;
	
	it(@"should initialize", ^{
		NSDictionary *dictionary = @{ @"id" : @123,
									  @"event" : @"closed",
									  @"created_at": @"2011-04-14T15:59:49Z" };
		_sut = [[GTYIssuesEvent alloc] initWithDictionary:dictionary];
		
		expect(_sut).toNot.beNil();
		expect(_sut.objectID).to.equal(@"123");
		expect(_sut.action).to.equal(@"closed");
		expect(_sut.createdAt).to.equal([[[ISO8601DateFormatter alloc] init] dateFromString:@"2011-04-14 15:59:49 +0000"]);
	});
});

SpecEnd
