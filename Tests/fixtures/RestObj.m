//
//  RestObj.m
//  testing_restfulie
//
//  Created by Bruno Fuster on 10/25/10.
//  Copyright 2010 Caelum. All rights reserved.
//

#import "RestObj.h"


@implementation RestObj

@synthesize userId;
@synthesize description;
@synthesize store;

-(void) dealloc
{
	[userId release];
	[description release];
	[store release];
	[super dealloc];
}

@end
