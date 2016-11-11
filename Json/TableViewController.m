//
//  TableViewController.m
//  Json
//
//  Created by Student P_03 on 09/11/16.
//  Copyright © 2016 AkshayAwtade. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView reloadData];
    [self fetchdata];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)fetchdata
{
    NSString *urlString=@"http://api.androidhive.info/json/movies.json";
    NSURL* Url=[NSURL URLWithString:urlString];
    
    NSURLSession *session=[NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionDataTask * task=[session dataTaskWithURL:Url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error)
        {
            NSLog(@"%@",error.localizedDescription);
        }
        else if(response)
        {
            NSHTTPURLResponse *Httpresponse=(NSHTTPURLResponse *)response;
            if(Httpresponse.statusCode==200)
            {
                if(data)
                {
                    NSError *error;
                    jsonDictionary=[NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
                    
                    if(error)
                    {
                        NSLog(@"%@",error.localizedDescription);
                    }
                    else
                    {
                        [self performSelectorOnMainThread:@selector(methodData:) withObject:jsonDictionary waitUntilDone:NO];
                        
                    }
                    
                }
             
            }
            
        }
        
    }];[task resume];
}
-(void)methodData:(NSArray *)dictionary{
    NSLog(@"%@",dictionary);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return jsonDictionary.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
  
    
     for(dictionaryAllData in jsonDictionary)
     {
         NSMutableDictionary *dictionary=[jsonDictionary objectAtIndex:indexPath.row];
         cell.label1.text =[dictionary valueForKey:@"title"];
         cell.label2.text=[dictionary valueForKey:@"rating"];
      
     }
    
    return cell;
}


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
