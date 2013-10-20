//
//  SCMasterViewController.m
//  SoundStreamer
//
//  Created by Sam Davies on 20/10/2013.
//  Copyright (c) 2013 shinobicontrols. All rights reserved.
//

#import "SCMasterViewController.h"
@import MultipeerConnectivity;

@interface SCMasterViewController () <MCBrowserViewControllerDelegate, MCSessionDelegate> {
    MCPeerID *_peerID;
    MCSession *_session;
}

@end

@implementation SCMasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (IBAction)handleFindPeersButton:(id)sender {
    [self.peerNameTextField resignFirstResponder];
    if([self.peerNameTextField.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Peer name" message:@"You must specify a peer name to browse." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    } else {
        _peerID = [[MCPeerID alloc] initWithDisplayName:self.peerNameTextField.text];
        _session = [[MCSession alloc] initWithPeer:_peerID];
        _session.delegate = self;
        MCBrowserViewController *browserVC = [[MCBrowserViewController alloc] initWithServiceType:@"shinobi-stream" session:_session];
        browserVC.delegate = self;
        [self presentViewController:browserVC animated:YES completion:NULL];
    }
}

- (IBAction)handleStartStreamingPressed:(id)sender {
    NSLog(@"%@", [_session connectedPeers]);
}

#pragma mark - MCBrowserViewControllerDelegate methods
- (void)browserViewControllerWasCancelled:(MCBrowserViewController *)browserViewController
{
    [browserViewController dismissViewControllerAnimated:YES completion:NULL];
}

- (void)browserViewControllerDidFinish:(MCBrowserViewController *)browserViewController
{
    [browserViewController dismissViewControllerAnimated:YES completion:^{
        self.startStreamingButton.enabled = YES;
    }];
}

#pragma mark - MCSessionDelegate methods
// Remote peer changed state
- (void)session:(MCSession *)session peer:(MCPeerID *)peerID didChangeState:(MCSessionState)state
{
    
}

// Received data from remote peer
- (void)session:(MCSession *)session didReceiveData:(NSData *)data fromPeer:(MCPeerID *)peerID
{
    
}

// Received a byte stream from remote peer
- (void)session:(MCSession *)session didReceiveStream:(NSInputStream *)stream withName:(NSString *)streamName fromPeer:(MCPeerID *)peerID
{
    
}

// Start receiving a resource from remote peer
- (void)session:(MCSession *)session didStartReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID withProgress:(NSProgress *)progress
{
    
}

// Finished receiving a resource from remote peer and saved the content in a temporary location - the app is responsible for moving the file to a permanent location within its sandbox
- (void)session:(MCSession *)session didFinishReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID atURL:(NSURL *)localURL withError:(NSError *)error
{
    
}
@end
