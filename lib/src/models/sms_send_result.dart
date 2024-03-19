class SMSSendResult {
  SMSSendResult({
    required this.massage,
    required this.resultCode,
    required this.isError,
    required this.slot,
  });

  factory SMSSendResult.fromMap(Map<Object?, dynamic> map) {
    return SMSSendResult(
      massage: map['massage'] as String,
      resultCode: map['code'] as int,
      isError: map['error'] as bool,
      slot: map['slot'] as int,
    );
  }

  final int resultCode;
  final int slot;
  final String massage;
  final bool isError;

  Map<String, dynamic> toMap() => {
        'massage': massage,
        'code': resultCode,
        'error': isError,
        'slot': slot,
      };

  static SMSSendResult defError(int slot) => SMSSendResult(
        massage: 'Failed to send message. Please try again.',
        resultCode: 404,
        isError: true,
        slot: slot,
      );
}
