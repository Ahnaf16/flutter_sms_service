class SMSData {
  SMSData({
    required this.phoneNumber,
    required this.message,
    required this.simSlot,
  });

  final String message;
  final String phoneNumber;
  final int simSlot;

  Map<String, dynamic> toMap() => {
        'phoneNumber': phoneNumber,
        'message': message,
        'simSlot': simSlot,
      };
}
