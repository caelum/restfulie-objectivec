//
//  Restfulie.m
//  restfulie-objc
//
//  Created by Bruno Fuster on 10/22/10.
//  Copyright 2010 Caelum. All rights reserved.
//

#import "Restfulie.h"
#import "Request.h"


@implementation Restfulie

+ (Request *) at:(NSString *) url 
{
	return [Request initWithURI:url];
}

-(id)withKey:(NSString*)key andValue:(NSString*)value {

	return nil;
}

@end
