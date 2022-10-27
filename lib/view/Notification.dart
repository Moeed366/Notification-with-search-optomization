
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../model/Notifymodel.dart';



class Notify extends StatefulWidget {
  const Notify({Key? key}) : super(key: key);

  @override
  State<Notify> createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
   List nm=[];
  final TextEditingController _filter = new TextEditingController();
  Widget _appBarTitle = new Text('Notification',style: TextStyle(fontWeight: FontWeight.w700,fontFamily:"Josefin Sans",fontSize: 24.sp ,color: Color(0xff494444)),);
  Widget _appBarleading=new Icon(Icons.arrow_back_rounded,size: 25.sp,color: Colors.black,);
  List names = [];
  String _searchText = "";
  List filteredNames = [];
  Icon _searchIcon = new Icon(Icons.search,color: Colors.black,);
  bool icn=false;
  Color? color;
  List<String> lst=[];

  //late final String? acolor;
  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(0, 70),
          child: Padding(
            padding:  EdgeInsets.only(top: 30.h),
            child: AppBar(elevation: 0.0,
              backgroundColor: Colors.transparent,
              leading:_appBarleading ,
              centerTitle: true,
              title: _appBarTitle,
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.search,color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      for(int i=0;i<notifycontent.length;i++)
                      {
                        lst.add(notifycontent[i].message.toLowerCase());
                      }
                    });
                    print(lst);
                    showSearch(
                      context: context,
                      delegate: CustomSearchDelegate(allNames:lst),
                    );
                  },
                ),

              ],
            ),
          ),
        ),
        body: SafeArea(
            child: ListView.builder(
              //physics: NeverScrollableScrollPhysics(),

                itemCount: notifycontent.length,
                itemBuilder: (context, index) {
                  if(notifycontent[index].status==true){
                    icn=true;
                    color=Color(0xffAAEDB1);

                  }
                  else{icn=false;
                  color=Color(0xffFFF0AF) ;}
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                        leading:
                        Container(height:42.h,width:42.w,
                            color: color,
                            //backgroundColor: Colors.purple,
                            child:
                            icn
                                ? Padding(
                              padding: EdgeInsets.only(left: 10.w,top: 15.h,right: 10.w,bottom: 15.h),
                              child: Image.asset("assets/images/doubletick.png",fit: BoxFit.fill,),
                            )
                                : Icon(Icons.mail)


                          // Text(notifycontent[index].status.toString()),
                        ),
                        title: Text(notifycontent[index].message,style: TextStyle(fontWeight: FontWeight.w400,fontFamily:"Josefin Sans",fontSize: 16.sp ,color: Color(0xff494444)),),
                        subtitle: Text(notifycontent[index].time,style: TextStyle(fontWeight: FontWeight.w300,fontFamily:"Josefin Sans",fontSize: 8.sp,color: Color(0xff494444) ),),
                        trailing: IconButton(onPressed: () {  }, icon: Icon(Icons.more_vert,color: Colors.black,),)


                      //const Icon(Icons.more_vert,color: Colors.black,),
                    ),
                  );

                } )
        ));
  }

}




class CustomSearchDelegate extends SearchDelegate {
  final List<String> allNames;
  CustomSearchDelegate({Key? key,required this.allNames,});
  var suggestion = [];
  List<String> searchResult = [];



  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    searchResult.clear();
    searchResult =
        allNames.where((element) => element.startsWith(query)).toList();
    return Container(
      margin: EdgeInsets.all(20),
      child: ListView(
          padding: EdgeInsets.only(top: 8, bottom: 8),
          scrollDirection: Axis.vertical,
          children: List.generate(suggestion.length, (index) {
            var item = suggestion[index];
            return Card(
              color: Colors.white,
              child: Container(padding: EdgeInsets.all(16), child: Text(item)),
            );
          })),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // This method is called everytime the search term changes.
    // If you want to add search suggestions as the user enters their search term, this is the place to do that.
    final suggestionList = query.isEmpty
        ? suggestion
        : allNames.where((element) => element.toLowerCase().contains(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          if (query.isEmpty) {
            query = suggestion[index];
          }
        },
        leading: Icon(query.isEmpty ? Icons.history : Icons.search),
        title: RichText(
            text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: suggestionList[index].substring(query.length),
                    style: TextStyle(color: Colors.black),
                  )
                ])),
      ),
      itemCount: suggestionList.length,
    );
  }

}
