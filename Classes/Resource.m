/*
 * Resource.m
 * restfulie-objc
 *
 * Created by Bruno Fuster on 10/22/10.
 * 
 * Copyright (c) 2009 Caelum - www.caelum.com.br/opensource
 * All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

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
	
	for (NSString *key in [mutableDict allKeys]) 
		if (![obj respondsToSelector:NSSelectorFromString(key)]) 
			[mutableDict removeObjectForKey:key];
	
	/* PREPARE DICT */
	
	for (NSString *key in [mutableDict allKeys]) {
		
		id i = [mutableDict objectForKey:key];
		
		if ([i isKindOfClass:[NSDictionary class]]) {
			
			NSString *classNameString = [NSString stringWithUTF8String:[obj typeOfPropertyNamed:key]];
			NSString *className = [classNameString substringWithRange:NSMakeRange(3, ([classNameString length] -4))];
			
			Class compositionClass = NSClassFromString(className);
			
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
		
	return objsArray;
}

- (id) getData {
	
}

@end
