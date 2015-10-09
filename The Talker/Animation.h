//
//  Animation.h
//  Area Calculator
//
//  Created by Suman Roy on 07/10/15.
//  Copyright (c) 2015 Suman Roy. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Defines the functions used to move textfields when editing
 */

@interface Animation : NSObject

/**
 *  Moves the view up so that the textField is not hidden by the keyboard
 *
 *  @param textField The UITextField element that is being edited
 *  @param view      The UIViewCintroller on which the UITextField element has been placed
 */

+ (void)textFieldDidBeginEditing:(UITextField *)textField inView:(UIViewController *)view;

/**
 *  Moves the view down after the textField editing has ended
 *
 *  @param textField The UITextField element that is being edited
 *  @param view      The UIViewCintroller on which the UITextField element has been placed
 */

+ (void)textFieldDidEndEditing:(UITextField *)textfield inView:(UIViewController *)view;

@end
