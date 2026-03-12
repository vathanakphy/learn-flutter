enum AsyncValueState { loading, error, success }

class AsyncValue<T> {
  final T? data;
  final Object? error;
  final AsyncValueState state;

  const AsyncValue({this.data, this.error, required this.state});
  factory AsyncValue.loading() {
    return const AsyncValue(state: AsyncValueState.loading);
  }
  factory AsyncValue.error(Object error) {
    return AsyncValue(error: error, state: AsyncValueState.error);
  }
  factory AsyncValue.success(T data) {
    return AsyncValue(data: data, state: AsyncValueState.success);
  }
}
