<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 페이지 | ITSO</title>


<!-- d3js -->
<script src="https://d3js.org/d3.v3.min.js"></script>

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


<!-- Bootstrap core CSS -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Material Design Bootstrap -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.4/css/mdb.min.css"
	rel="stylesheet">

<!-- JQuery 원래 밑에 있었음-->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>





<style>
.chart div {
  font: 10px sans-serif;
  background-color: steelblue;
  text-align: right;
  padding:5px;
  margin: 1px;
  color: white;
}


#dashboard {
  width: 320px;
  border: 1px solid black;
}

p {
  text-align: center;
}</style>
</head>
<body>

	<!-- navi -->
	<%@include file="navi.jsp"%>


<div id="dashboard">
	<p>Earnings</p>
	<div class="chart">

	</div>
</div>



	<script>
	var data = [30, 86, 168, 281, 303, 565];

	var scale = d3.scale.linear()
	  .domain([0, 565])
	  .range([0, 300])

	d3.select(".chart")
	  .selectAll("div")
	  .data(data)
	    .enter()
	    .append("div")
	    .style("width", function(d) { return scale(d) + 'px' })
	    .text(function(d) { return d + ' 명'; });
	</script>
	
		<!-- Bootstrap tooltips -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.13.0/umd/popper.min.js"></script>
	<!-- Bootstrap core JavaScript -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<!-- MDB core JavaScript -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.4/js/mdb.min.js"></script>
	
	
</body>
</html>