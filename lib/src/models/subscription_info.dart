class SubscriptionInfo {
  SubscriptionInfo({
    required this.index,
    required this.displayName,
    required this.carrierName,
    required this.carrierId,
    required this.subscriptionId,
    required this.simSlotIndex,
    required this.countryIso,
    this.mobileCountryCode,
    this.mobileNetworkCode,
    this.cardId,
    this.isEmbedded,
    this.portIndex,
    this.subscriptionType,
    this.number,
  });

  factory SubscriptionInfo.fromMap(Map<dynamic, dynamic> map) {
    return SubscriptionInfo(
      cardId: map['cardId'],
      carrierId: map['carrierId'],
      carrierName: map['carrierName'],
      countryIso: map['countryIso'],
      displayName: map['displayName'],
      isEmbedded: map['isEmbedded'],
      mobileCountryCode: map['mobileCountryCode'],
      mobileNetworkCode: map['mobileNetworkCode'],
      number: map['number'],
      portIndex: map['portIndex'],
      simSlotIndex: map['simSlotIndex'],
      index: map['slot'],
      subscriptionId: map['subscriptionId'],
      subscriptionType: map['subscriptionType'],
    );
  }

  /// The card ID of the SIM card which contains the subscription.
  ///
  /// requires API level 29 or higher (Android Q)
  final int? cardId;

  /// The carrier id of this subscription carrier.
  ///
  /// requires API level 29 or higher (Android Q)
  final int carrierId;

  /// The name displayed to the user that identifies subscription
  /// provider name. This name is the SPN displayed in status bar and many
  /// other places. Can't be renamed by the user.
  final String carrierName;

  /// The ISO country code. Empty if not available.
  final String countryIso;

  /// The name displayed to the user that identifies this subscription.
  ///  This name is used in Settings page and can be renamed by the user.
  final String displayName;

  /// index of this subscription from the list of all subscriptions
  final int index;

  /// true if the subscription is from eSIM
  ///
  /// requires API level 29 or higher (Android Q)
  final bool? isEmbedded;

  /// The mobile country code.
  ///
  /// requires API level 28 or higher (Android P)
  final String? mobileCountryCode;

  /// The mobile network code.
  ///
  /// requires API level 33 or higher (Android TIRAMISU)
  final String? mobileNetworkCode;

  /// The number of this subscription.
  ///
  /// Starting with API level 30, returns the number of this subscription if
  /// the calling app meets one of the following requirements:
  ///
  /// - If the calling app's target SDK is API level 29 or lower and the
  /// app has been granted the READ_PHONE_STATE permission.
  /// - If the calling app has been granted any of READ_PRIVILEGED_PHONE_STATE,
  /// READ_PHONE_NUMBERS, or READ_SMS permissions.
  final String? number;

  /// The port index of the SIM card which contains the subscription
  ///
  /// requires API level 29 or higher (Android Q)
  final int? portIndex;

  /// The index of the SIM slot that currently contains the subscription
  /// and not necessarily unique and maybe '-1' if unknown or the
  /// subscription is inactive.
  final int simSlotIndex;

  /// The subscription id.
  final int subscriptionId;

  /// This method returns the type of a subscription
  ///
  /// requires API level 29 or higher (Android Q)
  final int? subscriptionType;

  @override
  String toString() {
    return 'SubscriptionInfo \n'
        'cardId: $cardId, \n'
        'carrierId: $carrierId, \n'
        'carrierName: $carrierName, \n'
        'countryIso: $countryIso, \n'
        'displayName: $displayName, \n'
        'isEmbedded: $isEmbedded, \n'
        'mobileCountryCode: $mobileCountryCode, \n'
        'mobileNetworkCode: $mobileNetworkCode, \n'
        'number: $number, \n'
        'portIndex: $portIndex, \n'
        'simSlotIndex: $simSlotIndex, \n'
        'index: $index, \n'
        'subscriptionId: $subscriptionId, \n'
        'subscriptionType: $subscriptionType';
  }

  Map<String, dynamic> toMap() {
    return {
      'cardId': cardId,
      'carrierId': carrierId,
      'carrierName': carrierName,
      'countryIso': countryIso,
      'displayName': displayName,
      'isEmbedded': isEmbedded,
      'mobileCountryCode': mobileCountryCode,
      'mobileNetworkCode': mobileNetworkCode,
      'number': number,
      'portIndex': portIndex,
      'simSlotIndex': simSlotIndex,
      'slot': index,
      'subscriptionId': subscriptionId,
      'subscriptionType': subscriptionType,
    };
  }
}
