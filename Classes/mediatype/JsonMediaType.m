/*
 * JsonMediaType.m
 * restfulie-objectivec
 *
 * Created by Bruno Fuster on 1/3/11.
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

#import "JsonMediaType.h"
#import "JSONUnmarshaller.h"
#import "NSObject+Properties.h"
#import "JSONKit.h"

@implementation JsonMediaType

@synthesize typesToEnhance, includes, excludes;

- (id) init
{
	self = [super init];
	if (self != nil) {
		self.typesToEnhance = [[NSMutableDictionary alloc] init];
		self.includes = [[NSMutableDictionary alloc] init];
		self.excludes = [[NSMutableArray alloc] init];
	}
	return self;
}


- (void) withTypes:(NSArray*)types andCollectionNames:(NSArray*)names {

	for (id obj in types) {		
		NSString *key = NSStringFromClass([obj class]);
		NSString *first = [[key substringToIndex:1] lowercaseString];
		NSString *rest = [key substringFromIndex:1];
		key = [NSString stringWithFormat:@"%@%@", first,rest];
		[self.typesToEnhance setObject:obj forKey:key];
	}
	
	int index = 0;
	for (id key in names) {
		[self.typesToEnhance setObject:[types objectAtIndex:index] forKey:key];
		index++;
	}
}

#pragma mark MediaType

- (id) unmarshall:(NSString *)content forClient:(id<RestClient>)client {

	JSONUnmarshaller *unmarshall = [[JSONUnmarshaller alloc] init];
	NSDictionary *dataDictionary	= [unmarshall unmarshall:content];

	NSString *identifier = [[dataDictionary allKeys] objectAtIndex:0];
	id type = [self.typesToEnhance objectForKey:identifier];
	
	NSLog(@"%@", type);
	//NSLog(@"%@", [dataDictionary description]);
	
	id resource = [[Resource alloc] initWithData:[dataDictionary objectForKey:identifier] ofType:type typesToEnhance:self.typesToEnhance];
	return resource;
}

- (id) marshall:(id)object forClient:(id)client {

	NSArray *keys = [self.typesToEnhance allKeysForObject:[object class]];
	if ([keys count] == 0) {
		//throw exception;
	}

	NSString *identifier = [keys objectAtIndex:1]; //single
	//FIXME change how to get the single identifier
	
	NSMutableArray *props = [[NSMutableArray arrayWithArray:[object propertyNames]] retain];
	if ([self.excludes count] > 0) 
		for (NSString *prop in self.excludes)
			[props removeObject:prop];
	
	NSMutableDictionary *newIncludes = [[NSMutableDictionary alloc] init];
	if ([self.includes count] > 0) {
		for (id include in [self.includes allKeys]) {
			id obj = [object valueForKey:include];
			id dict = [obj dictionaryWithValuesForKeys:[obj propertyNames]];
			[newIncludes setObject:dict forKey:include];
		}
	}
	
	NSMutableDictionary *objDict = [[NSMutableDictionary dictionaryWithDictionary:[object dictionaryWithValuesForKeys:props]] retain];
	[props release];
	
	for (id dictKey in [newIncludes allKeys]) {
		[objDict setValue:[newIncludes objectForKey:dictKey] forKey:dictKey];
	}
	[newIncludes release];
	
	NSDictionary *dict = [[NSDictionary dictionaryWithObject:objDict forKey:identifier] retain];
	/*NSString *json = [[SBJsonWriter alloc] stringWithObject:dict];*/
	
	[objDict release];
	[dict release];
	
	NSError *error;
	NSString *str = [dict JSONStringWithOptions:JKSerializeOptionEscapeUnicode error:&error];
	
	NSLog(@"json: %@", str);
	
	return [str dataUsingEncoding:NSUTF8StringEncoding];
}

- (void) include:(NSString *)key withClass:(Class)clazz {

	[self.includes setObject:clazz forKey:key];
}

-(void)exclude:(NSString*)key {

	[self.excludes addObject:key];
}

- (void) dealloc
{
	[self.typesToEnhance release];
	[self.includes release];
	[self.excludes release];
	[super dealloc];
}

@end
