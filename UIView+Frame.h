//
//  UIView+MHFrame.h
//  MHDevLibExample
//
//  Created by apple on 16/5/12.



#import <UIKit/UIKit.h>

@interface UIView (Frame)


/// < Shortcut for frame.origin.x.
@property (nonatomic, readwrite, assign) CGFloat left;
/// < Shortcut for frame.origin.y
@property (nonatomic, readwrite, assign) CGFloat top;
/// < Shortcut for frame.origin.x + frame.size.width
@property (nonatomic, readwrite, assign) CGFloat right;
/// < Shortcut for frame.origin.y + frame.size.height
@property (nonatomic, readwrite, assign) CGFloat bottom;

/// < Shortcut for frame.origin.x.
@property (nonatomic, readwrite, assign) CGFloat x;
/// < Shortcut for frame.origin.y
@property (nonatomic, readwrite, assign) CGFloat y;
/// < Shortcut for frame.size.width
@property (nonatomic, readwrite, assign) CGFloat width;
/// < Shortcut for frame.size.height
@property (nonatomic, readwrite, assign) CGFloat height;

/// < Shortcut for center.x
@property (nonatomic, readwrite, assign) CGFloat centerX;
///< Shortcut for center.y
@property (nonatomic, readwrite, assign) CGFloat centerY;

/// < Shortcut for frame.size.
@property (nonatomic, readwrite, assign) CGSize size;
/// < Shortcut for frame.origin.
@property (nonatomic, readwrite, assign) CGPoint origin;






@end
