//
//  ViewController.m
//  Playing with objc runtime
//
//  Created by Michal Zabielski on 13.04.2017.
//  Copyright © 2017 Kosciej. All rights reserved.
//
#import "TestObject.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    TestObject* testObject = [[TestObject alloc] init];
    //[testObject testThings];
    NSInvocation *anInvocation;
    //[[NSInvocation invocationWithTarget:testObject invocationOut:&anInvocation]
     //updateAppointmentsForDate:todaysDate];
    //__weak id returnValue = nil;
    NSMethodSignature* slr = [testObject methodSignatureForSelector: @selector(testThings)];
    anInvocation = [NSInvocation invocationWithMethodSignature:slr];
    [anInvocation setSelector:@selector(resolveThisMethodDynamically)];
    [anInvocation setTarget:testObject];
    [anInvocation invoke];
    //[anInvocation getReturnValue:&returnValue];
    //[testObject performSelector:@selector(resolveThisMethodDynamically)];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
