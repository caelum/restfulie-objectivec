/*
 * Response.h
 * restfulie-objectivec
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

#import <Foundation/Foundation.h>
#import "Resource.h";
#import "RestClient.h"

@interface Response : NSObject {

	id data;
	id<RestClient> client;
	NSNumber *code;
	
}

@property (nonatomic, retain) id data;
@property (nonatomic, retain) id<RestClient> client;
@property (nonatomic, retain) NSNumber *code;

+(Response *) initWithData:(id)data andClient:(id<RestClient>)client;

-(id) resource;

@end
