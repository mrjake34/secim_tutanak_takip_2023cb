abstract class ReportStatus {
  const ReportStatus();
}

class StatusInitialize extends ReportStatus {
  const StatusInitialize();
}

class ReportLoading extends ReportStatus {}

class ReportError extends ReportStatus {
  final Object exception;

  ReportError(this.exception);
}

class ReportSuccess extends ReportStatus {}

class CitiesEmpty extends ReportStatus {}
