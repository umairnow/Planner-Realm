//
//  NSObject+AutoIncrementNumber.h
//  Planner
//
//  Created by Umair Aamir on 10/21/15.
//  Copyright © 2015 Umair Aamir. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (AutoIncrementNumber)

/**
 * Register a class and return an incremented value based on this method call
 **/
+ (NSInteger)addAndGetForClass:(Class)className;

@end
