//
//  gcdEngine.h
//  Concurrency
//
//  Created by Mathew Cruz on 11/10/12.
//  Copyright (c) 2012 Cloud.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface gcdEngine : NSObject

- (void)startIt:(void(^)(void))completion;

@end
