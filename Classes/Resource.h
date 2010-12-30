//
//  Resource.h
//  restfulie-objc
//
//  Created by Bruno Fuster on 10/22/10.
//  Copyright 2010 Caelum. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Resource : NSObject {

	
}

- (id) initWithData:(id)data ofType:(Class)clazz;
- (id) initWithArray:(NSArray *)array ofType:(Class)clazz;
- (id) createObjWithDictionary:(NSDictionary *)dictionary ofType:(Class)clazz;
- (id) getData;

@end
