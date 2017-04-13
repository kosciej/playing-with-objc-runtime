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
    [testObject testThings];
    [testObject performSelector:@selector(resolveThisMethodDynamically)];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
