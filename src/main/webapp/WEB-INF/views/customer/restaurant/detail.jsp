<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<main>
<h2 class="main title">점심 디테일 페이지</h2>

<div class="">
	<h3 class="hidden">가게 내용</h3>
	<table class="">
		<tbody>
			<tr>
				<th>가게 이름 (${r.countCmt})</th>
				<td>${r.name}</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${r.regDate}" />
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${r.writerName}</td>
				<td>${r.writerImage}</td>
				<th>평점</th>
				<td>${r.avgPoint}</td>
				<th>좋아요</th>
				<td>${r.countLiked}</td>
			</tr>
			<tr>
				<th>종류</th>
				<td>${r.genre}</td>
				<th>걸어가는 시간</th>
				<td>${r.time}</td>
				<th>상세내용</th>
				<td>${r.content}</td>
			</tr>
		</tbody>
	</table>
</div>

<div>
	<h4 class="hidden">후기 내용</h4>
	<table class="">
		<tbody>
			<c:if test="${empty cmtList}">
				<tr>
					<td colspan="3" class=""><a href="../comment/${r.id}">첫번째
							후기를 작성해 주세요!</a></td>
				</tr>
			</c:if>
			<c:if test="${not empty cmtList}">
				<tr>
					<td>생생한 후기들! (${cmtp})</td>
				</tr>
				<tr>
					<td>번호</td>
					<td>내용</td>
					<td>작성자</td>
					<td>사진</td>
				</tr>
				
				<c:forEach var="c" items="${cmtList}">
				<tr class="comment">
					<td>${c.id}</td>
					<td class="">${c.content}</td>
					<td>${c.writerName}</td>
					<td id="cmt-image">
						<table id="menu-images">
							
						</table>
					</td>
				</tr>
				</c:forEach>
				
				<tr>
					<td><a href="../comment/${r.id}">후기작성!</a></td>
				</tr>
			</c:if>
		</tbody>
	</table>
</div>

<div class="margin-top text-align-center">
	<a class="btn btn-list" href="../restaurant">목록</a>
</div>

<div class="">
	<table class="">
		<tbody>
			<c:if test="${empty next}">
				<tr>
					<th>다음글</th>
					<td colspan="3" class="">다음글이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty next}">
				<tr>
					<th>다음글</th>
					<td colspan="3" class=""><a class="" href="${next.id}">${next.name}</a></td>
				</tr>
			</c:if>
			<c:if test="${empty prev}">
				<tr>
					<th>이전글</th>
					<td colspan="3" class="">이전글이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty prev}">
				<tr>
					<th>이전글</th>
					<td colspan="3" class=""><a class="" href="${prev.id}">${prev.name}</a></td>
				</tr>
			</c:if>
		</tbody>
	</table>
</div>
</main>

<script type="text/javascript">
	$(function(){
		var id = $(".comment td:first-child");
		for(var i=0; i<id.length; i++){
			//alert(id.eq(i).text());
			//alert(k);
			 $.ajax({
				type:"POST",
				url:"../../customer/restaurant-menu-ajax?${_csrf.parameterName}=${_csrf.token}",
				data: {"id":id.eq(i).text()},
				async: false,
				dataType:"json", 
				success:function(data){
					//console.log(data);
					//var json = JSON.stringify(data);
					//alert(json);
					var content ="";
					for(var j=0; j<data.length; j++){
						//alert("id: " + data[i].id + ", commentId: " + data[i].commentId);
						content += 
			                "<tr>"+
			                    "<td>"+data[j].id+"</td>"+
			                    "<td><a href=restaurant/"+data[j].id+">"+data[j].src+"</a></td>"+
			                    "<td>"+data[j].commentId+"</td>"+
			                    "<td>"+data[j].memberId+"</td>"+
			                "</tr>";
						
					}
					var text = id.eq(i).text();
<<<<<<< HEAD
					//alert(text);
=======
>>>>>>> refs/remotes/origin/master
					$("#menu-images").attr('id', 'menu-images'+text).append(content);
				}, error:function(request,status,error){
		            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		           }
			});
			//alert(i);
		}
		
	});
</script>


