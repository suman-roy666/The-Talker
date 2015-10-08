//
//  ViewController.m
//  The Talker
//
//  Created by Suman Roy on 08/10/15.
//  Copyright (c) 2015 Edge Tech. All rights reserved.
//

#import "ViewController.h"
#import "Animation.h"
#include <stdio.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *messageTextField;
@property (weak, nonatomic) IBOutlet UIButton *messageSendButton;

@end

@implementation ViewController{
    
    NSMutableArray *messages;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [ _messageTextField setClearsOnBeginEditing:TRUE];
    
    messages = [ NSMutableArray arrayWithObjects:@"This is a table view",@"This is placeholder text", nil];
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
    
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [messages objectAtIndex:indexPath.row];
    return cell;
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
        
        for (NSString *tempString in messages) {
            
            printf("%s\n", [ tempString cString] );
        }
    }
}


@end
