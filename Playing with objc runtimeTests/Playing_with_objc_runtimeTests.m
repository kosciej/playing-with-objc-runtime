//
//  Playing_with_objc_runtimeTests.m
//  Playing with objc runtimeTests
//
//  Created by Michał Zabielski on 14.04.2017.
//  Copyright © 2017 Kosciej. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TestObject.h"

@interface Playing_with_objc_runtimeTests : XCTestCase

@end

@implementation Playing_with_objc_runtimeTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testNSInvocation {
    TestObject* testObject = [[TestObject alloc] init];
    NSInvocation *anInvocation;

    //__weak id returnValue = nil;
    NSMethodSignature* slr = [testObject methodSignatureForSelector: @selector(testThings)];
    anInvocation = [NSInvocation invocationWithMethodSignature:slr];
    [anInvocation setSelector:@selector(resolveThisMethodDynamically)];
    [anInvocation setTarget:testObject];
    [anInvocation invoke];
    //[anInvocation getReturnValue:&returnValue];
    //[testObject performSelector:@selector(resolveThisMethodDynamically)];
}

- (void)testNormalMethodInvocation {
    TestObject* testObject = [[TestObject alloc] init];
    [testObject testThings];
}

- (void)testIMPCaching {
    TestObject* testObject = [[TestObject alloc] init];
    SEL sel = @selector(resolveThisMethodDynamically);
    typedef void (*fun)(id, SEL);
    fun f = (fun)[testObject methodForSelector:sel];
    (f)(testObject, sel);
    
}

- (void)testIMPCaching2 {
    TestObject* testObject = [[TestObject alloc] init];
    SEL sel = @selector(resolveThisMethodDynamically);
    IMP f = [testObject methodForSelector:sel];
    
    // had to disable strict checking of objc_msgSend calls in order to compile
    (f)(testObject, sel);
    
}

- (void)testPerformSelector {
    TestObject* testObject = [[TestObject alloc] init];
    [testObject performSelector:@selector(resolveThisMethodDynamically)];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
