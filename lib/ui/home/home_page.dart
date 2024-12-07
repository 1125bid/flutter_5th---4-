import 'package:flutter/material.dart';
import 'package:flutter_book_searching_app/ui/widets/home_bottom_sheet.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textEditingController = TextEditingController();

  @override //재정의(추가기능)
  void dispose() {
    // TextEditingController dispose해줘야 메모리에서 소거됨.
    textEditingController.dispose();
    super.dispose();
  }

  void onSearch(String text) {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            maxLines: 1,
            onSubmitted: onSearch,
            controller: textEditingController,
            decoration: InputDecoration(
              hintText: '검색어를 입력해주세요.',
              border: MaterialStateOutlineInputBorder.resolveWith(
                (states) {
                  if (states.contains(WidgetState.focused)) {
                    return OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black));
                  }
                  return OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey));
                },
              ),
            ),
          ),
          actions: [
            GestureDetector(
                onTap: () {
                  onSearch(textEditingController.text);
                },
                //button 의 터치 영역은 44 디바이스 픽셀이상으로 해야한다.
                child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.transparent,
                    //container 의 배경색이 없으면 자녀위젯(icon)에만 터치 이벤트가 적용됨.
                    child: Icon(Icons.search)))
          ],
        ),
        body: GridView.builder(
          padding: EdgeInsets.all(20),
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 3 / 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return HomeBottomSheet();
                    },
                  );
                },
                child: Image.network('[homestate[index].image]'));
          },
        ),
      ),
    );
  }
}
