<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hncta
  Date: 2019-04-24
  Time: 22:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>专家-BigBang知识库</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/statics/img/logo1%20(1).png">
    <link href="${pageContext.request.contextPath}/statics/css/normalize.css-master/normalize.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/bootstrap-3.3.7-dist/bootstrap-3.3.7-dist/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/demo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/myspace_editInfo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/layui-master/dist/css/layui.css"  media="all">
    <script src="${pageContext.request.contextPath}/statics/layui-master/dist/layui.js" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/statics/js/modernizr.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/jquery-2.1.0.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/main.js"></script>
    <script src="${pageContext.request.contextPath}/statics/css/bootstrap-3.3.7-dist/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/knowledgeContent.js"></script>
</head>
<body>
<div class="nav-index">
    <header class="cd-main-header animate-search">
        <div class="cd-logo"><a href="#"><img src="${pageContext.request.contextPath}/statics/img/logo1%20(3).png" alt="Logo" style="width: 124px; height: 23px"></a></div>

        <nav class="cd-main-nav-wrapper">
            <a href="#search" class="cd-search-trigger cd-text-replace">Search</a>

            <ul class="cd-main-nav">
                <li>
                    <a href="#">
                        知识
                        <span class="glyphicon glyphicon-book"></span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        问答
                        <span class="glyphicon glyphicon-question-sign"></span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        小组
                        <span class="glyphicon glyphicon-tree-conifer"></span>
                    </a>
                </li>
                <!--登录显示头像-->
                <li class="fix-menu-item-user">
                                        <span style="color: #fff;font-size: 15px;line-height: 1;cursor: pointer" onclick="showDropdownFix()">
                                           <img src="${pageContext.request.contextPath}/statics/img/boy.png" alt="waiting" class="img-rounded" style="width: 40px; height: 40px; margin-bottom: 5px">
                                            <span class="showDownFix">
                                                  ${user.userName}
                                                <span class="glyphicon glyphicon-chevron-up"></span>
                                            </span>
                                        </span>
                    <ul class="fix-user-logo-choice" style="display: none">
                        <li class="sanJiao">
                            <a href="#">
                                <span class="glyphicon glyphicon-list-alt"></span>
                                我的空间
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <span class="glyphicon glyphicon-cog"></span>
                                管理控制台
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <span class="glyphicon glyphicon-book"></span>
                                创建文档
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <span class="glyphicon glyphicon-cloud"></span>
                                上传知识
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <span class="glyphicon glyphicon-cog"></span>
                                创建提问
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <span class="glyphicon glyphicon-off"></span>
                                注销
                            </a>
                        </li>
                    </ul>
                </li>
                <!-- <li>
                     <a href="loginRegister.html">
                         登录/注册
                         <span class="glyphicon glyphicon-user"></span>
                     </a>
                 </li>-->
            </ul> <!-- .cd-main-nav -->
        </nav> <!-- .cd-main-nav-wrapper -->

        <a href="#0" class="cd-nav-trigger cd-text-replace">Menu<span></span></a>
    </header>
    <main class="cd-main-content">
        <div class="knowledgeGroup">
            <div class="showPath">
                <div class="container">
                    <div class="showPathList">
                        <ol>
                            <li class="itemElement">
                                <a href="#">
                                    <span>首页</span>
                                    <img src="${pageContext.request.contextPath}/statics/img/zhixiang.png" alt="waiting">
                                </a>
                            </li>
                            <li class="itemElement">
                                <a href="#">
                                    <span>我的空间</span>
                                    <img src="${pageContext.request.contextPath}/statics/img/zhixiang.png" alt="waiting">
                                </a>
                            </li>
                        </ol>
                    </div>
                </div>
            </div>
            <div class="container" style="margin-bottom: 60px">
                <div class="row" style="margin-top: 35px">
                    <div class="col-md-2 hidden-xs hidden-sm clear-both">
                        <p style="margin-top: 26px"></p>
                        <div class="btn-group-vertical limitFlow" style="width: 150px">
                            <button class="btn btn-success">
                                <span class="glyphicon glyphicon-edit"></span>
                                修改信息
                            </button>
                            <button class="btn btn-success" style="margin-top: 2px">
                                <span class="glyphicon glyphicon-lock"></span>
                                修改密码
                            </button>
                            <button class="btn btn-success" style="margin-top: 2px">
                                <span class="glyphicon glyphicon-list-alt"></span>
                                个人档案
                            </button>
                            <a class="btn btn-success" style="margin-top: 2px">
                                <span class="glyphicon glyphicon-cog"></span>
                                高级设置
                            </a>
                        </div>
                        <div class="btn-group-vertical " style="margin-top: 20px;width: 150px">
                            <a href="${pageContext.request.contextPath}/statics/myspace_docInfo.html" class="btn btn-default" style="border-radius: 50px">
                                <span class="glyphicon glyphicon-book"></span>
                                文档知识
                            </a>
                            <a href="${pageContext.request.contextPath}/statics/myspace_resource.html" class="btn btn-default" style="border-radius: 50px;margin-top: 2px">
                                <span class="glyphicon glyphicon-paperclip"></span>
                                资源知识
                            </a>
                            <a href="#" class="btn btn-default" style="border-radius: 50px;margin-top: 2px">
                                <span class="glyphicon glyphicon-globe"></span>
                                网络资源
                            </a>
                            <a href="#" class="btn btn-default" style="border-radius: 50px;margin-top: 2px">
                                <span class="glyphicon glyphicon-star"></span>
                                关注知识
                            </a>
                            <a href="#" class="btn btn-default" style="border-radius: 50px;margin-top: 2px">
                                <span class="glyphicon glyphicon-comment"></span>
                                知识评论
                            </a>
                        </div>
                        <div class="btn-group-vertical " style="margin-top: 20px;width: 150px">
                            <a href="#" class="btn btn-default" style="border-radius: 50px">
                                <span class="glyphicon glyphicon-question-sign"></span>
                                提出的问题
                            </a>
                            <a href="#" class="btn btn-default" style="border-radius: 50px;margin-top: 2px">
                                <span class="glyphicon glyphicon-record"></span>
                                回答的问题
                            </a>
                            <a href="#" class="btn btn-default" style="border-radius: 50px;margin-top: 2px">
                                <span class="glyphicon glyphicon-star"></span>
                                关注的问题
                            </a>
                        </div>
                        <div class="btn-group-vertical " style="margin-top: 20px;width: 150px">
                            <a href="#" class="btn btn-default" style="border-radius: 50px">
                                <span class="glyphicon glyphicon-user"></span>
                                工作小组
                            </a>
                            <a href="#" class="btn btn-default" style="border-radius: 50px;margin-top: 2px">
                                <span class="glyphicon glyphicon-comment"></span>
                                留言板
                            </a>
                            <a href="#" class="btn btn-default" style="border-radius: 50px;margin-top: 2px">
                                <span class="glyphicon glyphicon-star"></span>
                                我的消息
                            </a>
                        </div>
                        <div class="btn-group-vertical " style="margin-top: 20px;width: 150px">
                            <a href="#" class="btn btn-default" style="border-radius: 50px">
                                <span class="glyphicon glyphicon-expand"></span>
                                正在审核知识
                            </a>
                            <a href="#" class="btn btn-default" style="border-radius: 50px;margin-top: 2px">
                                <span class="glyphicon glyphicon-unchecked"></span>
                                历史审核知识
                            </a>
                        </div>
                    </div>
                    <div class="col-md-10 clear-both">
                        <div class="hidden-xs hidden-sm" style="margin-top: 26px">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <p>
                                        <span class="glyphicon glyphicon-stats"></span>
                                        <small>${user.userName}</small>
                                        <small>属于组织机构</small>
                                        <strong style="color: #D6738A">knowAll知识库管理小组</strong>
                                        <small>岗位为</small>
                                        <strong style="color: #D6738A">超级管理员</strong>
                                    </p>
                                    <div class="table-responsive">
                                        <table class="table" style="font-size: 13px">
                                            <tbody>
                                            <tr>
                                                <th rowspan="3">
                                                    <img src="${pageContext.request.contextPath}/statics/img/default.png" alt="waiting" class="img-thumbnail" style="max-width: 80px;max-height: 80px">
                                                </th>
                                                <th>文档数量</th>
                                                <th>好评知识</th>
                                                <th>差评知识</th>
                                                <th>知识好评率</th>
                                                <th>被访问总量</th>
                                                <th>累计好评</th>
                                                <th>累计差评</th>
                                            </tr>
                                            <tr>
                                                <td>${docList.size()}</td>
                                                <td>0</td>
                                                <td>0</td>
                                                <td>
                                                    0%
                                                </td>
                                                <td>2</td>
                                                <td>0</td>
                                                <td>0</td>
                                            </tr>
                                            <tr>
                                                <td colspan="8">
                                                    <small>当前用户于 2017年12月06日 建立账户，于2018年02月05日 发表第一篇文档，于2018年02月05日 发表最后一篇文档
                                                    </small>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-body table-responsive">
                                <div class="showPathList">
                                    <ol>
                                        <li class="itemElement">
                                            <a href="#">
                                                <span>用户名</span>
                                                <img src="${pageContext.request.contextPath}/statics/img/zhixiang.png" alt="waiting">
                                            </a>
                                        </li>
                                        <li class="itemElement">
                                            <a href="#">
                                                <span>文档知识</span>
                                                <img src="${pageContext.request.contextPath}/statics/img/zhixiang.png" alt="waiting">
                                            </a>
                                        </li>
                                    </ol>
                                </div>
                                <div class="list-group">
                                    <div><table class="layui-hide" id="test" lay-data="{width:'700'}"></table></div>
                                    <script type="text/html" id="barDemo">   <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>   <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>   <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a> </script>

                                    <c:forEach items="${docList}" var="i">




                                    </c:forEach>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer">
            <div class="container">
                <div class="row">

                    <div class="copyright">
                        © 版权
                        <a href="#">BigBang 知识库</a>
                        by
                        <a href="#">BigBang小队</a>
                    </div>
                    <div class="nav-footer clearfix hidden-xs">
                        <ul>
                            <li>
                                <a class="#">Features</a>
                            </li>
                            <li>
                                <a href="#">Shortcodes</a>
                            </li>
                            <li>
                                <a href="#">FAQ</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!--回到顶部-->
        <div class="backTop hidden-xs hidden-sm">
            <a>
                <img src="${pageContext.request.contextPath}/statics/img/top_black.png" alt="waiting">
            </a>
        </div>
    </main>
    <div id="search" class="cd-main-search">
        <form>
            <input type="search" placeholder="Search...">

            <div class="cd-select">
                <span>in</span>
                <select name="select-category">
                    <option value="all-categories">all Categories</option>
                    <option value="category1">Category 1</option>
                    <option value="category2">Category 2</option>
                    <option value="category3">Category 3</option>
                </select>
                <span class="selected-value">all Categories</span>
            </div>
        </form>

        <div class="cd-search-suggestions">
            <div class="news">
                <h3>News</h3>
                <ul>
                    <li>
                        <a class="image-wrapper" href="#0"><img src="img/placeholder.png" alt="News image"></a>
                        <h4><a class="cd-nowrap" href="#0">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</a></h4>
                        <time datetime="2016-01-12">Feb 03, 2016</time>
                    </li>

                    <li>
                        <a class="image-wrapper" href="#0"><img src="img/placeholder.png" alt="News image"></a>
                        <h4><a class="cd-nowrap" href="#0">Incidunt voluptatem adipisci voluptates fugit beatae culpa eum, distinctio, assumenda est ad</a></h4>
                        <time datetime="2016-01-12">Jan 28, 2016</time>
                    </li>

                    <li>
                        <a class="image-wrapper" href="#0"><img src="img/placeholder.png" alt="News image"></a>
                        <h4><a class="cd-nowrap" href="#0">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iusto, esse.</a></h4>
                        <time datetime="2016-01-12">Jan 12, 2016</time>
                    </li>
                </ul>
            </div> <!-- .news -->

            <div class="quick-links">
                <h3>Quick Links</h3>
                <ul>
                    <li><a href="#0">Find a store</a></li>
                    <li><a href="#0">Accessories</a></li>
                    <li><a href="#0">Warranty info</a></li>
                    <li><a href="#0">Support</a></li>
                    <li><a href="#0">Contact us</a></li>
                </ul>
            </div> <!-- .quick-links -->
        </div> <!-- .cd-search-suggestions -->

        <a href="#" class="close cd-text-replace">Close Form</a>
    </div> <!-- .cd-main-search -->
</div>
<script>
    layui.use('table', function(){
        var table = layui.table;

        table.render({
            elem: '#test'
            ,url:'${pageContext.request.contextPath}/user/querydocInfo'
            ,page:true
            ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            ,cols: [[
                {field:'title', width:200, title: '标题'}
                ,{field:'btype', width:80, title: '领域', sort: true ,templet: '<div>{{d.btype.name}}</div>'}
                ,{field:'stype', width:80, title: '类别', sort: true,templet: '<div>{{d.stype.name}}</div>'}
                ,{field:'visitnums', width:100, title: '浏览数',sort: true}
                ,{field:'comments', title: '评论数', width: 100, sort: true} //minWidth：局部定义当前单元格的最小宽度，layui 2.2.1 新增
                ,{fixed: 'right', title: '操作', width:378, align:'center', toolbar: '#barDemo'}
                /*{field:'experience', title: '被评论数', sort: true}
                ,{field:'score', title: '被收藏数', sort: true}
                ,{field:'classify', title: '发表日期'
                ,{field:'wealth', width:137, title: '财富', sort: true}*/
            ]]
        });
    });
    table.on('tool(test)', function(obj)
    {
        var data = obj.data;
        if(obj.event === 'detail')
        {       layer.msg('ID：'+ data.id + ' 的查看操作');     }
        else if(obj.event === 'del')
        {       layer.confirm('真的删除行么', function(index){         obj.del();         layer.close(index);       });     }
        else if(obj.event === 'edit')

        {       layer.alert('编辑行：<br>'+ JSON.stringify(data))     }
    });
    var $ = layui.$, active = {
        getCheckData: function(){ //获取选中数据
            var checkStatus = table.checkStatus('idTest')
                ,data = checkStatus.data;
            layer.alert(JSON.stringify(data));
        }
        ,getCheckLength: function(){ //获取选中数目
            var checkStatus = table.checkStatus('idTest')
                ,data = checkStatus.data;
            layer.msg('选中了：'+ data.length + ' 个');
        }
        ,isAll: function(){ //验证是否全选
            var checkStatus = table.checkStatus('idTest');
            layer.msg(checkStatus.isAll ? '全选': '未全选')
        }
    };
    $('.demoTable .layui-btn').on('click', function(){
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });



</script>
</body>
</html>
