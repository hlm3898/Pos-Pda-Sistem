import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:simsek/ekranlar/satisfatura/bilesen/tasarim.dart';
import 'package:simsek/ekranlar/satisfatura/bilesen/horizontal_list.dart';
import 'package:simsek/ekranlar/satisfatura/bilesen/vertical_list.dart';
import 'package:simsek/ozellikler/menu.dart';

class SlidableScreen extends StatefulWidget {

  @override
  _SlidableScreenState createState() => _SlidableScreenState();
}

class _SlidableScreenState extends State<SlidableScreen> {
  SlidableController _slidableController;
  final List<faturaliste> items = List.generate(
    11,
        (i) => faturaliste(
        i,
      _position(i),
      _subtitle(i),
      _avatarColor(i),
    ),
  );

  static Color _avatarColor(int index) {
    switch (index % 4) {
      case 0:
        return Colors.cyan[200];
      case 1:
        return Colors.teal;
      case 2:
        return Colors.red;
      case 3:
        return Colors.orange;
      default:
        return null;
    }
  }

  static String _subtitle(int index) {
    switch (index % 4) {
      case 0:
        return 'Kesilen Fatura Tutarı 290.00 Tl';
      case 1:
        return 'Kesilen Fatura Tutarı 765.00 Tl';
      case 2:
        return 'Kesilen Fatura Tutarı 9456.00 Tl';
      case 3:
        return 'Kesilen Fatura Tutarı 3652.00 Tl';
      default:
        return null;
    }
  }

  static String _position(int index) {
    switch (index % 4) {
      case 0:
        return 'Halim Şimşek Ltd. Şti';
      case 1:
        return 'Kral Yazılım Ltd. Şti';
      case 2:
        return 'Mobilyaci Aş';
      case 3:
        return 'Mehmet Uygun';
      default:
        return null;
    }
  }

  @override
  void initState() {
    _slidableController = SlidableController(
      onSlideAnimationChanged: slideAnimationChanged,
      onSlideIsOpenChanged: slideIsOpenChanged,
    );
    super.initState();
  }

  Animation<double> _rotationAnimation;
  Color _fabColor = Colors.redAccent;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: appbar(),
      appBar: AppBar(
        title: Text("Faturalar"),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: OrientationBuilder(
          builder: (context, orientation) => _buildList(
              context,
              orientation == Orientation.portrait
                  ? Axis.vertical
                  : Axis.horizontal),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: _fabColor,
        onPressed: null,
        child: _rotationAnimation == null
            ? Icon(Icons.add,color: Colors.white,)
            : RotationTransition(
          turns: _rotationAnimation,
          child: Icon(Icons.add,color: Colors.white,),
        ),
      ),
    );
  }

  Widget _buildList(BuildContext context, Axis direction) {
    return ListView.builder(
      scrollDirection: direction,
      itemBuilder: (context, index) {
        final Axis slidableDirection =
        direction == Axis.horizontal ? Axis.vertical : Axis.horizontal;
        var item = items[index];
        if (item.fatno < 5) {
          return _slidableWithLists(context, index, slidableDirection);
        } else {
          return _slidableWithDelegates(context, index, slidableDirection);
        }
      },
      itemCount: items.length,
    );
  }

  Widget _slidableWithLists(
      BuildContext context, int index, Axis direction) {
    final faturaliste item = items[index];
    return Slidable(
      key: Key(item.fatfir),
      controller: _slidableController,
      direction: direction,
      dismissal: SlidableDismissal(
        child: SlidableDrawerDismissal(),
        onDismissed: (actionType) {
          _showSnackBar(
              context,
              actionType == SlideActionType.primary
                  ? 'Gönder'
                  : 'Sil');
          setState(() {
            items.removeAt(index);
          });
        },
      ),
      actionPane: _actionPane(item.fatno),
      actionExtentRatio: 0.20,
      child: direction == Axis.horizontal
          ? VerticalList(items[index])
          : HorizontalList(items[index]),
      actions: <Widget>[
        IconSlideAction(
          caption: 'Yazdır',
          color: Colors.blue,
          icon: Icons.print,
          onTap: () => _showSnackBar(context, 'Yazdır'),
        ),
        IconSlideAction(
          caption: 'Gönder',
          color: Colors.indigo,
          icon: Icons.share,
          onTap: () => _showSnackBar(context, 'Gönder'),
        ),
      ],
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Düzelt',
          color: Colors.grey.shade200,
          icon: Icons.more_horiz,
          onTap: () => _showSnackBar(context, 'Düzelt'),
          closeOnTap: false,
        ),
        IconSlideAction(
          caption: 'Sil',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => _showSnackBar(context, 'Sil'),
        ),
      ],
    );
  }

  Widget _slidableWithDelegates(
      BuildContext context, int index, Axis direction) {
    final faturaliste item = items[index];
    return Slidable.builder(
      key: Key(item.fatfir),
      controller: _slidableController,
      direction: direction,
      dismissal: SlidableDismissal(
        child: SlidableDrawerDismissal(),
        closeOnCanceled: true,
        onWillDismiss: (item.fatno != 10)
            ? null
            : (actionType) {
          return showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: Colors.redAccent,
                title: Text('Sil',style: TextStyle(color: Colors.white),),
                content: Text('Fatura Başarı İle Silindi',style: TextStyle(color: Colors.white),),
                actions: <Widget>[
                  FlatButton(
                    child: Text('İptal',style: TextStyle(color: Colors.white),),
                    onPressed: () => Navigator.of(context).pop(false),
                  ),
                  FlatButton(
                    child: Text('Tamam',style: TextStyle(color: Colors.white),),
                    onPressed: () => Navigator.of(context).pop(true),
                  ),
                ],
              );
            },
          );
        },
        onDismissed: (actionType) {
          _showSnackBar(
              context,
              actionType == SlideActionType.primary
                  ? 'Gönderildi'
                  : 'Gönderme');
          setState(() {
            items.removeAt(index);
          });
        },
      ),
      actionPane: _actionPane(item.fatno),
      actionExtentRatio: 0.20,
      child: direction == Axis.horizontal
          ? VerticalList(items[index])
          : HorizontalList(items[index]),
      actionDelegate: SlideActionBuilderDelegate(
          actionCount: 2,
          builder: (context, index, animation, renderingMode) {
            if (index == 0) {
              return IconSlideAction(
                caption: 'Gönder',
                color: renderingMode == SlidableRenderingMode.slide
                    ? Colors.blue.withOpacity(animation.value)
                    : (renderingMode == SlidableRenderingMode.dismiss
                    ? Colors.blue
                    : Colors.green),
                icon: Icons.archive,
                onTap: () async {
                  var state = Slidable.of(context);
                  var dismiss = await showDialog<bool>(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: Colors.redAccent,
                        title: Text('Sil',style: TextStyle(color: Colors.white),),
                        content: Text('Fatura Silindi',style: TextStyle(color: Colors.white),),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('İptal',style: TextStyle(color: Colors.white),),
                            onPressed: () => Navigator.of(context).pop(false),
                          ),
                          FlatButton(
                            child: Text('Tamam',style: TextStyle(color: Colors.white),),
                            onPressed: () => Navigator.of(context).pop(true),
                          ),
                        ],
                      );
                    },
                  );

                  if (dismiss) {
                    state.dismiss();
                  }
                },
              );
            } else {
              return IconSlideAction(
                caption: 'Share',
                color: renderingMode == SlidableRenderingMode.slide
                    ? Colors.indigo.withOpacity(animation.value)
                    : Colors.indigo,
                icon: Icons.share,
                onTap: () => _showSnackBar(context, 'Gönder'),
              );
            }
          }),
      secondaryActionDelegate: SlideActionBuilderDelegate(
          actionCount: 2,
          builder: (context, index, animation, renderingMode) {
            if (index == 0) {
              return IconSlideAction(
                caption: 'Düzelt',
                color: renderingMode == SlidableRenderingMode.slide
                    ? Colors.grey.shade200.withOpacity(animation.value)
                    : Colors.grey.shade200,
                icon: Icons.more_horiz,
                onTap: () => _showSnackBar(context, 'Düzelt'),
                closeOnTap: false,
              );
            } else {
              return IconSlideAction(
                caption: 'Sil',
                color: renderingMode == SlidableRenderingMode.slide
                    ? Colors.red.withOpacity(animation.value)
                    : Colors.red,
                icon: Icons.delete,
                onTap: () => _showSnackBar(context, 'Sil'),
              );
            }
          }),
    );
  }

  static Widget _actionPane(int index) {
    switch (index % 4) {
      case 0:
        return SlidableScrollActionPane();
      case 1:
        return SlidableDrawerActionPane();
      case 2:
        return SlidableStrechActionPane();
      case 3:
        return SlidableBehindActionPane();

      default:
        return null;
    }
  }



  void _showSnackBar(BuildContext context, String text) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  void slideAnimationChanged(Animation<double> slideAnimation) {
    setState(() {
      _rotationAnimation = slideAnimation;
    });
  }

  void slideIsOpenChanged(bool isOpen) {
    setState(() {
      _fabColor = isOpen ? Colors.orange : Colors.redAccent;
    });
  }
}