library json_to_form_romain;

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class CoreForm extends StatefulWidget {
  const CoreForm({
    @required this.form,
    @required this.onChanged,
    this.padding,
    this.form_map,
  });

  final String form;
  final dynamic form_map;
  final double padding;
  final ValueChanged<dynamic> onChanged;

  @override
  _CoreFormState createState() =>
      new _CoreFormState(form_map ?? json.decode(form));
}

class _CoreFormState extends State<CoreForm> {
  final dynamic form_items;

  dynamic radioValue;

  String _selected;


  List<Widget> JsonToForm() {
    List<Widget> list_widget = new List<Widget>();

    for (var count = 0; count < form_items.length; count++) {
      /*if(form_items[count]['type'] == "radioGroup")
      {
        form_items[count]['values']=form_items[count]['value'];
        form_items[count]['value']=form_items[count]['values'][0];
      }*/
      dynamic item = form_items[count];

      if (item['type'] == "edit" ||
          item['type'] == "TareaText") {
        list_widget.add(new Container(
            padding: new EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: new Text(
              item['value'][0],
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            )));
        list_widget.add(new TextField(
          controller: null,
          decoration: new InputDecoration(
            hintText: item['value'][0] ?? "",
          ),
          maxLines: item['type'] == "TareaText" ? 10 : 1,
          onChanged: (String value) {
            form_items[count]['response'] = value;
            _handleChanged();
          },
          obscureText: item['type'] == "Password" ? true : false,
        ));
      }

      if (item['type'] == "radioGroup") {

        list_widget.add(new Container(
            margin: new EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: new Text(/*item['title']*/"",
                style: new TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16.0))));
        //radioValue = item['value'];
        for (var i = 0; i < item['value'].length; i++) {
          list_widget.add(new Row(children: <Widget>[
            new Expanded(
                child: new Text(item['value'][i])),
            new Radio(
                value: item['value'][i],
                groupValue: _selected,
                onChanged: (dynamic value) {
                  this.setState(() {
                    _selected = value;

                    _handleChanged();
                  });
                })
          ]));
        }
      }

      if (item['type'] == "switch") {
        bool flag = true;
        if(item['value'][0]=="true")
        {
          flag = true;
        }
        else
        {
          flag = false;
        }
        list_widget.add(
          new Row(children: <Widget>[
            new Expanded(child: new Text(item['section'])),
            new Switch(
                value: flag,
                onChanged: (bool value) {
                  this.setState(() {
                    form_items[count]['value'][0] = value;
                    _handleChanged();
                  });
                })
          ]),
        );
      }

      if (item['type'] == "Checkbox") {
        list_widget.add(new Container(
            margin: new EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: new Text(item['title'],
                style: new TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16.0))));
        for (var i = 0; i < item['list'].length; i++) {
          list_widget.add(new Row(children: <Widget>[
            new Expanded(
                child: new Text(form_items[count]['list'][i]['title'])),
            new Checkbox(
                value: form_items[count]['list'][i]['value'],
                onChanged: (bool value) {
                  this.setState(() {
                    form_items[count]['list'][i]['value'] = value;
                    _handleChanged();
                  });
                })
          ]));
        }
      }
    }
    return list_widget;
  }

  _CoreFormState(this.form_items);

  void _handleChanged() {
    widget.onChanged(form_items);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      padding: new EdgeInsets.all(widget.padding ?? 8.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: JsonToForm(),
      ),
    );
  }
}
