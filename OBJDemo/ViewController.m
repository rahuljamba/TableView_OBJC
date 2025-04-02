//
//  ViewController.m
//  OBJDemo
//
//  Created by 1234 on 01/04/25.
//

#import "ViewController.h"
#import "Singletone.h"

#define APIURL @"https://jsonplaceholder.typicode.com/todos"

@interface ViewController ()
   
@end

@implementation ViewController

NSMutableArray * todos;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    todos = [[NSMutableArray alloc] init];
    
    [self callAPI:APIURL];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.text = [self returnTitle:todos[indexPath.row][@"title"]];
    cell.textLabel.numberOfLines = 0;
    
    return  cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section { 
    return [todos count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return  UITableViewAutomaticDimension;
}

-(NSString* )returnTitle :(NSString *)title {
    
    NSString *firstChar = [[title substringToIndex:1] uppercaseString];
    NSString *remainingString = [title substringFromIndex:1];
    return [firstChar stringByAppendingString:remainingString];
    
}

-(void)callAPI:(NSString* )url {
    
    NSURL *finalUrl = [NSURL URLWithString:url];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:finalUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        
        if (error) {
            NSLog(@" eror %@",[error localizedDescription]);
            return ;
        }
        
        NSError *recivedError;
        todos = [NSJSONSerialization JSONObjectWithData:data options: 0 error:&recivedError];
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"✅ Todo ");
            [self.todoTBL reloadData];
        });
        
    }];
    [task resume];
}

@end
