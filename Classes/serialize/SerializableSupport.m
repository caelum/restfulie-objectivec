//
//  SerializableSupport.m
//  restfulie-objc
//
//  Created by Bruno Fuster on 10/23/10.
//  Copyright 2010 Caelum. All rights reserved.
//

#import "SerializableSupport.h"


@implementation SerializableSupport

+(id) deserializeModel:(NSDictionary *)dictionary asClass:(Class)clazz
{
	return dictionary;
}

+ (id) propertyClass:(NSString *)className {
	return NSClassFromString([className toClassName]);
}

@end
