//
//  MessagesViewController.m
//  Career Map 3
//
//  Created by Adel  Shehadeh on 5/12/15.
//  Copyright (c) 2015 Adel  Shehadeh. All rights reserved.
//

#import "MessagesViewController.h"

@interface MessagesViewController ()

@end

@implementation MessagesViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    NSLog(@"Messages list 'view did load'");
}

- (void) viewDidAppear:(BOOL)animated{
    
    
    NSLog(@"Messages list 'view did appear'");
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"messageFrom = %@ OR messageTo = %@",[PFUser currentUser], [PFUser currentUser]];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Messages" predicate:predicate];
    [query orderByDescending:@"createdAt"];
    [query includeKey:@"messageFrom"];
    [query includeKey:@"messageTo"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
           // NSLog(@"objects: %@", objects);
            
            //initialize arrays
            _messageFromArray = [NSMutableArray new];
            _messageToArray = [NSMutableArray new];
            _chatUsersList = [NSMutableArray new];
            _chatUsersNamesList = [NSMutableArray new];

            
            for (PFObject *object in objects) {
               // NSLog(@"messageFrom = %@", [[object objectForKey:@"messageFrom"] objectForKey:@"username"]);
                //NSLog(@"messageTo = %@", [[object objectForKey:@"messageTo"] objectId]);
               // NSLog(@"message = %@ \n\n", [object objectForKey:@"messageContent"]);
                
                
                
               // [_messageFromArray addObject:[[object objectForKey:@"messageFrom"] objectId]];
               // [_messageFromArray addObject:[[object objectForKey:@"messageTo"] objectId]];

                
                
                if ([[[object objectForKey:@"messageFrom"] objectId] isEqualToString:[[PFUser currentUser] objectId]]) {
                    
                    
                    if (![_chatUsersList containsObject:[[object objectForKey:@"messageTo"] objectId]]) {
                        //add user to the list of chatters
                        [_chatUsersList addObject:[[object objectForKey:@"messageTo"] objectId]];
                        [_chatUsersNamesList addObject:[[object objectForKey:@"messageTo"] objectForKey:@"username"]];
                    }
                    
                    
                    
                }
                
                else{
                    
                    if (![_chatUsersList containsObject:[[object objectForKey:@"messageFrom"] objectId]]) {
                        //add user to the list of chatters
                        [_chatUsersList addObject:[[object objectForKey:@"messageFrom"] objectId]];
                        [_chatUsersNamesList addObject:[[object objectForKey:@"messageFrom"] objectForKey:@"username"]];


                    }
                    
                    NSLog(@"chat users IDs list = %@", _chatUsersList);
                    NSLog(@"chat usernames list = %@", _chatUsersNamesList);

                
                }
                
                
                
                
                
            }
            
            
            
        }
        
        else{
            
            NSLog(@"error retrieving messages");
        }
    }];
    
    
    
    
    
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
