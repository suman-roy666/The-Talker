//
//  Animation.h
//  Area Calculator
//
//  Created by Suman Roy on 07/10/15.
//  Copyright (c) 2015 Suman Roy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Animation : NSObject

+ (void)textFieldDidBeginEditing:(UITextField *)textField inView:(UIViewController *)view;

+ (void)textFieldDidEndEditing:(UITextField *)textfield inView:(UIViewController *)view;

@end
