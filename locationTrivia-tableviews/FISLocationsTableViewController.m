//
//  FISLocationsTableViewController.m
//  locationTrivia-tableviews
//
//  Created by Chris Gonzales on 8/20/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISLocationsTableViewController.h"
#import "FISLocation.h"
#import "FISTriviaTableViewController.h"

@interface FISLocationsTableViewController ()

@end

@implementation FISLocationsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Set up some test data
    FISLocation *location1 = [[FISLocation alloc] initWithName:@"The Empire State Building"
                                                      Latitude:@40.7484
                                                     Longitude:@-73.9857];

    FISTrivia *trivia1A = [[FISTrivia alloc] initWithContent:@"1,454 Feet Tall" Likes:4];
    FISTrivia *trivia1B = [[FISTrivia alloc] initWithContent:@"Cost $24,718,000 to build" Likes:2];

    [location1.trivia addObjectsFromArray:@[trivia1A, trivia1B]];

    FISLocation *location2 = [[FISLocation alloc] initWithName:@"Bowling Green"
                                                      Latitude:@41.3739
                                                     Longitude:@-83.6508];

    FISTrivia *trivia2A = [[FISTrivia alloc] initWithContent:@"NYC's oldest park" Likes:8];
    FISTrivia *trivia2B = [[FISTrivia alloc] initWithContent:@"Made a park in 1733" Likes:2];
    FISTrivia *trivia2C = [[FISTrivia alloc] initWithContent:@"Charging Bull was created in 1989" Likes:0];


    [location2.trivia addObjectsFromArray:@[trivia2A, trivia2B, trivia2C]];

    FISLocation *location3 = [[FISLocation alloc] initWithName:@"Statue Of Liberty"
                                                      Latitude:@40.6892
                                                     Longitude:@74.0444];
    FISTrivia *trivia3A = [[FISTrivia alloc] initWithContent:@"Gift from the french" Likes:6];

    [location3.trivia addObjectsFromArray:@[trivia3A]];


    // Add them to the locations property on FISLocationsTableViewController
    self.locations = @[location1,location2,location3];

    self.tableView.accessibilityLabel = @"Locations Table";
    self.tableView.accessibilityIdentifier = @"Locations Table";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.locations count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RightDetail" forIndexPath:indexPath];
    FISLocation *currentLocation = self.locations[indexPath.row];
    cell.textLabel.text = currentLocation.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)[currentLocation.trivia count]];

    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.

    NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];

    FISLocation *selectedLocation = self.locations[selectedIndexPath.row];
    FISTriviaTableViewController *nextVC = segue.destinationViewController;

    nextVC.trivia = selectedLocation.trivia;
}

@end
