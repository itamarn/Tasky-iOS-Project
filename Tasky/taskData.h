//
//  taskData.h
//  Tasky
//
//  Created by Itamar Nakar on 17/12/14.
//  Copyright (c) 2014 Itamar Nakar. All rights reserved.
//

#import <Foundation/Foundation.h>

#define TASK_NAME @"taskName"
#define TASK_DESCRIPTION @"taskDescription"
#define TASK_DATE @"taskDate"
#define TASK_COMPLITION @"taskComplition"
#define TASK_URGENCY @"taskUrgency"

@interface TaskData : NSObject

-(NSArray *)tasks;

@end
