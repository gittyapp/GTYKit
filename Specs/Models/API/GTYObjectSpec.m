#import "GTYObject.h"

SpecBegin(GTYObject)

describe(@"GTYObject", ^{
	__block GTYObject *_sut;
	
	it(@"should initialize", ^{
		NSDictionary *dictionary = @{ @"id" : @123 };
		_sut = [[GTYObject alloc] initWithDictionary:dictionary];
		
		expect(_sut).toNot.beNil();
		expect(_sut.objectID).to.equal(@"123");
	});
});

SpecEnd
