//
//  Address.m
//  restfulie-objectivec
//
//  Created by Bruno Fuster on 12/30/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Address.h"

@implementation Address

@synthesize street;

- (void) dealloc
{
	[street release];
	[super dealloc];
}


@end
