const String pngPath = 'assets/pngs';

final accountPng = 'account'.png;
final avatarPng = 'avatar'.png;
final boatPng = 'boat'.png;
final boxBigPng = 'box_big'.png;
final boxMediumPng = 'box_medium'.png;
final boxSmallPng = 'box_small'.png;
final calculatePng = 'calculate'.png;
final historyBoxPng = 'history_box'.png;
final historyPng = 'history'.png;
final homePng = 'home'.png;
final lorryPng = 'lorry'.png;
final moveIconPng = 'move_icon'.png;
final moveLogoPng = 'move_logo'.png;
final notificationPng = 'notification'.png;
final receiverLocationPng = 'receiver_location'.png;
final receivePng = 'recieve'.png;
final sendPng = 'send'.png;
final senderLocationPng = 'sender_location'.png;
final trolleyPng = 'trolley'.png;
final weightPng = 'weight'.png;
final searchPng = 'search'.png;

extension ImageType on String {
  String get png => '$pngPath/$this.png';
}
