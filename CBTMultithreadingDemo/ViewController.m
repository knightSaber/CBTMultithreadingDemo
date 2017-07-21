//
//  ViewController.m
//  CBTTrunOtherControllerDemo
//
//  Created by 陈波涛 on 2017/7/7.
//  Copyright © 2017年 microfastup. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self func10];
    
}

//死锁的第一种情况
- (void)func10{
    
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"死锁了吗");
    });
    
}

//死锁的第二种情况
- (void)func9{
    
    dispatch_queue_t q = dispatch_queue_create("1111111", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(q, ^{
        
        NSLog(@"11111");
        dispatch_async(q, ^{
            NSLog(@"22222");
        });
        NSLog(@"33333");
    });
    
    NSLog(@"44444");
    NSLog(@"5555");
}


//同步派遣+串行队列
- (void)func1{
    
    dispatch_queue_t q1 = dispatch_queue_create("aaaaa", DISPATCH_QUEUE_SERIAL);
    
    dispatch_sync(q1, ^{
        
        NSLog(@"1111");
        
    });
    
    NSLog(@"22222");
    
}

//异步派遣+串行队列
- (void)func2{
    
    dispatch_queue_t q2 = dispatch_queue_create("bbbbbb", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(q2, ^{
        
        NSLog(@"1111");
        
    });
    
    NSLog(@"22222");
    
}

//同步派遣+并行队列
- (void)func3{
    
    dispatch_queue_t q3 = dispatch_queue_create("cccccc", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_sync(q3, ^{
        
        NSLog(@"1111");
        
    });
    
    NSLog(@"22222");
    
}

//异步派遣+并行队列
- (void)func4{
    
    dispatch_queue_t q4 = dispatch_queue_create("ddddddd", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(q4, ^{
        
        NSLog(@"1111");
        
    });
    
    NSLog(@"22222");
    
}


@end
