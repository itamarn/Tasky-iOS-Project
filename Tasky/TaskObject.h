//
//  TaskObject.h
//  Tasky
//
//  Created by Itamar Nakar on 17/12/14.
//  Copyright (c) 2014 Itamar Nakar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TaskData.h"

@interface TaskObject : NSObject

@property (strong, nonatomic) NSString *taskName;
@property (strong, nonatomic) NSString *taskDescription;
@property (strong, nonatomic) NSDate *taskDate;
@property (nonatomic) BOOL taskComplition;

-(id)initWithName:(NSString *)taskName description:(NSString *)taskDescription date:(NSDate *)taskDate andComplition:(BOOL)taskComplition;

@end
