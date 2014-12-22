//
//  EditTaskViewController.h
//  Tasky
//
//  Created by Itamar Nakar on 17/12/14.
//  Copyright (c) 2014 Itamar Nakar. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "TaskPropertyListData.h"

@protocol EditTaskViewControllerDelegate <NSObject>

-(void)saveEditedTask:(TaskObject*)taskObject;
-(void)cancel;

@end


@interface EditTaskViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>

@property (weak,nonatomic) id <EditTaskViewControllerDelegate> delegate;

@property (strong, nonatomic) TaskObject *taskToEdit;

@property (strong, nonatomic) IBOutlet UITextField *editNameTextField;
@property (strong, nonatomic) IBOutlet UITextView *editDescriptionTextView;
@property (strong, nonatomic) IBOutlet UIDatePicker *editDatePicker;

- (IBAction)saveTaskButtonPressed:(UIButton *)sender;
- (IBAction)cancelButtonePressed:(UIButton *)sender;
@end
