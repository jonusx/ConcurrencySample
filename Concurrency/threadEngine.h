//
//  threadEngine.h
//  Concurrency
//
//  Created by Mathew Cruz on 11/29/12.
//  Copyright (c) 2012 Cloud.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface threadEngine : NSObject

- (void)startIt:(void(^)(void))completion;
- (void)cancelOperations;

@end
