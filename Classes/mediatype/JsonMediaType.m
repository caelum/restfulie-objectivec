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

@implementation JsonMediaType

@synthesize typesToEnhance;

- (id) init
{
	self = [super init];
	if (self != nil) {
		self.typesToEnhance = [[NSMutableDictionary alloc] init];
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
	NSLog(@"%@", [dataDictionary description]);
		
	id resource = [[Resource alloc] initWithData:[dataDictionary objectForKey:identifier] ofType:type];
	return resource;
}

- (void) dealloc
{
	[typesToEnhance release];
	[super dealloc];
}

@end
