//
//  Response.h
//  restfulie-objc
//
//  Created by Bruno Fuster on 10/22/10.
//  Copyright 2010 Caelum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Resource.h";

@interface Response : NSObject {

	id data;
	Class type;
	NSNumber *code;
	
}

@property (nonatomic, retain) id data;
@property (nonatomic, assign) Class type;
@property (nonatomic, retain) NSNumber *code;

+(Response *) initWithData:(id)data;

-(id) resourceWithClass:(Class)clazz;


@end
