import 'package:demo_view_shopify/src/domain/models/Roles.dart';
import 'package:demo_view_shopify/src/presentation/pages/admin/roles/list/bloc/AdminRolesListBloc.dart';
import 'package:flutter/material.dart';

class AdminRolesListItem extends StatelessWidget {
  AdminRolesListBloc? bloc;
  Roles? roles;

  AdminRolesListItem(this.bloc, this.roles);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          //Navigator.pushNamed(context, 'admin/product/list');
        },
        child: ListTile(
          leading: roles != null
              ? Container(
                  width: 70,
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/img/noimage.png',
                    image: roles!.image,
                    fit: BoxFit.contain,
                    fadeInDuration: Duration(seconds: 3),
                  ),
                )
              : Container(),
          title: Text(roles?.name ?? ''),
          subtitle: Text(roles?.route ?? ''),
          trailing: Wrap(
            direction: Axis.horizontal,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '', arguments: roles);
                  },
                  icon: Icon(Icons.edit)),
              IconButton(
                  onPressed: () {
                    //bloc?.deleteRoles(roles!);
                  },
                  icon: Icon(Icons.delete)),
            ],
          ),
        ));
  }
}
