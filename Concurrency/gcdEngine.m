//
//  gcdEngine.m
//  Concurrency
//
//  Created by Mathew Cruz on 11/10/12.
//  Copyright (c) 2012 Cloud.com. All rights reserved.
//

#import "gcdEngine.h"

@interface gcdEngine ()
@property (nonatomic, assign) BOOL operationsCanceled;
@end

@implementation gcdEngine

static dispatch_queue_t com_test_sync_queue = nil;
static dispatch_queue_t get_test_sync_queue()
{
    if (com_test_sync_queue == nil) {
        com_test_sync_queue = dispatch_queue_create("com.cloud.sync.processing", DISPATCH_QUEUE_CONCURRENT);
    }
    return com_test_sync_queue;
}

- (void)startIt:(void(^)(void))completion {
    dispatch_queue_t myGCDQueue = dispatch_queue_create("com.goodie.team", DISPATCH_QUEUE_SERIAL);
    
    gcdEngine * __weak weakSelf = self;
    dispatch_async(myGCDQueue, ^{
        gcdEngine * __strong strongSelf = weakSelf;
        
        NSInteger i = 0;
        while (i < 20000) {
            if (strongSelf.operationsCanceled) {
                NSLog(@"Cancelled!");
                break;
            }
            NSLog(@"%d", i);
            i++;
        }
        completion();
    });
}

- (void)cancelOperations {
    self.operationsCanceled = YES;
}

@end
