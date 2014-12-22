//
//  TaskTableViewController.m
//  Tasky
//
//  Created by Itamar Nakar on 17/12/14.
//  Copyright (c) 2014 Itamar Nakar. All rights reserved.
//

#import "TaskTableViewController.h"


@interface TaskTableViewController ()

@end

@implementation TaskTableViewController{
    UIAlertView *changeComplitionAlert;
    NSIndexPath *indexPathForComlitiondCell;
}

-(NSMutableArray *)taskObjacts{
    if (!_taskObjacts) _taskObjacts = [@[]mutableCopy];
    return _taskObjacts;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //loda data from property list
    self.taskObjacts = [[TaskPropertyListData updateTaskObjectsArrayWithPropertyListArray] mutableCopy];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.taskObjacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [self.taskObjacts[indexPath.row] taskName];
    cell.detailTextLabel.text = [self.taskObjacts[indexPath.row] taskDescription];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    indexPathForComlitiondCell = indexPath;
    changeComplitionAlert = [[UIAlertView alloc]initWithTitle:@"Complition" message:@"Do you want set this task as complited?" delegate:self cancelButtonTitle:nil otherButtonTitles: @"No",@"Yup", nil];
    [changeComplitionAlert show];
}

#pragma mark - Table view delegate

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [TaskPropertyListData deleteTaskDictionaryFromPropertyListByTaskObject:self.taskObjacts[indexPath.row]];
        [self.taskObjacts removeObjectAtIndex:indexPath.row];
        // Delete the row from view
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}

 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
     
     //moveTaskFromIndex:(int)fromIndex toIndex:(int)toIndex
     [TaskPropertyListData moveTaskFromIndex:(int)fromIndexPath.row toIndex:(int)toIndexPath.row];
     NSLog(@"%@",[[NSUserDefaults standardUserDefaults] arrayForKey:TASKS_PROPERTY_LIST_ARRAY]);
 }

 // Override to support conditional rearranging of the table view.
// - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
// // Return NO if you do not want the item to be re-orderable.
// return YES;
// }

#pragma mark - Alert view delegate

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if ([alertView isEqual:changeComplitionAlert]) {
        UITableViewCell *completedTaskCell = [self.tableView cellForRowAtIndexPath:indexPathForComlitiondCell];
        if (buttonIndex == 0) {
            [TaskPropertyListData setTaskDictionaryAtIndex:(int)indexPathForComlitiondCell.row asComplited:NO];
            [self setTaskObjectAtIndex:(int)indexPathForComlitiondCell.row asComplited:NO];
            completedTaskCell.textLabel.textColor = [UIColor blackColor];
            completedTaskCell.detailTextLabel.textColor = [UIColor blackColor];
            
        } else if (buttonIndex == 1) {
            [TaskPropertyListData setTaskDictionaryAtIndex:(int)indexPathForComlitiondCell.row asComplited:YES];
            [self setTaskObjectAtIndex:(int)indexPathForComlitiondCell.row asComplited:YES];
            completedTaskCell.textLabel.textColor = [UIColor redColor];
            completedTaskCell.detailTextLabel.textColor = [UIColor redColor];
        }
        [self.tableView reloadData];
    }
}

-(void)setTaskObjectAtIndex:(int)index asComplited:(BOOL)complition
{
    TaskObject *updatedTask = self.taskObjacts[index];
    updatedTask.taskComplition = complition;
    self.taskObjacts[index] = updatedTask;
    
}

#pragma mark - AddTaskViewController delegate

-(void)addTask:(TaskObject *)taskObject
{
    [TaskPropertyListData addNewTaskObjectToPropertyList:taskObject];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"AddTaskSegue"]) {
        if ([segue.destinationViewController isKindOfClass:[AddTaskViewController class]]) {
            AddTaskViewController *nextView = segue.destinationViewController;
            nextView.delegate = self;
        }
    }
    if ([segue.identifier isEqualToString:@"DetailedTaskSegue"]) {
        if ([segue.destinationViewController isKindOfClass:[DtailedTaskViewController class]]) {
            NSIndexPath *indexPath = sender;
            DtailedTaskViewController *nextView = segue.destinationViewController;
            nextView.propertyListIndex = indexPath.row;
        }
    }
    
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"DetailedTaskSegue" sender:indexPath];
}

@end
