//
//  ViewController.m
//  NSFileManager
//
//  Created by mac on 15/8/31.
//  Copyright (c) 2015年 汤威. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()

@end

@implementation ViewController

NSUInteger codeLineCount(NSString *path);
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    NSString *path = NSHomeDirectory();
//    NSString *bundlePath = [NSBundle mainBundle];
    
    NSInteger lines = [self codeLineCount:@"/Users/mac/Desktop/testLines"]; // 传入路径
    
    NSLog(@"%ld",lines);
    
}

- (NSInteger)demoWithPath:(NSString *)fullPath
{
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    BOOL dir = NO;

    BOOL is = [mgr fileExistsAtPath:fullPath isDirectory:&dir];
    
    if (!is) return 0;
    
    if (dir) {
        NSArray *array = [mgr subpathsAtPath:fullPath];
        NSInteger totalSize = 0;
        for (NSString *subPath in array) {
            NSString *filePath = [fullPath stringByAppendingPathComponent:subPath];
            
            BOOL subDir = NO;
            [mgr fileExistsAtPath:filePath isDirectory:&subDir];
            if (subDir == NO) {
                NSDictionary *dict = [mgr attributesOfItemAtPath:filePath error:nil];
                NSInteger fileSize = [dict[NSFileSize] integerValue];
                totalSize += fileSize;
            }
        }
          return totalSize;
    }else{
        return [[mgr attributesOfItemAtPath:fullPath error:nil][NSFileSize] integerValue];
    }
}

-(NSUInteger)codeLineCount:(NSString *)path
{
    // 1.获得文件管理者
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    // 2.标记是否为文件夹
    BOOL dir = NO; // 标记是否为文件夹
    // 标记这个路径是否存在
    BOOL exist = [mgr fileExistsAtPath:path isDirectory:&dir];
    
    // 3.如果不存在，直接返回0
    if(!exist)
    {
        NSLog(@"文件路径不存在!");
        return 0;
    }
    
    if (dir)
    { // 文件夹
        // 获得当前文件夹path下面的所有内容（文件夹、文件）
        
        NSLog(@"*****%@",path);
        NSArray *array = [mgr contentsOfDirectoryAtPath:path error:nil];
        int count = 0;
        
        // 遍历数组中的所有子文件（夹）名
        for (NSString *filename in array)
        {
            // 获得子文件（夹）的全路径
            NSString *fullPath = [NSString stringWithFormat:@"%@/%@", path, filename];
            
            // 累加每个子路径的总行数
            count += [self codeLineCount:fullPath];
            
            NSLog(@"%d--%@----%ld",count,fullPath,array.count);
            
        }
        
        return count;
    }
    else
    { // 文件
        // 判断文件的拓展名(忽略大小写)
        NSString *extension = [[path pathExtension] lowercaseString];
        if (![extension isEqualToString:@"h"]
            && ![extension isEqualToString:@"m"]
            && ![extension isEqualToString:@"c"])
        {
            // 文件拓展名不是h，而且也不是m，而且也不是c
            return 0;
        }
        
        // 加载文件内容
        NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        
        // 将文件内容切割为每一行
        NSArray *array = [content componentsSeparatedByString:@"\n"];
        
        NSRange range = [path rangeOfString:@"/Users/mac/Desktop/testLines"];
        return array.count;
    }
}



- (void)demo1
{
    Person *(^Block)() = ^{
        return [[Person alloc] init];
    };
    
    Person *p = [[Person alloc] init];
    
    Block  = p.goToSchool;
    
    p.goToSchool().run();
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
