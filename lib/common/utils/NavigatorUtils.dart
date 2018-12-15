import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsy_github_app_flutter/page/CodeDetailPage.dart';
import 'package:gsy_github_app_flutter/page/CodeDetailPageWeb.dart';
import 'package:gsy_github_app_flutter/page/CommonListPage.dart';
import 'package:gsy_github_app_flutter/page/GSYWebView.dart';
import 'package:gsy_github_app_flutter/page/HomePage.dart';
import 'package:gsy_github_app_flutter/page/IssueDetailPage.dart';
import 'package:gsy_github_app_flutter/page/LoginPage.dart';
import 'package:gsy_github_app_flutter/page/NotifyPage.dart';
import 'package:gsy_github_app_flutter/page/PersonPage.dart';
import 'package:gsy_github_app_flutter/page/PhotoViewPage.dart';
import 'package:gsy_github_app_flutter/page/PushDetailPage.dart';
import 'package:gsy_github_app_flutter/page/ReleasePage.dart';
import 'package:gsy_github_app_flutter/page/RepositoryDetailPage.dart';
import 'package:gsy_github_app_flutter/page/AccountDetailPage.dart';
import 'package:gsy_github_app_flutter/page/SearchPage.dart';
import 'package:gsy_github_app_flutter/page/UserProfilePage.dart';
import 'package:gsy_github_app_flutter/page/AccountIndexPage.dart';

/**
 * 导航栏
 * Created by guoshuyu
 * Date: 2018-07-16
 */
class NavigatorUtils {
  ///替换
  static pushReplacementNamed(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  ///切换无参数页面
  static pushNamed(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  ///主页
  static goHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, HomePage.sName);
  }

  ///登录页
  static goLogin(BuildContext context) {
    Navigator.pushReplacementNamed(context, LoginPage.sName);
  }

  ///个人中心
  static goPerson(BuildContext context, String userName) {
    Navigator.push(context, new CupertinoPageRoute(builder: (context) => new PersonPage(userName)));
  }

  ///account详情
  static Future<Null> goAccountDetail(BuildContext context, String guid) {
    return Navigator.push(context, new CupertinoPageRoute(builder: (context) => new AccountDetailPage(guid)));
  }
  ///account详情
  static Future<Null> goAccountIndex(BuildContext context) {
    return Navigator.push(context, new CupertinoPageRoute(builder: (context) => new AccountIndexPage()));
  }

  ///仓库详情
  static Future<Null> goReposDetail(BuildContext context, String userName, String reposName) {
    return Navigator.push(context, new CupertinoPageRoute(builder: (context) => new RepositoryDetailPage(userName, reposName)));
  }

  ///仓库版本列表
  static Future<Null> goReleasePage(BuildContext context, String userName, String reposName, String releaseUrl, String tagUrl) {
    return Navigator.push(
        context,
        new CupertinoPageRoute(
            builder: (context) => new ReleasePage(
                  userName,
                  reposName,
                  releaseUrl,
                  tagUrl,
                )));
  }

  ///issue详情
  static Future<Null> goIssueDetail(BuildContext context, String userName, String reposName, String num, {bool needRightLocalIcon = false}) {
    return Navigator.push(
        context,
        new CupertinoPageRoute(
            builder: (context) => new IssueDetailPage(
                  userName,
                  reposName,
                  num,
                  needHomeIcon: needRightLocalIcon,
                )));
  }

  ///通用列表
  static gotoCommonList(BuildContext context, String title, String showType, String dataType, {String userName, String reposName}) {
    Navigator.push(
        context,
        new CupertinoPageRoute(
            builder: (context) => new CommonListPage(
                  title,
                  showType,
                  dataType,
                  userName: userName,
                  reposName: reposName,
                )));
  }

  ///文件代码详情
  static gotoCodeDetailPage(BuildContext context, {String title, String userName, String reposName, String path, String data, String branch, String htmlUrl}) {
    Navigator.push(
        context,
        new CupertinoPageRoute(
            builder: (context) => new CodeDetailPage(
                  title: title,
                  userName: userName,
                  reposName: reposName,
                  path: path,
                  data: data,
                  branch: branch,
                  htmlUrl: htmlUrl,
                )));
  }

  ///仓库详情通知
  static Future<Null> goNotifyPage(BuildContext context) {
    return Navigator.push(context, new CupertinoPageRoute(builder: (context) => new NotifyPage()));
  }

  ///搜索
  static Future<Null> goSearchPage(BuildContext context) {
    return Navigator.push(context, new CupertinoPageRoute(builder: (context) => new SearchPage()));
  }

  ///提交详情
  static Future<Null> goPushDetailPage(BuildContext context, String userName, String reposName, String sha, bool needHomeIcon) {
    return Navigator.push(
        context,
        new CupertinoPageRoute(
            builder: (context) => new PushDetailPage(
                  sha,
                  userName,
                  reposName,
                  needHomeIcon: needHomeIcon,
                )));
  }

  ///全屏Web页面
  static Future<Null> goGSYWebView(BuildContext context, String url, String title) {
    return Navigator.push(
      context,
      new CupertinoPageRoute(
        builder: (context) => new GSYWebView(url, title),
      ),
    );
  }

  ///文件代码详情Web
  static gotoCodeDetailPageWeb(BuildContext context, {String title, String userName, String reposName, String path, String data, String branch, String htmlUrl}) {
    Navigator.push(
        context,
        new CupertinoPageRoute(
            builder: (context) => new CodeDetailPageWeb(
                  title: title,
                  userName: userName,
                  reposName: reposName,
                  path: path,
                  data: data,
                  branch: branch,
                  htmlUrl: htmlUrl,
                )));
  }

  ///根据平台跳转文件代码详情Web
  static gotoCodeDetailPlatform(BuildContext context, {String title, String userName, String reposName, String path, String data, String branch, String htmlUrl}) {
    /*if (Platform.isIOS) {
      NavigatorUtils.gotoCodeDetailPage(
        context,
        title: title,
        reposName: reposName,
        userName: userName,
        path: path,
        branch: branch,
      );
    } else {
      NavigatorUtils.gotoCodeDetailPageWeb(
        context,
        title: title,
        reposName: reposName,
        userName: userName,
        path: path,
        branch: branch,
      );
    }
*/
    NavigatorUtils.gotoCodeDetailPageWeb(
      context,
      title: title,
      reposName: reposName,
      userName: userName,
      path: path,
      branch: branch,
    );
  }

  ///图片预览
  static gotoPhotoViewPage(BuildContext context, String url) {
    Navigator.push(context, new CupertinoPageRoute(builder: (context) => new PhotoViewPage(url)));
  }

  ///用户配置
  static gotoUserProfileInfo(BuildContext context) {
    Navigator.push(context, new CupertinoPageRoute(builder: (context) => new UserProfileInfo()));
  }
}
