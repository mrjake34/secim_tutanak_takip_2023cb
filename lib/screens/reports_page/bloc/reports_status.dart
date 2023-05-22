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

abstract class ServiceStatus {
  const ServiceStatus();
}

class NetworkReady extends ServiceStatus {}

class NetworkNotReady extends ServiceStatus {}

class NetworkLoading extends ServiceStatus {}

class NetworkError extends ServiceStatus {
  final Object exception;

  NetworkError(this.exception);
}

class NetworkFailed extends ServiceStatus {}
