//
//  SimpleObjParserTestCase.m
//  restfulie-objectivec
//
//  Created by Bruno Fuster on 12/30/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SimpleObjParserTestCase.h"
#import "Restfulie.h"
#import "User.h"

@implementation SimpleObjParserTestCase

-(void) testSimpleParser {

	Response *response = [[Restfulie at:@"http://localhost:8888"] get];
	User *user = [response resourceWithClass:[User class]];
	
	STAssertNotNil(user.userId, @"");
	STAssertNotNil(user.name, @"");
	STAssertNotNil(user.email, @"");
	STAssertNotNil(user.address, @"");
	
}

@end
