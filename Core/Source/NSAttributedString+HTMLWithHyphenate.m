//
//  NSAttributedString+HTMLWithHyphenate.m
//  DTCoreText
//
//  Created by Guy Shaviv on 27/1/12.
//  Copyright (c) 2012 Drobnik.com. All rights reserved.
//

#import "NSAttributedString+HTMLWithHyphenate.h"
#import "DTHTMLAttributedStringBuilder.h"
#import "NSString+Hyphenate.h"
#import "DTHTMLElement.h"
#import "DTCoreTextParagraphStyle.h"

NSString *DTParagraphSpacing = @"DTParagraphSpacing";

@implementation NSAttributedString (HTMLWithHyphenate)

- (id)initWithHTML:(NSString *)html options:(NSDictionary *)options hyphenate:(BOOL)hyphenate
{
	// only with valid data
	if (![html length])
	{
		return nil;
	}
	NSData *data = [html dataUsingEncoding:NSUTF8StringEncoding];	
	DTHTMLAttributedStringBuilder	*stringBuilder = [[DTHTMLAttributedStringBuilder alloc] initWithHTML:data options:options documentAttributes:nil];
	
	
	int spacing = -1;
	NSNumber *optionSpacing = [options objectForKey:DTParagraphSpacing];
	if (optionSpacing) {
		spacing = [optionSpacing intValue];
	}
	
	stringBuilder.willFlushCallback = ^(DTHTMLElement *currentTag){
		if (hyphenate && currentTag.paragraphStyle.textAlignment == kCTJustifiedTextAlignment) {
			currentTag.text = [currentTag.text stringByHyphenatingWithLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
		}
		if (spacing >= 0) {
			currentTag.paragraphStyle.paragraphSpacing = spacing;
		}
	};
	
	[stringBuilder buildString];
	
	return [stringBuilder generatedAttributedString];
}

@end
