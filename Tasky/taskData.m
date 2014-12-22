//
//  taskData.m
//  Tasky
//
//  Created by Itamar Nakar on 17/12/14.
//  Copyright (c) 2014 Itamar Nakar. All rights reserved.
//

#import "TaskData.h"

@implementation TaskData

-(NSArray *)tasks
{
    NSArray *tasks = [@[]mutableCopy];
    
    NSDictionary *firstTask = @{TASK_NAME:@"FirstTask",TASK_DESCRIPTION:@"My first task spoused to be the first representor to represent static data handeling. again, first",TASK_DATE:[NSDate date], TASK_COMPLITION:[NSNumber numberWithBool:YES]};
    NSDictionary *lastTask = @{TASK_NAME:@"Last Task",TASK_DESCRIPTION:@"My last task spoused to be the last representor to represent static data handeling. again, last",TASK_DATE:[NSDate date], TASK_COMPLITION:[NSNumber numberWithBool:YES]};
    
    tasks = @[firstTask, lastTask];
    return tasks;
}




@end