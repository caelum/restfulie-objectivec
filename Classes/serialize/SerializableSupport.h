//
//  SerializableSupport.h
//  restfulie-objc
//
//  Created by Bruno Fuster on 10/23/10.
//  Copyright 2010 Caelum. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SerializableSupport : NSObject {

}

+ (id) deserializeModel:(NSDictionary *)dictionary asClass:(Class)clazz;
+ (id) deserializeArray:(NSDictionary *)dictionary asClass:(Class)clazz;
+ (id) propertyClass:(NSString *)className;

@end