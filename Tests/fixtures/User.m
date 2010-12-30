//
//  User.m
//  restfulie-objectivec
//
//  Created by Bruno Fuster on 12/30/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "User.h"


@implementation User

@synthesize userId, name, email, address;

- (void) dealloc
{
	[userId release];
	[name release];
	[email release];
	[address release];
	[super dealloc];
}


@end
