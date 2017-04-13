//
//  main.m
//  Playing with objc runtime
//
//  Created by Michal Zabielski on 13.04.2017.
//  Copyright © 2017 Kosciej. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
