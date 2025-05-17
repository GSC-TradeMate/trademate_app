import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:trademate_app/data/entity/chat/chat_entity.dart';
import 'package:trademate_app/data/repo/chat_repo.dart';
import 'package:trademate_app/data/sock.dart';
import 'package:trademate_app/presentation/chat/param/chat_message_param.dart';
import 'package:trademate_app/utils/hive/models/session/session_model.dart';
import 'package:trademate_app/utils/hive/stores/session_store.dart';
import 'package:trademate_app/utils/routes/app_routes.dart';

class ChatMainController extends GetxController {
  Logger log = Logger();
  IO.Socket socket = Sock.createChannel();
  RefreshController refreshController = RefreshController(initialRefresh: true);

  final Rx<bool> _isChatFetched = false.obs;
  final Rx<bool> _isChatFetchedError = false.obs;

  final Rx<List<ChatEntity>> _chatLists = Rx<List<ChatEntity>>([]);

  List<ChatEntity> get chatLists => _chatLists.value;
  bool get isChatFetched => _isChatFetched.value;
  bool get isChatFetchedError => _isChatFetchedError.value;

  void init() {
    _fetchChatLists();
    _connect();
  }

  void disp() {
    socket.close();
    socket.dispose();
  }

  Future<void> onRefresh() async {
    refreshController.requestRefresh();
    try {
      await _fetchChatLists();
    } catch (e) {
      refreshController.refreshFailed();
      log.f("Error refreshing chat lists: $e");
    } finally {
      refreshController.refreshCompleted();
    }
  }

  Future<void> _fetchChatLists() async {
    try {
      _isChatFetchedError.value = false;
      _chatLists.value = await ChatRepo.getUserChats();
      _chatLists.refresh();
    } catch (e) {
      _isChatFetchedError.value = true;
      log.f("Error fetching chat lists: $e");
    } finally {
      _isChatFetched.value = true;
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
    _fetchChatLists();
  }

  void handleMoveToMessage({
    required String name,
    required String id,
  }) {
    Get.toNamed(AppRoute.chatMessage,
        arguments: ChatMessageParam(name: name, id: id));
  }
}
