//
//  Restfulie.h
//  restfulie-objc
//
//  Created by Bruno Fuster on 10/22/10.
//  Copyright 2010 Caelum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Request.h"


@interface Restfulie : NSObject {

}

+(Request*) at:(NSString *) url;

-(id)withKey:(NSString*)key andValue:(NSString*)value;

@end
