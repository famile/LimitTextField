//
//  ViewController.m
//  TextFieldProgram
//
//  Created by 李涛 on 2018/4/11.
//  Copyright © 2018年 Tao_Lee. All rights reserved.
//

#import "ViewController.h"

static NSInteger maxCount = 10;

@interface ViewController ()<UITextFieldDelegate,UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _textField.delegate = self;
    _textField.placeholder = [NSString stringWithFormat:@"限%@字",@(maxCount)];
    
    _textView.delegate = self;
}
#pragma mark - UITextViewDelegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)string{
    //高亮range
    UITextRange *selectedRange = textView.markedTextRange;
    //textField的确认部分的location（去掉高亮部分的位置）
    NSInteger location = [textView offsetFromPosition:textView.beginningOfDocument toPosition:selectedRange.start];
    NSString *str = nil;
    if (selectedRange) {
        str = [textView.text substringWithRange:(NSMakeRange(0, location))];
    }else{
        str = textView.text;
    }
    
    
    if (string.length + str.length > maxCount) {
        NSString *newStr = [str stringByAppendingString:string];
        textView.text = [newStr substringWithRange:NSMakeRange(0, maxCount)];
        return NO;
    }
    if ([string isEqualToString:@"\n"]) {
        //按回车关闭键盘
        [textView resignFirstResponder];
        return NO;
    }else if(string.length == 0){
        //判断是不是删除键
        return YES;
    }else{
        return YES;
    }
    
    return YES;
}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    
    //高亮range
    UITextRange *selectedRange = textField.markedTextRange;
    //textField的确认部分的location（去掉高亮部分的位置）
    NSInteger location = [textField offsetFromPosition:textField.beginningOfDocument toPosition:selectedRange.start];
    NSString *str = nil;
    if (selectedRange) {
        str = [textField.text substringWithRange:(NSMakeRange(0, location))];
    }else{
        str = textField.text;
    }
    
    
    if (string.length + str.length > maxCount) {
        NSString *newStr = [str stringByAppendingString:string];
        textField.text = [newStr substringWithRange:NSMakeRange(0, maxCount)];
        return NO;
    }
    if ([string isEqualToString:@"\n"]) {
        //按回车关闭键盘
        [textField resignFirstResponder];
        return NO;
    }else if(string.length == 0){
        //判断是不是删除键
        return YES;
    }else{
        return YES;
    }
    
    return YES;
}

#pragma mark - httpRequest

#pragma mark - click

#pragma mark - private method

#pragma mark - setter

#pragma mark - init


@end
