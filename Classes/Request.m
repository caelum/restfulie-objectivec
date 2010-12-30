//
//  Request.m
//  restfulie-objc
//
//  Created by Bruno Fuster on 10/22/10.
//  Copyright 2010 Caelum. All rights reserved.
//

#import "Request.h"
#import "Response.h"
#import "Unmarshaller.h"
#import "JSONUnmarshaller.h"

@implementation Request
@synthesize uri, error;

+(Request *) initWithURI:(NSString *)uri
{
	
	Request *req = [[Request alloc] init];
	[req setUri:[NSURL URLWithString:uri]];	
	
	return req;
}

-(Response *) get 
{
	
	NSURLRequest *request = [NSURLRequest requestWithURL:self.uri];
	
	NSData *response = [NSURLConnection sendSynchronousRequest:request
											 returningResponse:nil 
														 error:&error];
	if (error) {
		NSLog(@"error %@", error);
	}
	
	
	NSString *json_string = [[NSString alloc] initWithData:response 
												  encoding:NSUTF8StringEncoding];

	JSONUnmarshaller *unmarshall = [[JSONUnmarshaller alloc] init];
	NSDictionary *dataDictionary	= [unmarshall unmarshall:json_string];

	NSArray *list = [dataDictionary objectForKey:@"list"];

	Response *resp;
	if (list) {
		resp = [Response initWithData: list];
	} else {
		resp = [Response initWithData: [[dataDictionary allValues] objectAtIndex:0]];
	}
	
	
	return resp;
}


-(Response*) post
{
	//const char *data = "' ";
	return nil;
}

-(void) dealloc {
	
	[uri release];
	[error release];
	[super dealloc];
}

@end
