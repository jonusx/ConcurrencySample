//
//  threadEngine.m
//  Concurrency
//
//  Created by Mathew Cruz on 11/29/12.
//  Copyright (c) 2012 Cloud.com. All rights reserved.
//

#import "threadEngine.h"

@interface threadEngine ()
@property (nonatomic, assign) BOOL operationsCanceled;
@end

@implementation threadEngine

- (void)startIt:(void(^)(void))completion {
    [NSThread detachNewThreadSelector:@selector(wasteMyTime:) toTarget:self withObject:completion];
}

- (void)wasteMyTime:(void(^)(void))completion {
    @autoreleasepool {
        NSInteger i = 0;
        while (i < 20000) {
            if (self.operationsCanceled) {
                NSLog(@"Cancelled!");
                break;
            }
            NSLog(@"%d", i);
            i++;
        }
        completion();
    }

}

- (void)cancelOperations {
    self.operationsCanceled = YES;
}

@end
