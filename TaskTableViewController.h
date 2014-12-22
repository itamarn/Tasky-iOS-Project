//
//  TaskTableViewController.h
//  Tasky
//
//  Created by Itamar Nakar on 17/12/14.
//  Copyright (c) 2014 Itamar Nakar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaskPropertyListData.h"
#import "AddTaskViewController.h"
#import "DtailedTaskViewController.h"


@interface TaskTableViewController : UITableViewController <AddTaskViewControllerDelegate, UIAlertViewDelegate>

@property (strong, nonatomic) NSMutableArray *taskObjacts;

@end
