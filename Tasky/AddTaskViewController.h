//
//  AddTaskViewController.h
//  Tasky
//
//  Created by Itamar Nakar on 17/12/14.
//  Copyright (c) 2014 Itamar Nakar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaskPropertyListData.h"

@protocol AddTaskViewControllerDelegate <NSObject>

-(void)addTask:(TaskObject *)taskObject;
-(void)cancel;

@end

@interface AddTaskViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>

@property (weak,nonatomic) id <AddTaskViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *taskNameTextField;
@property (strong, nonatomic) IBOutlet UITextView *taskDescriptionTextView;
@property (strong, nonatomic) IBOutlet UIDatePicker *DatePicker;

- (IBAction)addTaskButtonPressed:(UIButton *)sender;
- (IBAction)cancelButtonPressed:(UIButton *)sender;

@end
