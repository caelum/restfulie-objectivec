//
//  Request.h
//  restfulie-objc
//
//  Created by Bruno Fuster on 10/22/10.
//  Copyright 2010 Caelum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response.h"

@interface Request : NSObject {
	
	NSURL *uri;
	NSError *error;
}

@property (nonatomic, retain) NSURL *uri;
@property (nonatomic, retain) NSError *error;

+(Request *) initWithURI:(NSString *)uri;

/*
 *	Request through http some REST service
 *
 */
-(Response *) get;

/*
 *	Post some object to a REST service
 *
 */
-(Response *) post;

@end
