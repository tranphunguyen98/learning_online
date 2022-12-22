import 'package:flutter/material.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:learning_online/core/core.dart';
import 'package:learning_online/core/widgets/string_utility.dart';

const _scaleHeightBottomSheetPhone = 0.95;
const _contentPaddingTextfield = EdgeInsets.fromLTRB(16, 10, 52, 10);
const _borderRadiusTextfield = 4.0;
const _iconTextfieldPaddingRight = 16.0;
const _borderRadiusBottomSheetPhone =
    BorderRadius.vertical(top: Radius.circular(12));
const _titleBarMarginBottomSheet =
    EdgeInsets.symmetric(horizontal: 20, vertical: 16);
const _listMarginBottomSheetPhone = EdgeInsets.symmetric(horizontal: 20);
const _itemListPaddingBottomSheet =
    EdgeInsets.symmetric(horizontal: 16, vertical: 10);
const _itemListBorderRadius = BorderRadius.all(Radius.circular(4));

class SearchableDropdownNew<T> extends StatefulWidget {
  final Color themeColor;
  final List<T> items;
  final String Function(T) valueShow;
  final Function(T) onChanged;
  final T? selectedItemIndex;
  final bool readOnly;
  final Color backgroundColor;
  final String? hintText;
  final String? hintTextSearchBar;
  final String titleSearchBar;
  final bool isCaseSensitiveSearch;
  final Function(String, List<T>)? searchFn;
  final Color dialogBackgroundColor;
  final TextInputType keyboardType;
  final String? initialValue;
  final bool isValid;
  final Widget? trailing;

  SearchableDropdownNew({
    Key? key,
    required this.valueShow,
    required this.items,
    required this.onChanged,
    this.isCaseSensitiveSearch = false,
    this.keyboardType = TextInputType.text,
    this.selectedItemIndex,
    this.readOnly = false,
    this.hintText,
    this.hintTextSearchBar,
    this.titleSearchBar = '',
    this.searchFn,
    this.backgroundColor = Colors.white,
    this.dialogBackgroundColor = Colors.white,
    this.isValid = true,
    this.themeColor = Colors.blueAccent,
    this.initialValue,
    this.trailing,
  }) : super(key: key);

  @override
  _SearchableDropdownNewState<T> createState() => _SearchableDropdownNewState();
}

class _SearchableDropdownNewState<T> extends State<SearchableDropdownNew<T>>
    with SingleTickerProviderStateMixin {
  T? selected;

  bool get _enabled => widget.items.isNotEmpty && !(widget.readOnly);

  @override
  void initState() {
    selected = widget.selectedItemIndex;
    super.initState();
  }

  int? getIndex() {
    if (widget.selectedItemIndex == null) return null;
    var index = widget.items.indexOf(selected!);
    return index == -1 ? null : index;
  }

  @override
  void didUpdateWidget(SearchableDropdownNew<T> oldWidget) {
    selected = widget.selectedItemIndex;
    super.didUpdateWidget(oldWidget);
  }

  void _showModalBottomSheet(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (_) {
          return DraggableScrollableSheet(
              expand: false,
              initialChildSize: _scaleHeightBottomSheetPhone,
              builder: (_, __) {
                return DropdownBottomSheet<T>(
                  themeColor: widget.themeColor,
                  items: widget.items,
                  valueShow: widget.valueShow,
                  hintTextSearchBar: widget.hintTextSearchBar,
                  isCaseSensitiveSearch: widget.isCaseSensitiveSearch,
                  keyboardType: widget.keyboardType,
                  searchFn: widget.searchFn,
                  selectedItemIndex: getIndex(),
                  backgroundColor: widget.dialogBackgroundColor,
                  titleSearchBar: widget.titleSearchBar,
                  onDone: (index, item) {
                    selected = item;
                    widget.onChanged.call(item);
                    setState(() {});
                  },
                );
              });
        });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _enabled ? () => _showModalBottomSheet(context) : null,
      child: _buildSearchBar(
          selected == null ? '' : widget.valueShow(selected!)),
    );
  }

  Widget _buildSearchBar(String value) {
    return Container(
      height: 48,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        border: Border.all(color: Colors.blueGrey, width: 0.25),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              value.isNotEmpty ? value : widget.hintText ?? '',
              style: kFontRegularDefault_14,
            ),
          ),
          Icon(Icons.arrow_drop_down_outlined),
        ],
      ),
    );
    // return Stack(
    //   children: <Widget>[
    //     IgnorePointer(
    //       child: TextFormField(
    //         readOnly: true,
    //         initialValue: widget.initialValue,
    //         controller: TextEditingController(text: value),
    //         decoration: InputDecoration(
    //           contentPadding: _contentPaddingTextfield,
    //           enabledBorder: !widget.isValid
    //               ? OutlineInputBorder(
    //                   // borderSide:
    //                   //     BorderSide(color: Color.fromRGBO(255, 41, 89, 1)),
    //             borderSide: BorderSide.none,
    //             borderRadius: BorderRadius.circular(_borderRadiusTextfield),
    //                 )
    //               : OutlineInputBorder(
    //                   borderSide: BorderSide.none,
    //                   borderRadius: BorderRadius.circular(_borderRadiusTextfield),
    //                 ),
    //           border: OutlineInputBorder(
    //             borderSide: BorderSide.none,
    //             borderRadius: BorderRadius.circular(_borderRadiusTextfield),
    //           ),
    //           fillColor: widget.backgroundColor,
    //           hintText: widget.hintText,
    //           hintStyle: kFontRegularDefault_14,
    //           filled: true,
    //         ),
    //         style: Theme.of(context).textTheme.subtitle2?.copyWith(
    //               fontSize: 12,
    //               color: Color(0xff333333),
    //             ),
    //       ),
    //     ),
    //     Positioned(
    //       right: widget.trailing != null ? 0 : _iconTextfieldPaddingRight,
    //       top: 0,
    //       bottom: 0,
    //       child: widget.trailing ?? Icon(Icons.arrow_drop_down_outlined),
    //     ),
    //   ],
    // );
  }
}

class DropdownBottomSheet<T> extends StatefulWidget {
  final Color themeColor;
  final List<T> items;
  final String Function(T) valueShow;
  final bool isCaseSensitiveSearch;
  final TextInputType keyboardType;
  final String? hintTextSearchBar;
  final String titleSearchBar;
  final Function(String, List<T>)? searchFn;
  final int? selectedItemIndex;
  final Color backgroundColor;
  final Function? onClose;
  final Function(int, T)? onDone;

  DropdownBottomSheet({
    Key? key,
    required this.items,
    required this.valueShow,
    this.isCaseSensitiveSearch = false,
    required this.keyboardType,
    this.searchFn,
    this.selectedItemIndex,
    this.onClose,
    this.onDone,
    required this.backgroundColor,
    this.hintTextSearchBar,
    required this.titleSearchBar,
    required this.themeColor,
  }) : super(key: key);

  _DropdownBottomSheetState<T> createState() => _DropdownBottomSheetState<T>();
}

class _DropdownBottomSheetState<T> extends State<DropdownBottomSheet<T>> {
  TextEditingController txtSearch = TextEditingController();
  List<int> shownIndexes = [];
  late Function(String, List<T>) searchFn;
  late int? selectedItemIndex;

  _DropdownBottomSheetState();

  void _updateShownIndexes(String keyword) {
    shownIndexes = searchFn(keyword, widget.items);
  }

  @override
  void initState() {
    selectedItemIndex = widget.selectedItemIndex;
    if (widget.searchFn != null) {
      searchFn = widget.searchFn!;
    } else {
      Function(String, T) matchFn;
      if (widget.isCaseSensitiveSearch) {
        matchFn = (keyword, item) {
          var inputText = StringUtility.unsign(keyword);
          var itemInListText = StringUtility.unsign(widget.valueShow(item));
          return itemInListText.contains(inputText);
        };
      } else {
        matchFn = (keyword, item) {
          var inputText = StringUtility.unsign(keyword.toLowerCase());
          var itemInListText =
              StringUtility.unsign(widget.valueShow(item).toLowerCase());
          return itemInListText.contains(inputText);
        };
      }
      searchFn = (keyword, items) {
        List<int> shownIndexes = [];
        int i = 0;
        widget.items.forEach((item) {
          if (matchFn(keyword, item) || StringUtils.isNullOrEmpty(keyword)) {
            shownIndexes.add(i);
          }
          i++;
        });
        return shownIndexes;
      };
    }
    _updateShownIndexes('');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: _borderRadiusBottomSheetPhone,
      ),
      child: Column(
        children: <Widget>[
          _buildTitleBar(),
          _buildSearchBar(),
          _buildListPhone(),
        ],
      ),
    );
  }

  Widget _buildTitleBar() {
    return Container(
      margin: _titleBarMarginBottomSheet,
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.pop(context);
              widget.onClose?.call();
            },
            child: Icon(Icons.keyboard_arrow_left),
          ),
          Expanded(
            child: Text(
              widget.titleSearchBar,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle2?.copyWith(
                    color: Color(0xff333333),
                  ),
            ),
          ),
          InkWell(
            onTap: () {
              if (selectedItemIndex != null) {
                Navigator.pop(context);
                widget.onDone?.call(
                    selectedItemIndex!, widget.items[selectedItemIndex!]);
              }
            },
            child: Icon(Icons.check, color: widget.themeColor),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: <Widget>[
          TextField(
            controller: txtSearch,
            decoration: InputDecoration(
              contentPadding: _contentPaddingTextfield,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(_borderRadiusTextfield),
              ),
              fillColor: Color.fromRGBO(244, 247, 251, 1),
              hintText: widget.hintTextSearchBar,
              filled: true,
            ),
            autofocus: false,
            onChanged: (value) {
              _updateShownIndexes(value);
              setState(() {});
            },
            style: Theme.of(context).textTheme.subtitle2?.copyWith(
                  fontSize: 12,
                  color: Color(0xff333333),
                ),
            keyboardType: widget.keyboardType,
          ),
          Positioned(
            right: _iconTextfieldPaddingRight,
            top: 0,
            bottom: 0,
            child: InkWell(
              onTap: () {
                _updateShownIndexes('');
                setState(() {
                  txtSearch.text = '';
                });
              },
              child: txtSearch.text.isNotEmpty
                  ? Icon(
                      Icons.close,
                      color: widget.themeColor,
                    )
                  : Icon(Icons.search, color: widget.themeColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListPhone() {
    return Expanded(
      child: Container(
        padding: _listMarginBottomSheetPhone,
        child: Scrollbar(
          child: ListView.builder(
            itemCount: shownIndexes.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  selectedItemIndex = shownIndexes[index];
                  setState(() {});
                  widget.onDone?.call(
                      selectedItemIndex!, widget.items[selectedItemIndex!]);
                  Navigator.pop(context);
                },
                child: Container(
                  padding: _itemListPaddingBottomSheet,
                  decoration: BoxDecoration(
                    color: selectedItemIndex == shownIndexes[index]
                        ? widget.themeColor
                        : null,
                    borderRadius: _itemListBorderRadius,
                  ),
                  child: Text(
                    widget.valueShow(widget.items[shownIndexes[index]]),
                    style: Theme.of(context).textTheme.subtitle2?.copyWith(
                          fontSize: 12,
                          color: selectedItemIndex == shownIndexes[index]
                              ? Colors.white
                              : null,
                        ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

// Widget _buildListTablet() {
//   return Expanded(
//     child: Scrollbar(
//       child: ListView.builder(
//         itemCount: shownIndexes.length,
//         itemBuilder: (context, index) {
//           return InkWell(
//             onTap: () {
//               selectedItemIndex = shownIndexes[index];
//               setState(() {});
//             },
//             child: Column(
//               children: <Widget>[
//                 Container(
//                   width: double.infinity,
//                   padding: _itemListPaddingBottomSheet,
//                   decoration: BoxDecoration(
//                     color: selectedItemIndex == shownIndexes[index]
//                         ? Color.fromRGBO(103, 145, 244, 1)
//                         : null,
//                   ),
//                   child: index != null && shownIndexes[index] != null
//                       ? Text(
//                           widget.valueShow(widget.items[shownIndexes[index]]),
//                           textAlign: TextAlign.center,
//                           style: Theme.of(context).textTheme.subhead.copyWith(
//                                 color:
//                                     selectedItemIndex == shownIndexes[index]
//                                         ? Colors.white
//                                         : null,
//                               ),
//                         )
//                       : Container(),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     ),
//   );
// }
}
