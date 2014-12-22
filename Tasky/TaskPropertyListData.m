//
//  TaskPropertyListData.m
//  Tasky
//
//  Created by Itamar Nakar on 17/12/14.
//  Copyright (c) 2014 Itamar Nakar. All rights reserved.
//

#import "TaskPropertyListData.h"

@implementation TaskPropertyListData

-(BOOL)doesTaskObjectExistInPropertyList:(TaskObject *)taskObject
{
    BOOL exist = NO;
    if ([[NSUserDefaults standardUserDefaults] arrayForKey:TASKS_PROPERTY_LIST_ARRAY]){
        NSArray *arrayOfDictionaries = [[[NSUserDefaults standardUserDefaults] arrayForKey:TASKS_PROPERTY_LIST_ARRAY] mutableCopy];
        for (NSDictionary *dictionary in arrayOfDictionaries) {
             if ([taskObject.taskName isEqualToString:dictionary[TASK_NAME]]) { //serching for the right dictionaty by it's name
                 exist = YES;
             }
        }
    }
    return exist;
}

/*This method addes and sycronize a Dictionary Object to UserDefaults PropertyList, The Dictionary Object is convertd from a new 'TaskObject'.*/
+(void)addNewTaskObjectToPropertyList:(TaskObject *)taskObject
{
    NSMutableArray *updateArray = [[[NSUserDefaults standardUserDefaults] arrayForKey:TASKS_PROPERTY_LIST_ARRAY] mutableCopy];
    NSDictionary *newTask = @{TASK_NAME:taskObject.taskName,TASK_DESCRIPTION:taskObject.taskDescription,TASK_DATE:taskObject.taskDate, TASK_COMPLITION:[NSNumber numberWithBool:taskObject.taskComplition]};
    if (!updateArray) updateArray = [[NSMutableArray alloc]init];
    [updateArray addObject:newTask];
    
    [[NSUserDefaults standardUserDefaults] setObject:updateArray forKey:TASKS_PROPERTY_LIST_ARRAY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

/*This method take an edited 'TaskObject' and saves and sycronize it as a Dictionary Object to UserDefaults PropertyList.*/
+(void)updatePropertyListDictionaryWithEditedTaskObject:(TaskObject *)taskObject atIndex:(int)index
{
    if ([[NSUserDefaults standardUserDefaults] arrayForKey:TASKS_PROPERTY_LIST_ARRAY]){
        NSMutableArray *updatedArray = [NSMutableArray array];
        NSArray *arrayFromPropertyList = [[NSUserDefaults standardUserDefaults] arrayForKey:TASKS_PROPERTY_LIST_ARRAY] ;
        for (int i =0 ;  i < arrayFromPropertyList.count ; i++) {
            NSMutableDictionary *dictionary =  [arrayFromPropertyList[i] mutableCopy];
            if (i == index) { //compering index of Dictionary Array and index of Object Array
                dictionary[TASK_NAME] = taskObject.taskName;
                dictionary[TASK_DESCRIPTION] = taskObject.taskDescription;
                dictionary[TASK_DATE] = taskObject.taskDate;
                dictionary[TASK_COMPLITION] = [NSNumber numberWithBool:taskObject.taskComplition];
            }
            [updatedArray addObject:dictionary];
            [[NSUserDefaults standardUserDefaults] setObject:updatedArray forKey:TASKS_PROPERTY_LIST_ARRAY];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
    }
}

/*This method returns a 'TaskObject' from a specific index in the UserDefaults PropertyList array that holdes Dictionary Objects.*/
+(TaskObject *)getTaskObjectFromPropertyListAtIndex:(int)index
{
    TaskObject *task;
    if ([[NSUserDefaults standardUserDefaults] arrayForKey:TASKS_PROPERTY_LIST_ARRAY]){
        NSMutableArray *propertyListArray = [[[NSUserDefaults standardUserDefaults] arrayForKey:TASKS_PROPERTY_LIST_ARRAY] mutableCopy];
        for (int i = 0; i < propertyListArray.count; i++) {
            if (index == i) {
                NSDictionary *dictionary = propertyListArray[i];
                task = [[TaskObject alloc] initWithName:dictionary[TASK_NAME] description:dictionary[TASK_DESCRIPTION] date:dictionary[TASK_DATE] andComplition:[dictionary[TASK_COMPLITION] intValue]];
            }
        }
    }
    return task;
}

/*This method converts a UserDefaults PropertyList Array that holdes 'Dictionary Objects Array' into an Array of 'TaskObject's and return it.*/
+(NSArray *)updateTaskObjectsArrayWithPropertyListArray;
{
    NSMutableArray * arrayOfObjects = [@[]mutableCopy];
    //loda data from property list
    if ([[NSUserDefaults standardUserDefaults] arrayForKey:TASKS_PROPERTY_LIST_ARRAY]){
        NSArray *arrayOfDictionaries = [[[NSUserDefaults standardUserDefaults] arrayForKey:TASKS_PROPERTY_LIST_ARRAY] mutableCopy];
        for (NSDictionary *dictionary in arrayOfDictionaries) {
            TaskObject *newTask =[[TaskObject alloc] initWithName:dictionary[TASK_NAME] description:dictionary[TASK_DESCRIPTION] date:dictionary[TASK_DATE] andComplition:[dictionary[TASK_COMPLITION] intValue]];
            [arrayOfObjects addObject:newTask];
        }
    }
    return arrayOfObjects;
}

+(void)deleteTaskDictionaryFromPropertyListByTaskObject:(TaskObject *)taskObject
{
    // Still a bit debugy due to weak if statment, should consider using ID parameter in 'TaskObject'.
     if ([[NSUserDefaults standardUserDefaults] arrayForKey:TASKS_PROPERTY_LIST_ARRAY]){
        NSArray *arrayOfDictionaries = [[NSUserDefaults standardUserDefaults] arrayForKey:TASKS_PROPERTY_LIST_ARRAY] ;
         for (int i =0 ;  i < arrayOfDictionaries.count ; i++) {
             NSDictionary *dictionary = arrayOfDictionaries[i];
             if ([taskObject.taskName isEqualToString:dictionary[TASK_NAME]]) { //serching for the right dictionaty by it's name
                 NSMutableArray *updatedArray = [[[NSUserDefaults standardUserDefaults] arrayForKey:TASKS_PROPERTY_LIST_ARRAY] mutableCopy];
                 [updatedArray removeObjectAtIndex:i];
                 [[NSUserDefaults standardUserDefaults] setObject:updatedArray forKey:TASKS_PROPERTY_LIST_ARRAY];
                 [[NSUserDefaults standardUserDefaults] synchronize];
             }
         }
     }
}

+(void)setTaskDictionaryAtIndex:(int)index asComplited:(BOOL)complition
{
    if ([[NSUserDefaults standardUserDefaults] arrayForKey:TASKS_PROPERTY_LIST_ARRAY]){
        NSMutableArray *updatedArray = [NSMutableArray array];
        NSArray *arrayFromPropertyList = [[NSUserDefaults standardUserDefaults] arrayForKey:TASKS_PROPERTY_LIST_ARRAY] ;
        for (int i =0 ;  i < arrayFromPropertyList.count ; i++) {
            NSMutableDictionary *dictionary = [arrayFromPropertyList[i] mutableCopy];
            if (i == index) { //compering index of Dictionary Array and index of Object Array
                NSNumber *bollNumber = [NSNumber numberWithBool:complition];
                dictionary[TASK_COMPLITION] = bollNumber;
            }
            [updatedArray addObject:dictionary];
            [[NSUserDefaults standardUserDefaults] setObject:updatedArray forKey:TASKS_PROPERTY_LIST_ARRAY];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
    }
}

+(void)moveTaskFromIndex:(int)fromIndex toIndex:(int)toIndex
{
    if ([[NSUserDefaults standardUserDefaults] arrayForKey:TASKS_PROPERTY_LIST_ARRAY]){
        NSMutableArray *updatedArray = [[[NSUserDefaults standardUserDefaults] arrayForKey:TASKS_PROPERTY_LIST_ARRAY] mutableCopy];
        NSDictionary *fromIndexDictionary = updatedArray[fromIndex];
        [updatedArray removeObjectAtIndex:fromIndex];
        [updatedArray insertObject:fromIndexDictionary atIndex:toIndex];
        
        [[NSUserDefaults standardUserDefaults] setObject:updatedArray forKey:TASKS_PROPERTY_LIST_ARRAY];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}


@end
















