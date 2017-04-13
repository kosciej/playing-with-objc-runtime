//
//  TestObject.m
//  Playing with objc runtime
//
//  Created by Michal Zabielski on 13.04.2017.
//  Copyright © 2017 Kosciej. All rights reserved.
//

#import "TestObject.h"
#import <objc/runtime.h>

void dynamicMethodIMP(id self, SEL _cmd) {
    NSLog(@"Dynamic method!!!");
}

@implementation TestObject

+ (BOOL)resolveInstanceMethod:(SEL)aSEL
{
    if (aSEL == @selector(resolveThisMethodDynamically)) {
        class_addMethod([self class], @selector(resolveThisMethodDynamically), (IMP) dynamicMethodIMP, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:aSEL];
}

-(oneway void)release{
    NSLog(@"RELEASE!!!!");
    NSLog(@"retain count: %u", [super retainCount]);
    [super release];
    NSLog(@"retain count: %u", [super retainCount]);
}

-(instancetype)retain{
    NSLog(@"Retain!");
    return [super retain];
}

-(instancetype)autorelease{
    NSLog(@"autorelease!");
    return [super autorelease];
}

-(void)testThings {
    [self resolveThisMethodDynamically];
    [nil resolveThisMethodDynamically];
    
}


@end
