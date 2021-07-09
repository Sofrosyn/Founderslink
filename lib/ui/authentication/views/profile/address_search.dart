import 'package:flutter/material.dart';
import 'package:founderslink/ui/authentication/bloc/authentication_bloc.dart';
import 'package:founderslink/ui/authentication/models/location_response.dart';

class AddressSearch extends SearchDelegate<Suggestion> {

  final _bloc = AuthenticationBloc();


  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        tooltip: 'Clear',
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: query == ""
          ? null
          : _bloc.fetchSuggestions(
          query),
      builder: (context, snapshot) => query == ''
          ? Container(
        padding: EdgeInsets.all(16.0),
        child: Text('Enter your address'),
      )
          : snapshot.hasData
          ? ListView.builder(
        itemBuilder: (context, index) => ListTile(
          title:
          Text((snapshot.data[index] as Suggestion).description),
          onTap: () {
            close(context, snapshot.data[index] as Suggestion);
          },
        ),
        itemCount: snapshot.data.length,
      )
          : Center(child: Container(padding: EdgeInsets.all(20),child: Text('Loading...'))),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: query == ""
          ? null
          : _bloc.fetchSuggestions(
          query),
      builder: (context, snapshot) => query == ''
          ? Container(
        padding: EdgeInsets.all(16.0),
        child: Text('Enter your address'),
      )
          : snapshot.hasData
          ? ListView.builder(
        itemBuilder: (context, index) => ListTile(
          title:
          Text((snapshot.data[index] as Suggestion).description),
          onTap: () {
            close(context, snapshot.data[index] as Suggestion);
          },
        ),
        itemCount: snapshot.data.length,
      )
          : Center(child: Container(padding: EdgeInsets.all(20),child: Text('Loading...'))),
    );
  }
}
