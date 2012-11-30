//
//  myOp.m
//  Concurrency
//
//  Created by Mathew Cruz on 11/10/12.
//  Copyright (c) 2012 Cloud.com. All rights reserved.
//

#import "myOp.h"

@implementation myOp

- (void)main {
        
    NSInteger i = 0;
    while (i < 20000) {
        if (self.isCancelled) {
            NSLog(@"Cancelled!");
            break;
        }
        NSLog(@"%d", i);
        i++;
    }
    
}

@end
