//
//  nsopEngine.h
//  Concurrency
//
//  Created by Mathew Cruz on 11/10/12.
//  Copyright (c) 2012 Cloud.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol nsopEngineDelegate <NSObject>

- (void)imDone;

@end

@interface nsopEngine : NSObject

@property (nonatomic, assign) id<nsopEngineDelegate> myDelegate;

- (void)startItWithNoQueue;
- (void)startItWithQueue;
- (void)startInvocationOperation;
- (void)startNSBlockOperation:(void(^)(void))completion;
- (void)addBlockToQueue:(void(^)(void))completion;

- (void)cancelOperations;

@end
