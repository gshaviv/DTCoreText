//
//  NSAttributedString+HTMLWithHyphenate.h
//  DTCoreText
//
//  Created by Guy Shaviv on 27/1/12.
//  Copyright (c) 2012 Drobnik.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (HTMLWithHyphenate)
- (id)initWithHTMLToHyphenate:(NSString *)html options:(NSDictionary *)options;
@end
