//
//  Response.m
//  restfulie-objc
//
//  Created by Bruno Fuster on 10/22/10.
//  Copyright 2010 Caelum. All rights reserved.
//

#import "Response.h"
#import "RestObj.h"

@implementation Response

@synthesize data, type, code;

+(Response *) initWithData:(NSDictionary *)data
{
	Response *res = [[Response alloc] init];
	[res setData:data];
	
	return res;
}

- (id) resourceWithClass:(Class)clazz
{
	
	Resource *resource = [[Resource alloc] initWithData:self.data ofType:clazz];
	//TODO create a real wrapper for Resource!
	return resource;
}

- (id) deserialize
{
	NSLog(@"something %@", self.data);
	return nil;
}

- (void) dealloc
{
	[data release];
	[code release];
	[super dealloc];
}


@end
