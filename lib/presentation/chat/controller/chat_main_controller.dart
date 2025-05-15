import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:trademate_app/data/entity/chat/chat_entity.dart';
import 'package:trademate_app/data/repo/chat_repo.dart';
import 'package:trademate_app/data/sock.dart';
import 'package:trademate_app/utils/hive/models/session/session_model.dart';
import 'package:trademate_app/utils/hive/stores/session_store.dart';

class ChatMainController extends GetxController {
  Logger log = Logger();
  IO.Socket socket = Sock.createChannel();
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

  Future<void> _fetchChatLists() async {
    try {
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
}
