//
//  Person.h
//  NSFileManager
//
//  Created by mac on 15/8/31.
//  Copyright (c) 2015年 汤威. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic,strong) NSString *name;
@property (nonatomic,assign) NSInteger age;

- (Person *(^)())goToSchool;
- (Person *(^)())run;
@end
