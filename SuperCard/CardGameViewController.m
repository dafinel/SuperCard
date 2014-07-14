//
//  CardGameViewController.m
//  SuperCard
//
//  Created by Andrei-Daniel Anton on 14/07/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardGame.h"
#import "PlayingCardDeck.h"
#import "PlayingCards.h"

@interface CardGameViewController ()

@property (nonatomic, weak  ) IBOutlet PlayingCardGame *playingCardView;
@property (nonatomic, strong) Deck *deck;

@end

@implementation CardGameViewController

#pragma mark - Proprieties

- (Deck *)deck{
    if (!_deck) {
        _deck = [[PlayingCardDeck alloc] init];
    }
    return _deck;
}

- (void)drawRandomPlayingCard
{
    Card *card = [self.deck drowRandomCard];
    if ([card isKindOfClass:[PlayingCards class]]) {
        PlayingCards *playingCard = (PlayingCards *)card;
        self.playingCardView.rank = playingCard.rank;
        self.playingCardView.suit = playingCard.suit;
    }
}

#pragma mark - IBActions

- (IBAction)swipe:(UISwipeGestureRecognizer *)sender {
    if (!self.playingCardView.faceUp) {
        [self drawRandomPlayingCard];
    }
    self.playingCardView.faceUp = !self.playingCardView.faceUp;
}

#pragma mark - Load

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.playingCardView addGestureRecognizer:[[UIPinchGestureRecognizer alloc] initWithTarget:self.playingCardView action:@selector(pinch:)]];
}

@end
