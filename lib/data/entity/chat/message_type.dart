// ignore_for_file: constant_identifier_names

enum MessageType {
  chat,
  audio,
  ptt,
  image,
  video,
  document,
  sticker,
  location,
  vcard,
  multi_vcard,
  revoked,
  order,
  product,
  payment,
  unknown,
  groups_v4_invite,
  list,
  list_response,
  buttons_response,
  broadcast_notification,
  call_log,
  ciphertext,
  debug,
  e2e_notification,
  gp2,
  group_notification,
  hsm,
  interactive,
  native_flow,
  notification,
  notification_template,
  oversized,
  protocol,
  reaction,
  template_button_reply,
  poll_creation,
}

MessageType messageTypeFromString(String type) {
  switch (type) {
    case "chat":
      return MessageType.chat;
    case "audio":
      return MessageType.audio;
    case "ptt":
      return MessageType.ptt;
    case "image":
      return MessageType.image;
    case "video":
      return MessageType.video;
    case "document":
      return MessageType.document;
    case "sticker":
      return MessageType.sticker;
    case "location":
      return MessageType.location;
    case "vcard":
      return MessageType.vcard;
    case "multi_vcard":
      return MessageType.multi_vcard;
    case "revoked":
      return MessageType.revoked;
    case "order":
      return MessageType.order;
    case "product":
      return MessageType.product;
    case "payment":
      return MessageType.payment;
    case "unknown":
      return MessageType.unknown;
    case "groups_v4_invite":
      return MessageType.groups_v4_invite;
    case "list":
      return MessageType.list;
    case "list_response":
      return MessageType.list_response;
    case "buttons_response":
      return MessageType.buttons_response;
    case "broadcast_notification":
      return MessageType.broadcast_notification;
    case "call_log":
      return MessageType.call_log;
    case "ciphertext":
      return MessageType.ciphertext;
    case "debug":
      return MessageType.debug;
    case "e2e_notification":
      return MessageType.e2e_notification;
    case "gp2":
      return MessageType.gp2;
    case "group_notification":
      return MessageType.group_notification;
    case "hsm":
      return MessageType.hsm;
    case "interactive":
      return MessageType.interactive;
    case "native_flow":
      return MessageType.native_flow;
    case "notification":
      return MessageType.notification;
    case "notification_template":
      return MessageType.notification_template;
    case "oversized":
      return MessageType.oversized;
    case "protocol":
      return MessageType.protocol;
    case "reaction":
      return MessageType.reaction;
    case "template_button_reply":
      return MessageType.template_button_reply;
    case "poll_creation":
      return MessageType.poll_creation;
    default:
      return MessageType.unknown;
  }
}
