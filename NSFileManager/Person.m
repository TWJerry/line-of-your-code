//
//  Person.m
//  NSFileManager
//
//  Created by mac on 15/8/31.
//  Copyright (c) 2015年 汤威. All rights reserved.
//

#import "Person.h"

@implementation Person
- (Person *(^)())run
{
    
    return ^{
        NSLog(@"run");
        return self;
    };
}

- (Person *(^)())goToSchool
{
    return ^{
        NSLog(@"goToSchool");
        return self;
    };
}
@end
