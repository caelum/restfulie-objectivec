//
//  Resource.m
//  restfulie-objc
//
//  Created by Bruno Fuster on 10/22/10.
//  Copyright 2010 Caelum. All rights reserved.
//

#import <objc/runtime.h>
#import "NSObject+Properties.h"
#import "Resource.h"


@implementation Resource

- (id) initWithData:(id)data ofType:(Class)clazz {

	if ([data isKindOfClass:[NSDictionary class]]) {
		return [self createObjWithDictionary:data ofType:clazz];
	} else {
		return [self initWithArray:data ofType:clazz];
	}
	
}

//private
- (id) createObjWithDictionary:(NSDictionary *)dictionary ofType:(Class)clazz {
	
	NSMutableDictionary *mutableDict = [NSMutableDictionary dictionaryWithDictionary:dictionary];
	
	id obj = [[clazz alloc] init];
	
	/* CHECK FOR ID KEYS */
	
	for (NSString *key in [mutableDict allKeys]) {
		if (![obj respondsToSelector:NSSelectorFromString(key)]) {
			NSLog(@"didnt respond to %@", key);
			[mutableDict removeObjectForKey:key];
		} else {
			NSLog(@"responded to %@", key);
		}
	}
	
	/* GO AGAIN FOR A REAL CHANGE */
	
	for (NSString *key in [mutableDict allKeys]) {
		id i = [mutableDict objectForKey:key];
		if ([i isKindOfClass:[NSDictionary class]]) {
			
			const char *className = [obj typeOfPropertyNamed:key];
			NSString *classNameString = [NSString stringWithUTF8String:className];
				
			NSString *sanitize = [classNameString substringWithRange:NSMakeRange(3, ([classNameString length] -4))];
			NSLog(@"%i ", [classNameString length]);
			Class compositionClass = NSClassFromString(sanitize);
			if (compositionClass != nil) {
				id obj = [self createObjWithDictionary:i ofType:compositionClass];
				[mutableDict setObject:obj forKey:key];
			}
		}
	}
	
	[obj setValuesForKeysWithDictionary:mutableDict];	
	return obj;
}

- (id) initWithArray:(NSArray *)array ofType:(Class)clazz {
	
	NSMutableArray *objsArray = [[NSMutableArray alloc] init];
	
	for (id obj in array) 
		[objsArray addObject:[self createObjWithDictionary:obj ofType:clazz]];
	
	//NSArray *result = [[NSArray alloc] initWithArray:objsArray];
	//[objsArray release];
	
	return objsArray;
}

- (id) getData {
	
}

@end
