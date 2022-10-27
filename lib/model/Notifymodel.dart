class Notifymodel{
  int id;
  String message;
  String time;
  bool status;

  Notifymodel({required this.id,required this.message, required this.time,required this.status});
}

List<Notifymodel> notifycontent= [
  Notifymodel(id:1,message: "Admin sent you a message", time: "3 hour ago",status: false),
  Notifymodel(id:2,message: "Admin sent you a message", time: "4 hour ago",status: false),
  Notifymodel(id:3,message: "Your report was viewed by admin", time: "1 hour ago",status: true),
  Notifymodel(id:4,message: "Admin sent you a message", time: "3 hour ago",status: false),
  Notifymodel(id:5,message: "Your report was viewed by admin", time: "5 hour ago",status: false),
  Notifymodel(id:6,message: "Your report was viewed by admin", time: "7 hour ago",status: true),
  Notifymodel(id:7,message: "Your report was viewed by admin", time: "1 hour ago",status: true),
  Notifymodel(id:8,message: "Admin sent you a message", time: "4 hour ago",status: false),
  Notifymodel(id:9,message: "Admin sent you a message", time: "4 hour ago",status: false),
  Notifymodel(id:10,message: "Admin sent you a message", time: "4 hour ago",status: false),
];