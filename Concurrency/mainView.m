//
//  mainView.m
//  Concurrency
//
//  Created by Mathew Cruz on 11/10/12.
//  Copyright (c) 2012 Cloud.com. All rights reserved.
//

#import "mainView.h"
#import "nsopEngine.h"
#import "gcdEngine.h"
#import "threadEngine.h"

@interface mainView () <nsopEngineDelegate>
@property (nonatomic, strong) id runningEngine;
@end

@implementation mainView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.runningEngine cancelOperations];
}

- (IBAction)startAsync:(id)sender {
    switch (self.myType) {
        case nsopType: {
                [self executeOperation];
            }
            break;
        case gcdType: {
                gcdEngine *syncEngine = [[gcdEngine alloc] init];
                self.runningEngine = syncEngine;
            
                [syncEngine startIt:^{
                    self.doneLabel.text = @"Done!";
                }];
            }
            break;
        case threadType: {
                threadEngine *syncEngine = [[threadEngine alloc] init];
                self.runningEngine = syncEngine;
            
                [syncEngine startIt:^{
                    self.doneLabel.text = @"Done!";
                }];
            }
            break;
        case blockingType: {
                NSInteger i = 0;
                while (i < 20000) {
                    NSLog(@"%d", i);
                    i++;
                }
                self.doneLabel.text = @"Done!";
            }
            break;
        default:
            break;
    }
}

- (void)executeOperation {
    nsopEngine *syncEngine = [[nsopEngine alloc] init];
    syncEngine.myDelegate = self;
    self.runningEngine = syncEngine;
    
    NSArray *selectorArray = @[@"startItWithNoQueue", @"startItWithQueue", @"startInvocationOperation", @"startNSBlockOperation:", @"startNSBlockOperation:", @"addBlockToQueue:"];

    SEL selector = NSSelectorFromString(selectorArray[self.nsoperationMethod]);
    
    [syncEngine performSelector:selector withObject:^{
        self.doneLabel.text = @"Done!";
    }];
}

- (void)imDone {
    self.doneLabel.text = @"Done!";
}

@end
