/*
 * Request.h
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
#import "Response.h"
#import "MediaType.h"
#import "JsonMediaType.h"

@interface Request : NSObject {
	
	NSURL *uri;
	NSError *error;
	id<MediaType> mediaType;
	id client;
}

@property (nonatomic, retain) NSURL *uri;
@property (nonatomic, retain) NSError *error;
@property (nonatomic, retain) id<MediaType> mediaType;
@property (nonatomic, retain) id client;

+(Request *) requestWithURI:(NSString *)uri andClient:(id<RestClient>)client;

/*
 *	Request through http some REST service
 *
 */
-(Response *) get;

/*
 *	Post some object to a REST service
 *
 */
-(Response *) post:(id)obj;

@end
