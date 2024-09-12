<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 샘플 게시판 </title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

<link type="text/css" rel="stylesheet" href="<c:url value='/resources/css/board/list.css'/>"/>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/paginate.js"></script>

<c:url var="listUrl" value="/board/list">
	<c:if test="${not empty kwd}">
		<c:param name="schType" value="${schType}"/>
		<c:param name="kwd" value="${kwd}"/>
	</c:if>
</c:url>
<script type="text/javascript">
window.addEventListener("load", function(){
	let page = ${page};
	let pageSize = ${size};
	let dataCount = ${dataCount};
	let url = "${listUrl}";

	let total_page = pageCount(dataCount, pageSize);
	let paging = pagingUrl(page, total_page, url);

	document.querySelector(".dataCount").innerHTML = dataCount + "개 (" + page + "/" + total_page + " 페이지)";
	document.querySelector(".page-navigation").innerHTML = dataCount == 0 ? "등록된 게시물이 없습니다." : paging;
}, false);

function searchList() {
	const f = document.searchForm;
	f.submit();
}
</script>
</head>
<body>

<div class="body-container">
	<div class="body-title">
	    <h3><span>|</span> 게시판</h3>
	</div>

	<table class="table">
		<tr>
			<td width="50%"><span class="dataCount"></span></td>
			<td align="right">&nbsp;</td>
		</tr>
	</table>
	
	<table class="table table-border table-list">
		<thead>
			<tr>
				<th class="num">번호</th>
				<th class="subject">제목</th>
				<th class="name">작성자</th>
				<th class="date">작성일</th>
				<th class="hit">조회수</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="dto" items="${list}" varStatus="status">
				<tr>
					<td>${dataCount - (page-1) * size - status.index}</td>
					<td>
			      		<c:url var="url" value="/bbs/article">
			      			<c:param name="num" value="${dto.num}"/>
			      			<c:param name="page" value="${page}"/>
			      			<c:if test="${not empty kwd}">
				      			<c:param name="schType" value="${schType}"/>
				      			<c:param name="kwd" value="${kwd}"/>
			      			</c:if>
			      		</c:url>
						<a href="${url}">${dto.subject}</a>					
					</td>
					<td>${dto.name}</td>
					<td>${dto.reg_date}</td>
					<td>${dto.hitCount}</td>
				</tr>
			</c:forEach>
		</tbody>
		
	</table>
	
	<div class="page-navigation"></div>
	
	<table class="table">
		<tr>
			<td width="100">
				<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/list';">새로고침</button>
			</td>
			<td align="center">
				<form name="searchForm" action="${pageContext.request.contextPath}/list" method="post">
					<select name="schType" class="form-select" title="검색항목">
						<option value="all" ${schType=="all"?"selected":""}>제목+내용</option>
						<option value="name" ${schType=="name"?"selected":""}>작성자</option>
						<option value="reg_date" ${schType=="reg_date"?"selected":""}>등록일</option>
						<option value="subject" ${schType=="subject"?"selected":""}>제목</option>
						<option value="content" ${schType=="content"?"selected":""}>내용</option>
					</select>
					<input type="text" name="kwd" value="${kwd}" class="form-control" title="검색키워드">
					<button type="button" class="btn" onclick="searchList()">검색</button>
				</form>
			</td>
			<td align="right" width="100">
				<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/write';">글올리기</button>
			</td>
		</tr>
	</table>	
</div>

</body>
</html>