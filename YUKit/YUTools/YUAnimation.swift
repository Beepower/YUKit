//
//  YUAnination.swift
//  PowerCC
//
//  Created by chenliangyu on 16/5/11.
//  Copyright © 2016年 Whale. All rights reserved.
//

import Foundation


class YUAnimation: NSObject {
    
    func animaFromTo() -> Void {
//        let myView = self.recentVC.view
//        let animation: CABasicAnimation = CABasicAnimation(keyPath: "position")
//        // 动画选项的设定
//        animation.duration = 2.5 // 持续时间
//        animation.repeatCount = 1 // 重复次数
//        // 起始帧和终了帧的设定
//        animation.fromValue = NSValue(CGPoint: myView.layer.position)//起始帧
//        let Number_Zero:CGFloat = 0
//        animation.toValue = NSValue(CGPoint: CGPointMake(Number_Zero, Number_Zero))//终了帧
//        //添加动画
//        myView.layer.addAnimation(animation, forKey: "move-layer")
        
        
//        let anima: CABasicAnimation = CABasicAnimation()
//        anima.keyPath = "pingyi"
//        anima.toValue = NSValue(CGPoint: CGPointMake(0, -100))
//        anima.duration = 0.5
//        //设置动画执行完毕之后不删除动画
//        anima.removedOnCompletion = false
//        //设置保存动画的最新状态
//        anima.fillMode = kCAFillModeForwards;
//        //    anima.fillMode=kCAFillModeBackwards;
//        anima.delegate = self
//        self.view.layer.addAnimation(anima, forKey: nil)

    }
    
//    iOS 动画Animation详解, UIView动画(UIView属性动画,UIViewTransition动画,UIView Block动画),CALayer动画(CABasicAnima, CAKeyframeAnimation, CATransition, CAAnimationGroup)
//    //
//    //  FirstVC.m
//    //  LessonAnimation
//    //
//    //  Created by lanouhn on 14-9-17.
//    //  Copyright (c) 2014年 vaercly@163.com 陈聪雷. All rights reserved.
//    //
//    
//    #import "FirstVC.h"
//    
//    @interface FirstVC ()
//    
//    @end
//    
//    @implementation FirstVC
//    /*
//     创建xib过程
//     1 创建xib(名字和类名相同)
//     2 文件拥有者为类名
//     3 和类的view连线
//     */
//    - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//    {
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//    // Custom initialization
//    }
//    return self;
//    }
//    
//    - (void)viewDidLoad
//    {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view from its nib.
//    }
//    
//    - (void)didReceiveMemoryWarning
//    {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//    }
//    
//    //UIView属性动画
//    - (IBAction)pressPropertyAnimation:(id)sender {
//    //1 准备动画
//    //参数1: 动画的作用, 用来区分多个动画, 参数二: 传递参数用 nil:OC中使用 NULL:C语言使用
//    [UIView beginAnimations:@"改变大小" context:NULL];
//    //在准备动画的时候可以设置动画的属性
//    [UIView setAnimationDuration:2];//设置动画的持续时间
//    [UIView setAnimationDelegate:self];
//    [UIView setAnimationWillStartSelector:@selector(startAnimation)];
//    //    [UIView setAnimationDelay:1];//动画延迟执行时间
//    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];//动画的曲线
//    [UIView setAnimationRepeatCount:20];//动画的重复次数
//    [UIView setAnimationRepeatAutoreverses:YES];//动画往返执行, 必须设置动画的重复次数
//    //2 修改view的属性, 可以同时修改多个属性 注意:不是所有的属性都可以修改的(只有frame, center, bounds, backgroundColor, alpha, transform 可以修改)
//    self.changeView.frame = CGRectMake(110, 100, 100, 100);
//    //    self.changeView.backgroundColor = [UIColor brownColor];
//    self.changeView.backgroundColor = [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() % 256 / 255.0 alpha:0.5];
//    //3 提交并执行动画
//    [UIView commitAnimations];
//    }
//    //UIView过度动画
//    - (IBAction)pressTranstionAnimation:(id)sender {
//    //1 准备动画
//    [UIView beginAnimations:@"过度动画" context:NULL];
//    [UIView setAnimationDuration:5];
//    [UIView setAnimationRepeatCount:50];
//    //2 设置过度样式
//    //参数1: 过度样式, 参数2: 指定那个View做动画, 参数3: 是否设置缓存
//    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.changeView cache:YES];
//    self.changeView.backgroundColor = [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() % 256 / 255.0 alpha:0.5];
//    //3 提交并执行动画
//    [UIView commitAnimations];
//    }
//    
//    //Block动画
//    - (IBAction)pressBlockAnimation:(id)sender {
//    //只有一行代码 Block动画实质是对UIView动画的封装
//    //参数1:动画时长 参数2:Block: 设置要修改的View属性
//    /*
//     [UIView animateWithDuration:2 animations:^{
//     self.changeView.backgroundColor = [UIColor orangeColor];
//     }];
//     */
//    //第二种Block
//    /*
//     //参数1:动画时长 参数2:Block: 设置要修改的View属性 参数3: 动画完成时调用
//     [UIView animateWithDuration:2 animations:^{
//     self.changeView.backgroundColor = [UIColor orangeColor];
//     } completion:^(BOOL finished) {
//     //finished判断动画是否完成
//     if (finished) {
//     NSLog(@"finished");
//     }
//     }];
//     */
//    //第三种Block
//    /*
//     [UIView animateWithDuration:2 delay:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//     //        设置要修改的View属性
//     self.changeView.backgroundColor = [UIColor orangeColor];
//     } completion:^(BOOL finished) {
//     //finished判断动画是否完成
//     if (finished) {
//     NSLog(@"finished");
//     }
//     }];
//     */
//    //对过度动画的封装
//    //参数1: 改变的View 参数2:动画时长 参数3:动画类型 参数4 Block: 设置要修改的View属性 参数5:完成后的操作
//    [UIView transitionWithView:self.changeView duration:2 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
//    self.changeView.backgroundColor = [UIColor orangeColor];
//    } completion:^(BOOL finished) {
//    //finished判断动画是否完成
//    if (finished) {
//    NSLog(@"finished");
//    }
//    }];
//    }
//    
//    #pragma mark - AnimationDelegate
//    //动画将要开始时调用
//    - (void)animationWillStart:(NSString *)animationID context:(void *)context
//    {
//    NSLog(@"start: %@, %@", animationID, context);
//    }
//    
//    //动画结束时调用
//    - (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
//    {
//    NSLog(@"stop: %@, %@", animationID, context);
//    }
//    
//    - (void)startAnimation
//    {
//    NSLog(@"self");
//    }
//    - (void)dealloc {
//    [_changeView release];
//    [super dealloc];
//    }
//    @end
//    //
//    //  SecondVC.m
//    //  LessonAnimation
//    //
//    //  Created by lanouhn on 14-9-17.
//    //  Copyright (c) 2014年 vaercly@163.com 陈聪雷. All rights reserved.
//    //
//    
//    #import "SecondVC.h"
//    
//    @interface SecondVC ()
//    
//    @end
//    
//    @implementation SecondVC
//    
//    - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//    {
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//    // Custom initialization
//    }
//    return self;
//    }
//    
//    - (void)viewDidLoad
//    {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view from its nib.
//    NSLog(@"%@", NSStringFromCGRect(self.changeView.frame));
//    NSLog(@"%f", CGRectGetWidth(self.changeView.frame));
//    //UIView和CALayer的关系
//    //UIView负责交互, frame以及显示CALayer
//    //CALayer负责渲染, 并且它是UIView的一个readonly属性
//    /*
//     self.changeView.layer.cornerRadius = 100;//设置圆角, 参数是内切圆的半径, 若想画一个圆, 前提是view必须是正方形, 参数应该是view边长的一半
//     self.changeView.layer.borderWidth = 1;//设置描边的宽度
//     self.changeView.layer.borderColor = [UIColor orangeColor].CGColor;//设置描边的颜色(UIView上的颜色使用的是UIColor, CALayer上使用的颜色是CGColor)
//     self.changeView.layer.shadowOffset = CGSizeMake(50, 100);//设置阴影的偏移量 width影响水平偏移(正右负左), height影响垂直偏移(正下负上)
//     self.changeView.layer.shadowColor = [UIColor grayColor].CGColor;//阴影的偏移的颜色
//     self.changeView.layer.shadowOpacity = 1;//阴影的不透明度, 取值范围(0 ~ 1), 默认是0, 就是透明的
//     */
//    //    CAAnimation抽象类, 使用必须要使用其具体的子类
//    //    CAPropertyAnimation抽象子类, 需要子类化
//    //    CABasicAnimation
//    //    CAKeyframeAnimation
//    }
//    
//    - (void)didReceiveMemoryWarning
//    {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//    }
//    
//    - (void)dealloc {
//    [_changeView release];
//    [super dealloc];
//    }
//    //CABasicAnimation基本动画 没有真正的修改属性值
//    - (IBAction)pressBasicAnimation:(id)sender {
//    //1 创建并指定要修改的属性
//    //    KeyPath:CAlayer的属性名, 不是所有的属性都可以, 只有在头文件中出现animatable的属性才可以, 可以修改属性的属性, 例如:bounds.size
//    //    CALayer
//    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"bounds"];
//    [basic setDuration:2];
//    //2 修改属性值
//    basic.fromValue = [NSValue valueWithCGRect:CGRectMake(0, 0, self.changeView.bounds.size.width, self.changeView.bounds.size.height)];
//    basic.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 300, 300)];
//    //    basic.byValue =
//    //3 添加动画
//    //key做区分动画用
//    [self.changeView.layer addAnimation:basic forKey:@"changColor"];
//    }
//    
//    //CAKeyframeAnimation关键帧动画
//    - (IBAction)pressKeyFrameAnimation:(id)sender {
//    /*
//     //1 创建动画
//     CAKeyframeAnimation *keyFrame = [CAKeyframeAnimation animationWithKeyPath:@"bounds"];
//     [keyFrame setDuration:2];
//     //2 修改属性
//     keyFrame.values = @[[NSValue valueWithCGRect:CGRectMake(0, 0, self.changeView.bounds.size.width, self.changeView.bounds.size.height)], [NSValue valueWithCGRect:CGRectMake(0, 0, 250, 250)], [NSValue valueWithCGRect:CGRectMake(0, 0, 300, 300)]];
//     //    keyTimes:值代表了出现动画的时刻, 值得范围是0~1, 值必须是递增的, keyTimes和values是一一对应的
//     keyFrame.keyTimes = @[@(0.4), @(0.6), @(1)];
//     //3 添加动画
//     [self.changeView.layer addAnimation:keyFrame forKey:@"keyFrame"];
//     */
//    CAKeyframeAnimation *keyFrame = [CAKeyframeAnimation animationWithKeyPath:@"backgroundColor"];
//    [keyFrame setDuration:10];
//    keyFrame.values = @[(id)[UIColor redColor].CGColor, (id)[UIColor orangeColor].CGColor, (id)[UIColor yellowColor].CGColor, (id)[UIColor greenColor].CGColor, (id)[UIColor blueColor].CGColor];
//    //keyTimes中的第一个值是0, 不能修改
//    keyFrame.keyTimes = @[@(0.3), @(0.5), @(0.6), @(0.7), @(0.9)];
//    [self.changeView.layer addAnimation:keyFrame forKey:nil];
//    }
//    
//    //    CATransaction 过度动画
//    - (IBAction)pressTransition:(id)sender {
//    //1 创建
//    CATransition *transition = [CATransition animation];
//    [transition setDuration:2];
//    //2 设置过度样式
//    transition.type = kCATransitionReveal;//控制样式
//    transition.subtype = kCATransitionFromTop;//控制方向
//    //添加动画
//    [self.changeView.layer addAnimation:transition forKey:nil];
//    }
//    
//    //    CAAnimationGroup 组动画
//    - (IBAction)pressAnimationGroup:(id)sender {
//    
//    //1 创建并指定要修改的属性
//    //    KeyPath:CAlayer的属性名, 不是所有的属性都可以, 只有在头文件中出现animatable的属性才可以, 可以修改属性的属性, 例如:bounds.size
//    //    CALayer
//    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"bounds"];
//    [basic setDuration:2];
//    //2 修改属性值
//    basic.fromValue = [NSValue valueWithCGRect:CGRectMake(0, 0, self.changeView.bounds.size.width, self.changeView.bounds.size.height)];
//    basic.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 300, 300)];
//    
//    CAKeyframeAnimation *keyFrame = [CAKeyframeAnimation animationWithKeyPath:@"backgroundColor"];
//    [keyFrame setDuration:5];
//    keyFrame.values = @[(id)[UIColor redColor].CGColor, (id)[UIColor orangeColor].CGColor, (id)[UIColor yellowColor].CGColor, (id)[UIColor greenColor].CGColor, (id)[UIColor blueColor].CGColor];
//    //keyTimes中的第一个值是0, 不能修改
//    keyFrame.keyTimes = @[@(0.3), @(0.5), @(0.6), @(0.7), @(0.9)];
//    
//    
//    
//    // 创建
//    //当group动画的时长 > 组中所有动画的最长时长, 动画的时长以组中最长的时长为准
//    //当group动画的时长 < 组中所有动画的最长时长, 动画的时长以group的时长为准
//    //最合适: group的时长 = 组中所有动画的最长时长
//    CAAnimationGroup *group = [CAAnimationGroup animation];
//    [group setDuration:10];
//    //设置组动画
//    group.animations = @[basic, keyFrame];
//    //添加动画
//    [self.changeView.layer addAnimation:group forKey:nil];
//    }
    
}