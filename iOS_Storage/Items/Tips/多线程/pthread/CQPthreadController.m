//
//  CQPthreadController.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/5/28.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQPthreadController.h"
#import <pthread.h>

@interface CQPthreadController ()

@end

@implementation CQPthreadController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    pthread_t threads[2];
    for (NSInteger i = 0; i<2; i++) {
        pthread_create(&threads[i], NULL, studyPthreadMethond, (void *)i);
    }
}

void *studyPthreadMethond(void *threadID)
{
    long tid = (long)threadID;
    NSLog(@"currentThread = %@ threadID%ld",[NSThread currentThread],tid);
    pthread_exit(NULL);
    return NULL;
}

@end
