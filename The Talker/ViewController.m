//
//  ViewController.m
//  The Talker
//
//  Created by Suman Roy on 08/10/15.
//  Copyright (c) 2015 Edge Tech. All rights reserved.
//

#import "ViewController.h"
#import "Animation.h"
#import "TalkerTableViewCell.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *messageTextField;
@property (weak, nonatomic) IBOutlet UIButton *messageSendButton;
@property (weak, nonatomic) IBOutlet UITableView *messageTableView;

@end

@implementation ViewController{
    
    NSMutableArray *messages;
}

static NSString *tableCellIdentifier = @"TalkerTableCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [ _messageTextField setClearsOnBeginEditing:TRUE];
    
    messages = [ NSMutableArray arrayWithObjects:@"This is a table view",@"This is placeholder text", nil];
    
    
    [ _messageTableView registerClass:[TalkerTableViewCell class] forCellReuseIdentifier:tableCellIdentifier ];
    
    [ _messageTableView registerNib:[UINib nibWithNibName:NSStringFromClass([TalkerTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"TalkerTableViewCell"];
    
    _messageTableView.estimatedRowHeight = 44.0;
    _messageTableView.rowHeight = UITableViewAutomaticDimension;
    _messageTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table Functions

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [ messages count ];
    
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    TalkerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableCellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [ messages objectAtIndex: indexPath.row  ];
    
    cell.textLabel.numberOfLines = 0;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

#pragma mark - Action Delegate Functions

- (IBAction)messageFieldEditDidBegin:(id)sender {
    
    [ Animation textFieldDidBeginEditing: self.messageTextField inView:self];
}


- (IBAction)messageFieldEditDidEnd:(id)sender {
    
    
    
    [ Animation textFieldDidEndEditing: self.messageTextField inView:self];

}

-(void)dismissKeyboard {
    [ _messageTextField resignFirstResponder];
}

- (IBAction)sendButtonTapped:(id)sender {
    
    [self dismissKeyboard];
    
    NSString *messageText = _messageTextField.text;

    
    if ( messageText!= Nil ) {
        
        [ messages addObject:_messageTextField.text];
        
        [_messageTextField setText:Nil];
        
        [ _messageTableView reloadData];
        
//        for (NSString *tempString in messages) {
//            
//            //printf("%s\n", [ tempString cString] );
//        }
    }
}


@end
