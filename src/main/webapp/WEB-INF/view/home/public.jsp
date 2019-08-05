<%@ page language="java" contentType="text/html;charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>知识网络</title>
	<%@include file="../common/h.jsp"%>
	<style type="text/css">
		.am-slider-c3 .am-slider-desc {
			background-color: #0e90d2;
			filter: alpha(opacity = 80); /*IE滤镜，透明度50%*/
			-moz-opacity: 0.8; /*Firefox私有，透明度50%*/
			opacity: 0.8; /*其他，透明度50%*/
		}

		.title-header a .a-black {
			color: #333;
		}
		/*分页区域*/
		.paging {
			width: 100%;
			text-align: center;
			margin: 15px 0;
		}
		.paging .disabled{
			opacity: 1;
			color: #fff;
			background-color: #269abc!important;
			border-color: #1b6d85!important;
			cursor:not-allowed!important;
		}
	</style>
	<script>
        //点击头像显示
        function showDropdownFix() {
            if($('.fix-user-logo-choice').css('display') == 'block'){
                $('.fix-user-logo-choice').fadeOut('fast');
                $('.showDownFix > span').attr('class' , 'glyphicon glyphicon-chevron-up');
            }else {
                $('.fix-user-logo-choice').fadeIn('fast');
                $('.showDownFix > span').attr('class' , 'glyphicon glyphicon-chevron-down');
            }
        }
	</script>
</head>
<body>
<%--<%@include file="../common/header.jsp"%>--%>
<%@include file="../common/head.jsp"%>
<div class="am-cf admin-main" style="padding-top: 0;margin-top: 80px;">
	<!-- sidebar start -->
	<%--<%@include file="../common/slidebar.jsp"%>--%>
	<!-- sidebar end -->
	<!-- content start -->
	<div class="admin-content">
		<div class="admin-content-body">
			<div class="showPath" style="padding-left: 15px">
				<div class="showPathList">
					<ol>
						<li class="itemElement">
							<a href="${pageContext.request.contextPath}/">
								<span>首页</span>
								<img src="${pageContext.request.contextPath}/statics/img/zhixiang.png" alt="waiting">
							</a>
						</li>
						<li class="itemElement">
							<a href="#">
								<span>知识结构</span>
							</a>
						</li>
					</ol>
				</div>
			</div>
			<div class="am-cf am-padding">
				<div class="am-fl am-cf title-header">

				</div>
			</div>
			<div class="am-u-sm-12">
				<div id="my-slider" data-am-widget="slider"
					 class="am-slider  am-slider-c3"
					 data-am-slider='{&quot;animation&quot;:&quot;slide&quot;,&quot;animationLoop&quot;:true,&quot;itemWidth&quot;:150,&quot;itemHeight&quot;:150,&quot;itemMargin&quot;:5}'>
					<ul class="am-slides">
						<c:forEach items="${list}" var="c">
							<li><a href="user/public/${c.classificationId}/1"
								   title="${c.classificationName} : ${c.classificationBrief}"><img
									style="width: 130px; height: 130px;"
									src="/upload/${c.classificationPicture}" class="am-circle"></a>
								<div class="am-slider-desc">${c.classificationName}</div></li>
						</c:forEach>
					</ul>
				</div>
			</div>

			<c:if test="${page.currentPage == 1}">
				<div data-am-widget="intro"
					 class="am-intro am-cf am-intro-default am-u-sm-12">
					<div class="am-g am-intro-bd">
						<div class="am-intro-left am-u-sm-3">
							<img src="/upload/${classi.classificationPicture}" alt="小娜"
								 style="width: 160px; height: 160px;" />
						</div>
						<div class="am-intro-right am-u-sm-9">
							<h1>${classi.classificationName}</h1>
							<p>${classi.classificationBrief}</p>
							<button class="am-icon-btn am-icon-link" onclick="getLinks()"
									title="点击查看此知识点图谱"
									data-am-modal="{target: '#class-links', closeViaDimmer: true, width: 800, height: 500}"></button>
						</div>
					</div>
				</div>
			</c:if>

			<div class="am-u-sm-12">
				<hr>
				<h3>最新收录</h3>
			</div>
			<div class="am-u-sm-12">
				<c:forEach items="${page.docList }" var="f">
					<article>
						<!--需要对文档进行分类显示-->
						<!--根据不同的知识类型选择不同的图标-->
						<c:choose>
							<c:when test="${f.typeId==3}">
								<div class="am-comment-bd">
									<div class="am-g am-intro-bd">
										<div class="am-intro-left am-u-sm-2">
											<img src="${pageContext.request.contextPath}/thumbnail/${f.docFuuid}/png" alt=""
												 class="am-img-thumbnail"
												 style="width: 100px; height: 100px; overflow: hidden">
										</div>
										<div class="am-intro-right am-u-sm-10">
											<h3 class="am-comment-title">
												<a class="a-black" target="_blank"
												   href="${pageContext.request.contextPath}/file/${f.docFuuid}">${f.title}.${f.docFextname}</a>
											</h3>
											<p>简介：${f.summary }</p>
											<a href="#link-to-user" class="am-comment-author">用户:
													${f.user.userName }</a>
											<!-- 作者 -->
											创建于
											<time>
												<fmt:formatDate value="${f.createtime }"
																pattern="yyyy-MM-dd HH:mm:ss" />
											</time>
										</div>

									</div>

								</div>
							</c:when>
							<c:otherwise>
								<!--文档知识-->
								<div class="am-comment-bd">
									<div class="am-g am-intro-bd">
										<div class="am-intro-left am-u-sm-2">
											<!--预览图不为空就显示预览图-->
											<c:if test="${ not empty f.previewurl}">
												<img src="${pageContext.request.contextPath}/upload/${f.previewurl}" alt="null"
													 class="am-img-thumbnail"
													 style="width: 100px; height: 100px; overflow: hidden">
											</c:if>

										</div>
										<div class="am-intro-right am-u-sm-10">
											<h3 class="am-comment-title">
												<a class="a-black" target="_blank"
												   href="${pageContext.request.contextPath}/doc/view/${f.id}">${f.title}
													<span class="glyphicon">
                                                <img src="${pageContext.request.contextPath}/statics/img/document.png" alt="waiting" style="width: 15px; height: 15px; margin-bottom: 7px">
                                            </span>
												</a>
											</h3>
											<p>简介：${f.summary }</p>
											<a href="#link-to-user" class="am-comment-author">用户:
													${f.user.userName }</a>
											<!-- 作者 -->
											创建于
											<time>
												<fmt:formatDate value="${f.createtime }"
																pattern="yyyy-MM-dd HH:mm:ss" />
											</time>
										</div>

									</div>

								</div>
							</c:otherwise>
						</c:choose>
					</article>
				</c:forEach>
			</div>
			<c:if test="${fn:length(page.docList) == 0}">
				<div class="am-u-sm-12">
					<div class="am-alert am-alert-secondary">
						<p>此知识节点下没有资源，欢迎录入</p>
					</div>
				</div>
			</c:if>



			<!--分页-->
			<%--<div class="am-fr">
				<ul class="am-pagination">
					<c:if test="${page.currentPage > 1}">
						<li><a onclick="gotoPage(${page.prePage })">«</a></li>
					</c:if>

					<c:forEach items="${page.navigatepageNums}" var="p">
						<c:if test="${page.pageNum==p}">
							<li class="am-active"><a onclick="gotoPage(${p})">${p}</a></li>
						</c:if>
						<c:if test="${page.pageNum!=p}">
							<li><a onclick="gotoPage(${p})">${p}</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${page.pageNum < page.pages}">
						<li><a onclick="gotoPage(${page.nextPage })">»</a></li>
					</c:if>
				</ul>
			</div>--%>

			<%--<script type="text/javascript">
                var id=${classi.classificationId}
                    function gotoPage(page) {
                        window.location.href = "user/public/"+id+"/"+page;
                    }
			</script>--%>
			<!--计算页面的begin和end,页面的起始位置和最后的位置-->

			<c:choose>
				<c:when test="${page.totalPage<10}">

					<c:set var="begin" value="1"> </c:set>
					<c:set var="end" value="${page.totalPage}"></c:set>
				</c:when>
				<c:otherwise>
					<c:set var="begin" value="1"> </c:set>
					<c:set var="end" value="${page.totalPage}"></c:set>
				</c:otherwise>
			</c:choose>
			<div class="paging">
				<c:forEach var="i" begin="${begin}" end="${end}">
					<%-- <c:out value="${i}"></c:out>
                     <c:out value="${pageListDoc.currentPage}"></c:out>
                     <a  class="btn btn-info" href=""><c:out value="${i}"></c:out></a>--%>
					<c:choose>
						<c:when test="${i == page.currentPage }">

							<span class="disabled"> <a class="btn btn-info disabled" href=""><c:out value="${i}"></c:out></a></span>
						</c:when>
						<c:otherwise>
							<a class="btn btn-info " href="${pageContext.request.contextPath}/user/public/${classi.classificationId}/${i}"><c:out value="${i}"></c:out></a>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<%-- <a  class="btn btn-info">1</a>
                 <button type="submit" class="btn btn-info">2</button>
                 <button type="submit" class="btn btn-info">3</button>--%>
			</div>


		</div>
	</div>
</div>
<%@include file="../common/footer.jsp"%>
<%--回到顶部--%>
<%@include file="../common/rocket.jsp"%>
<%--<%@include file="../common/footer.jsp"%>--%>
<!-- content end -->
<script type="text/javascript" src="resource/script/echarts.min.js"></script>
<div class="am-modal am-modal-no-btn" tabindex="-1" id="class-links">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">
			<h3 class="am-text-left">
				<a title="点击显示全部" href="javascript:nodeId=1;getLinks();">知识图谱</a>
			</h3>
			<a href="javascript: void(0)" class="am-close am-close-spin"
			   data-am-modal-close>&times;</a>
		</div>
		<div class="am-modal-bd" id="class-charts"
			 style="width: 800px; height: 400px;"></div>
	</div>
</div>
</body>
<script type="text/javascript">
    var nodeId = ${classi.classificationId};
    function getLinks(){
        $.get("child-file-class-all/" + nodeId, function(res) {
            //查找到所有的父节点
            var getData = {
                data : [],
                links : []
            };
            var s = res.data;
            getData.data.push({
                name : s[0].classificationName,
                x : 6,
                y : 0,
                value: s[0].classificationId
            });
            var re = [];
            for (var i = 0; i < s.length; i++) {
                re.push({
                    parentId : s[i].parentId,
                    classificationId : s[i].classificationId,
                    classificationName : (s[i].classificationName)
                })
            }

            var denlen=new Array();;
            var fn = {
                getclass : function(nid, name, depth,index) {
                    //console.log("relen:" + re.length+" nid:"+nid)
                    if (re.length == 1) {
                        return;
                    }
                    if(denlen[depth] == null){
                        denlen[depth] = 0;
                    }

                    for (var i = 0; i < re.length; i++) {
                        if (re[i].parentId == nid) {
                            denlen[depth] = denlen[depth]+2;
                            //console.log(denlen[depth]+' '+re[i].classificationName)
                            var di = {
                                name : re[i].classificationName,
                                x : denlen[depth],
                                y : depth * 3,
                                value:re[i].classificationId
                            }
                            var li = {
                                source : name,
                                target : re[i].classificationName
                            }

                            getData.data.push(di);
                            getData.links.push(li);
                            //console.log(re[i].parentId+" "+re[i].classificationId)
                            fn.getclass(re[i].classificationId, re[i].classificationName, depth+1,0)
                        }

                    }
                }
            }
            fn.getclass(s[0].classificationId, s[0].classificationName, 1,0)


            var option = {
                title : {
                },
                tooltip : {},
                animationDurationUpdate : 1500,
                animationEasingUpdate : 'quinticInOut',
                series : [
                    {
                        type : 'graph',
                        layout : 'none',
                        symbolSize : 60,
                        roam : true,
                        label : {
                            normal : {
                                show : true
                            }
                        },
                        edgeSymbol : [ 'circle', 'arrow' ],
                        edgeSymbolSize : [ 4, 10 ],
                        edgeLabel : {
                            normal : {
                                textStyle : {
                                    fontSize : 20
                                }
                            }
                        },
                        data : getData.data,
                        links : getData.links,
                        lineStyle : {
                            normal : {
                                opacity : 0.9,
                                width : 2,
                                curveness : 0
                            }
                        }
                    }
                ]
            };
            var myChart = echarts.init(document.getElementById('class-charts'));
            myChart.setOption(option);
            myChart.on('click', function (params) {
                window.location.href="user/public/"+params.value+"/1"
            });
        })
    }
</script>
</html>