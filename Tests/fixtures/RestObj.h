//
//  RestObj.h
//  testing_restfulie
//
//  Created by Bruno Fuster on 10/25/10.
//  Copyright 2010 Caelum. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RestObj : NSObject {

	NSNumber *userId;
	NSString *description;
	NSString *store;
	
}

@property (nonatomic, retain) NSNumber *userId;
@property (nonatomic, retain) NSString *description;
@property (nonatomic, retain) NSString *store;

@end
