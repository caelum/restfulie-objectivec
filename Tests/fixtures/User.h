//
//  User.h
//  restfulie-objectivec
//
//  Created by Bruno Fuster on 12/30/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Address.h"

@interface User : NSObject {

	NSNumber *userId;
	NSString *name;
	NSString *email;
	Address *address;
	
}

@property (nonatomic, retain) NSNumber *userId;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) Address *address;

@end
