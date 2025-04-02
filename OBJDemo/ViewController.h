//
//  ViewController.h
//  OBJDemo
//
//  Created by 1234 on 01/04/25.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *todoTBL;


@end

