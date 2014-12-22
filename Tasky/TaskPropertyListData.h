//
//  TaskPropertyListData.h
//  Tasky
//
//  Created by Itamar Nakar on 17/12/14.
//  Copyright (c) 2014 Itamar Nakar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TaskObject.h"

#define TASKS_PROPERTY_LIST_ARRAY @"tasks property list array"

#define TASK_NAME @"taskName"
#define TASK_DESCRIPTION @"taskDescription"
#define TASK_DATE @"taskDate"
#define TASK_COMPLITION @"taskComplition"
#define TASK_URGENCY @"taskUrgency"

@interface TaskPropertyListData : NSObject

/*Class method that add and sycronize a Dictionary Object to UserDefaults PropertyList, The Dictionary Object is convertd from a new 'TaskObject'.*/
+(void)addNewTaskObjectToPropertyList:(TaskObject *)taskObj;

/*This method take an edited 'TaskObject' and saves and sycronize it as a Dictionary Object to UserDefaults PropertyList.*/
+(void)updatePropertyListDictionaryWithEditedTaskObject:(TaskObject *)taskObject atIndex:(int)index;

/*This method returns a 'TaskObject' from a specific index in the UserDefaults PropertyList array that holdes Dictionary Objects.*/
+(TaskObject *)getTaskObjectFromPropertyListAtIndex:(int)index;

/*This method return an Array of 'TaskObjects' converted from UserDefaults PropertyList Array that holdes 'Dictionary Objects Array'.*/
+(NSArray *)updateTaskObjectsArrayWithPropertyListArray;

/*Use TaskObject to deteurmin whitch TaskDictionary to delete from PropertyList Array, includ sycronization.*/
+(void)deleteTaskDictionaryFromPropertyListByTaskObject:(TaskObject *)taskObject;

/*Use given index to update TaskDictionary complition property, includ sycronization.*/
+(void)setTaskDictionaryAtIndex:(int)index asComplited:(BOOL)complition;

+(void)moveTaskFromIndex:(int)fromIndex toIndex:(int)toIndex;




/*Iterats through PropertyList to find a specific 'TaskObject'*/
// not currently in use
-(BOOL)doesTaskObjectExistInPropertyList:(TaskObject *)taskObject;

@end










