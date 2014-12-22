//
//  DtailedTaskViewController.h
//  Tasky
//
//  Created by Itamar Nakar on 17/12/14.
//  Copyright (c) 2014 Itamar Nakar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaskPropertyListData.h"
#import "EditTaskViewController.h"


@interface DtailedTaskViewController : UIViewController <EditTaskViewControllerDelegate>

@property (nonatomic) int propertyListIndex;

@property (strong, nonatomic) IBOutlet UILabel *taskNameLable;
@property (strong, nonatomic) IBOutlet UILabel *taskDateLable;
@property (strong, nonatomic) IBOutlet UILabel *taskDesctiptionLable;


@end
