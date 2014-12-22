//
//  AddTaskViewController.m
//  Tasky
//
//  Created by Itamar Nakar on 17/12/14.
//  Copyright (c) 2014 Itamar Nakar. All rights reserved.
//

#import "AddTaskViewController.h"

@interface AddTaskViewController ()

@end

@implementation AddTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.DatePicker =[[UIDatePicker alloc]init];
    //self.DatePicker.datePickerMode = UIDatePickerModeTime;
    self.DatePicker.minimumDate = [NSDate date];
    
    self.taskNameTextField.delegate = self;
    self.taskDescriptionTextView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addTaskButtonPressed:(UIButton *)sender {
    
    if ([self.taskNameTextField.text isEqualToString:@""]) {
        UIAlertView *noTaskNameAlert = [[UIAlertView alloc]initWithTitle:@"Error!" message:@"Please enter your task name." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [noTaskNameAlert show];
    } else {
    TaskObject *task = [[TaskObject alloc] initWithName:self.taskNameTextField.text description:self.taskDescriptionTextView.text date:self.DatePicker.date andComplition:NO];
    
    [self.delegate addTask:task];
     NSLog(@"%@", task.taskName);
    }
}

- (IBAction)cancelButtonPressed:(UIButton *)sender {
    [self.delegate cancel];
}

#pragma mark - UITextField delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - UITextView delegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    } else {
        return YES;
    }
}


@end







