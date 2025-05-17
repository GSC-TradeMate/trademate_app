import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:trademate_app/data/entity/chat/message_entity.dart';
import 'package:trademate_app/data/repo/chat_repo.dart';
import 'package:trademate_app/data/sock.dart';
import 'package:trademate_app/presentation/chat/param/chat_message_param.dart';
import 'package:trademate_app/utils/hive/models/session/session_model.dart';
import 'package:trademate_app/utils/hive/stores/session_store.dart';

class ChatMessageController extends GetxController {
  Logger log = Logger();
  IO.Socket socket = Sock.createChannel();
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  late ChatMessageParam param;

  final Rx<List<MessageEntity>> _messages = Rx<List<MessageEntity>>([]);
  final Rx<bool> _isMessageLoad = true.obs;
  final Rx<bool> _isMessageFetchError = false.obs;

  List<MessageEntity> get messages => _messages.value;
  bool get isMessageLoad => _isMessageLoad.value;
  bool get isMessageFetchError => _isMessageFetchError.value;

  void init(ChatMessageParam param) {
    this.param = param;
    _fetchMessages(sync: false);
    _connect();
  }

  void disp() {
    socket.close();
    socket.dispose();
  }

  Future<void> _fetchMessages({required bool sync}) async {
    try {
      _isMessageLoad.value = true;
      _messages.value = await ChatRepo.messageDetail(param.id, sync: sync);
      _messages.value = _messages.value.reversed.toList();
      _messages.refresh();
    } catch (e) {
      _isMessageFetchError.value = true;
      log.f("Error fetching message lists: $e");
    } finally {
      _isMessageLoad.value = false;
    }
  }

  Future<void> onLoadMore() async {
    refreshController.requestLoading();
    try {
      await _fetchMessages(sync: true);
    } catch (e) {
      refreshController.loadFailed();
      log.f("Error loading more messages: $e");
    } finally {
      refreshController.loadComplete();
    }
  }

  Future<void> _connect() async {
    try {
      SessionModel? s = await SessionStore.get();
      socket.connect();
      socket.on("message:${s?.code}", (data) async => _onMessageReceived(data));
    } catch (e) {
      log.f("Error connecting to Socket: $e");
    }
  }

  Future<void> _onMessageReceived(dynamic data) async {
    try {
      if (data == null) return;
      if (data["message"] == null) return;
      MessageEntity m = MessageEntity.fromJson(data["message"]);
      if (m.interlocutor == m.interlocutor) {
        _messages.value.add(m);
        _fetchMessages(sync: false);
      }
    } catch (e) {
      log.e("Error when receiving message: $e");
    }
  }
}
