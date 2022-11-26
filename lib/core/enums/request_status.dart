enum RequestStatus {
  pending,
  accepted,
  canceled,
  rejected;

  String get value {
    switch (this) {
      case RequestStatus.pending:
        return 'pending';
      case RequestStatus.accepted:
        return 'accepted';
      case RequestStatus.canceled:
        return 'canceled';
      case RequestStatus.rejected:
        return 'rejected';
    }
  }


  String get name {
    switch(this) {
      case RequestStatus.pending:
        return 'Đang chờ';
      case RequestStatus.accepted:
        return 'Đã được chấp nhận';
      case RequestStatus.canceled:
        return 'Đã huỷ';
      case RequestStatus.rejected:
        return 'Không được chấp nhận';
    }

  }
}
