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
    NSLog(@"%@", [NSThread callStackSymbols]);
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
    NSLog(@"TestObject: Release!");
    [super release];

}

-(instancetype)retain{
    NSLog(@"TestObject: Retain!");
    return [super retain];
}

-(instancetype)autorelease{
    NSLog(@"TestObject: autorelease!");
    return [super autorelease];
}

-(void)testThings {
    [self resolveThisMethodDynamically];
}


@end
