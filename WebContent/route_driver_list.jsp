<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<!-- font awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.checked {
	color: orange;
}
.glyphicon-star{
  
  cursor: pointer;
}
.glyphicon-star.on{
	color:orange;
}
</style>
</head>

<body>
	<%@ include file="form/header.jsp"%>

	<div class="container">
		<br>
		<h1 align="center">운전자정보 조회리스트</h1>
		<br>
		<hr>

		<ul class="list-group">
			<c:choose>
				<c:when test="${empty driverList }">
					<li class="list-group-item">-------선택 지역에 해당하는 운전자가 존재하지
						않습니다-------</li>
				</c:when>
				<c:otherwise>
					<c:forEach var="dto" items="${driverList }">
						<c:choose>
							<c:when test="${dto.d_region == scheduleDto.s_location}">
								<li class="list-group-item" style="margin: 0 20%">
									<div class="container" style="max-height: 150px; width: 100%">
										<div class="row">
											<div class="col-xs-4">
												<img src="${dto.d_profile }"
													style="border-radius: 100%; width: 150px; height: 150px" />
											</div>
											<div class="col-xs-4" style="margin-top: 0px;">
												<div style="margin-bottom: 5px">
													<h3>
														<strong>${dto.d_name }</strong>
													</h3>
												</div>
												<div style="margin-bottom: 5px">
													<b>성별 </b><span>${dto.d_gender }</span>
												</div>
												<div style="margin-bottom: 5px">
													<b>나이 </b><span>${dto.d_birth }</span>
												</div>

												<div style="margin-bottom: 5px">
													<b>지역 </b> <span>${dto.d_region }</span>
												</div>
											</div>

											<div class="col-xs-4" style="margin-top: 18px;">
												<c:choose>
													<c:when test="${dto.ra_rating != 0 }">
														<c:forEach begin="1" end="${dto.ra_rating }" step="1">
															<span class="glyphicon glyphicon-star on"></span>
														</c:forEach>
														<c:forEach begin="${dto.ra_rating +1}" end="5" step="1">
															<span class="glyphicon glyphicon-star"></span>
														</c:forEach>
													</c:when>
													<c:otherwise>
														<span class="glyphicon glyphicon-star"></span>
														<span class="glyphicon glyphicon-star"></span>
														<span class="glyphicon glyphicon-star"></span>
														<span class="glyphicon glyphicon-star"></span>
														<span class="glyphicon glyphicon-star"></span>
													</c:otherwise>
												</c:choose>

												<div>
													<!-- <label class="checkbox-inline"> -->
													<input type="button" value="선택"
														style="margin: 40% 0 0 20%;" class="btn btn-default"
														id="${dto.d_no }" onclick="selectDriver(this)">
													<!-- </label> -->
												</div>
											</div>
										</div>
									</div>
								</li>
							</c:when>
						</c:choose>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</ul>
		<br>
		<hr>
	</div>

	<script>
		function selectDriver(chk) {
			location.href = "ScheduleController?command=payment&id="
					+ $(chk).attr("id");
		};
	</script>

	<%@ include file="form/footer.jsp"%>

</body>
</html>





















