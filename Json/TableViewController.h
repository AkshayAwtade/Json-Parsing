//
//  TableViewController.h
//  Json
//
//  Created by Student P_03 on 09/11/16.
//  Copyright © 2016 AkshayAwtade. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCell.h"

@interface TableViewController : UITableViewController<UITableViewDelegate,UITableViewDataSource>
{
    
    NSMutableDictionary *dictionaryAllData;
    NSArray *jsonDictionary;
}
@end
