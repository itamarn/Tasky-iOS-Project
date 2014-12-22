//
//  EditTaskViewController.m
//  Tasky
//
//  Created by Itamar Nakar on 17/12/14.
//  Copyright (c) 2014 Itamar Nakar. All rights reserved.
//

#import "EditTaskViewController.h"

@interface EditTaskViewController ()

@end

@implementation EditTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.editDatePicker.datePickerMode = UIDatePickerModeDate;
    self.editDatePicker.minimumDate = [NSDate date];
    
    self.editNameTextField.text = self.taskToEdit.taskName;
    self.editDescriptionTextView.text = self.taskToEdit.taskDescription;
    self.editDatePicker.date = self.taskToEdit.taskDate;
    
    self.editNameTextField.delegate = self;
    self.editDescriptionTextView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveTaskButtonPressed:(UIButton *)sender {
    
    TaskObject *editedTask = [[TaskObject alloc] initWithName:self.editNameTextField.text description:self.editDescriptionTextView.text date:self.editDatePicker.date andComplition:NO];
    
    [self.delegate saveEditedTask:editedTask];
}

- (IBAction)cancelButtonePressed:(UIButton *)sender {
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












