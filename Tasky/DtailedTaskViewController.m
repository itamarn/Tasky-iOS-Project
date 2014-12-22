//
//  DtailedTaskViewController.m
//  Tasky
//
//  Created by Itamar Nakar on 17/12/14.
//  Copyright (c) 2014 Itamar Nakar. All rights reserved.
//

#import "DtailedTaskViewController.h"


@interface DtailedTaskViewController ()

@end

@implementation DtailedTaskViewController{
    TaskObject *selectedTask;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    selectedTask = [TaskPropertyListData getTaskObjectFromPropertyListAtIndex:self.propertyListIndex];
    self.taskNameLable.text = selectedTask.taskName;
    self.taskDesctiptionLable.text = selectedTask.taskDescription;
    
    // Date Formatter
    NSDate *date = selectedTask.taskDate;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd-MM-yyyy"];
    NSString *dateString = [formatter stringFromDate:date];
                      
    self.taskDateLable.text = dateString;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - EditTaskViewController Delegate

-(void)saveEditedTask:(TaskObject *)taskObject
{
    [TaskPropertyListData updatePropertyListDictionaryWithEditedTaskObject:taskObject atIndex:self.propertyListIndex];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)cancel
{
    //save task code here
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Navigation
 
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"EditTaskSegue"]) {
        if ([segue.destinationViewController isKindOfClass:[EditTaskViewController class]]) {
            //NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
            EditTaskViewController *nextView = segue.destinationViewController;
            nextView.delegate = self;
            nextView.taskToEdit = selectedTask;
        }
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
