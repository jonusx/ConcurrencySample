//
//  nsopEngine.m
//  Concurrency
//
//  Created by Mathew Cruz on 11/10/12.
//  Copyright (c) 2012 Cloud.com. All rights reserved.
//

#import "nsopEngine.h"
#import "myOp.h"

@interface nsopEngine ()

@property (nonatomic, strong) NSOperationQueue *theSuperQueue;
@property (nonatomic, assign) BOOL operationsCanceled;
@end

@implementation nsopEngine

- (id)init {
    self = [super init];
    if (self) {
        self.theSuperQueue = [[NSOperationQueue alloc] init];
    }
    return self;
}

- (void)cancelOperations {
    self.operationsCanceled = YES;
    [self.theSuperQueue cancelAllOperations];
}

- (void)startItWithNoQueue {
    myOp *theOpertion = [[myOp alloc] init];
    
    nsopEngine * __weak weakSelf = self;
    
    [theOpertion setCompletionBlock:^{
        nsopEngine * __strong strongSelf = weakSelf;
        [strongSelf.myDelegate imDone];
    }];
    
    
    [theOpertion start];
}

- (void)startItWithQueue {
    myOp *theOpertion = [[myOp alloc] init];
    
    nsopEngine * __weak weakSelf = self;
    
    [theOpertion setCompletionBlock:^{
        nsopEngine * __strong strongSelf = weakSelf;
        [strongSelf.myDelegate imDone];
    }];
    
    [self.theSuperQueue addOperation:theOpertion];
}

- (void)startInvocationOperation {
    NSInvocationOperation *invocOp = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(wasteMyTime) object:nil];
    NSOperationQueue *theQueue = [[NSOperationQueue alloc] init];
    
    
    nsopEngine * __weak weakSelf = self;
    [invocOp setCompletionBlock:^{
        nsopEngine * __strong strongSelf = weakSelf;
        [strongSelf.myDelegate imDone];
    }];
    [theQueue addOperation:invocOp];
}

- (void)startNSBlockOperation:(void(^)(void))completion {

    NSOperationQueue *blockQueue = [[NSOperationQueue alloc] init];
    
    nsopEngine * __weak weakSelf = self;
    NSBlockOperation *blockOp = [NSBlockOperation blockOperationWithBlock:^{
        nsopEngine * __strong strongSelf = weakSelf;
        [strongSelf wasteMyTime];
    }];
    
    [blockOp setQueuePriority:NSOperationQueuePriorityVeryHigh];
    [blockOp setCompletionBlock:completion];
    
    [blockQueue addOperation:blockOp];
    
}

- (void)addBlockToQueue:(void(^)(void))completion {
    
    nsopEngine * __weak weakSelf = self;
    [self.theSuperQueue addOperationWithBlock:^{
        nsopEngine * __strong strongSelf = weakSelf;
        [strongSelf wasteMyTime];

        [[NSOperationQueue mainQueue] addOperationWithBlock:completion];
    }];
}

- (void)wasteMyTime {
    NSInteger i = 0;
    while (i < 20000) {
        if (self.operationsCanceled) {
            NSLog(@"Cancelled!");
            break;
        }
        NSLog(@"%d", i);
        i++;
    }
}


@end
