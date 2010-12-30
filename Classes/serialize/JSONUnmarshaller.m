//
//  JSONUnmarshaller.m
//  restfulie-objc
//
//  Created by Bruno Fuster on 10/23/10.
//  Copyright 2010 Caelum. All rights reserved.
//

#import "JSONUnmarshaller.h"
#import "JSON.h"

@implementation JSONUnmarshaller

-(NSDictionary *) unmarshall:(NSObject *)data {
	
	if ([data isKindOfClass:[NSString class]]) 
		return [[SBJsonParser alloc] objectWithString:(NSString *)data];

	[NSException raise:@"Json unmarshaller falied!" format:@"NSString excepted!"];
	return nil;
}

@end
