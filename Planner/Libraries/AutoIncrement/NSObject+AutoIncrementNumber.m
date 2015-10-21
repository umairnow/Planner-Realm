//
//  NSObject+AutoIncrementNumber.m
//  Planner
//
//  Created by Umair Aamir on 10/21/15.
//  Copyright © 2015 Umair Aamir. All rights reserved.
//

#import "NSObject+AutoIncrementNumber.h"

@implementation NSObject (AutoIncrementNumber)

+ (NSInteger)addAndGetForClass:(Class)className {
    NSString *UserDefaults = NSStringFromClass(className);
    NSUInteger oldValue = 0;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:UserDefaults]) {
        oldValue = [[defaults objectForKey:UserDefaults] integerValue];
    }
    oldValue += 1;
    [defaults setObject:@(oldValue) forKey:UserDefaults];
    [defaults synchronize];
    return oldValue;
}

+ (NSInteger)getLastValue:(Class)className {
    NSString *UserDefaults = NSStringFromClass(className);
    NSUInteger oldValue = 0;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:UserDefaults]) {
        oldValue = [[defaults objectForKey:UserDefaults] integerValue];
    }
    oldValue = 1;
    [defaults setObject:@(oldValue) forKey:UserDefaults];
    [defaults synchronize];
    return oldValue;
}

@end
