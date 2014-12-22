//
//  TaskObject.m
//  Tasky
//
//  Created by Itamar Nakar on 17/12/14.
//  Copyright (c) 2014 Itamar Nakar. All rights reserved.
//

#import "TaskObject.h"

@implementation TaskObject

- (instancetype)initWithName:(NSString *)taskName description:(NSString *)taskDescription date:(NSDate *)taskDate andComplition:(BOOL)taskComplition
{
    self = [super init];
    if (self) {
        _taskName = taskName;
        self.taskDescription = taskDescription;
        self.taskDate = taskDate;
        self.taskComplition = taskComplition;
    }
    return self;
}

@end
