//
//  mainView.h
//  Concurrency
//
//  Created by Mathew Cruz on 11/10/12.
//  Copyright (c) 2012 Cloud.com. All rights reserved.
//

#import <UIKit/UIKit.h>

enum asyncType {
    gcdType = 0,
    nsopType,
    threadType,
    blockingType
    };
typedef NSInteger asyncType;

enum opType {
    noQueue = 0,
    withQueue,
    invocation,
    blockObject,
    rawBlock
};
typedef NSInteger opType;

@interface mainView : UIViewController
@property (nonatomic, assign) asyncType myType;
@property (nonatomic, assign) opType nsoperationMethod;
@property (weak, nonatomic) IBOutlet UILabel *doneLabel;
- (IBAction)startAsync:(id)sender;

@end
