<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
html, body {
	height: 100%;
}

#sidefooter {
	width: 100%;
	height: 100px;
	bottom: 0px;
	border-top: 2px solid black;
	text-align: center;
}

#sidefooter p {
	font-style: oblique;
}

#sidefooter p a {
	font-style: oblique;
	color: black;
}

.footer-brand {
	width: 70px;
}

/* floating button */
#floating-button{
  width: 55px;
  height: 55px;
  border-radius: 50%;
  background: #fa2a4c;
  position: fixed;
  bottom: 30px;
  right: 30px;
  cursor: pointer;
  box-shadow: 0px 2px 5px #666;
}

.plus{
  color: white;
  position: absolute;
  top: 0;
  display: block;
  bottom: 0;
  left: 0;
  right: 0;
  text-align: center;
  padding: 0;
  margin: 0;
  line-height: 55px;
  font-size: 38px;
  font-weight: 300;
  animation: plus-out 0.3s;
  transition: all 0.3s;
}

#container-floating{
  position: fixed;
  width: 70px;
  height: 70px;
  bottom: 30px;
  right: 30px;
  z-index: 50px;
}

#container-floating:hover{
  height: 400px;
  width: 90px;
  padding: 30px;
}

#container-floating:hover .plus{
  animation: plus-in 0.15s linear;
  animation-fill-mode: forwards;
}

.edit{
  position: absolute;
  top: 0;
  display: block;
  bottom: 0;
  left: 0;
  display: block;
  right: 0;
  padding: 0;
  opacity: 0;
  margin: auto;
  line-height: 65px;
  transform: rotateZ(-70deg);
  transition: all 0.3s;
  animation: edit-out 0.3s;
}

#container-floating:hover .edit{
  animation: edit-in 0.2s;
   animation-delay: 0.1s;
  animation-fill-mode: forwards;
}

@keyframes edit-in{
    from {opacity: 0; transform: rotateZ(-70deg);}
    to {opacity: 1; transform: rotateZ(0deg);}
}

@keyframes edit-out{
    from {opacity: 1; transform: rotateZ(0deg);}
    to {opacity: 0; transform: rotateZ(-70deg);}
}

@keyframes plus-in{
    from {opacity: 1; transform: rotateZ(0deg);}
    to {opacity: 0; transform: rotateZ(180deg);}
}

@keyframes plus-out{
    from {opacity: 0; transform: rotateZ(180deg);}
    to {opacity: 1; transform: rotateZ(0deg);}
}

.nds{
  width: 40px;
  height: 40px;
  border-radius: 50%;
  position: fixed;
  z-index: 300;
  transform:  scale(0);
  cursor: pointer;
}

.nd1{
  background: #fae101;
  right: 40px;
  bottom: 120px;
  animation-delay: 0.2s;
    animation: bounce-out-nds 0.3s linear;
  animation-fill-mode:  forwards;
}

.nd3{
  background: #0385dd;
  right: 40px;
  bottom: 180px;
  animation-delay: 0.15s;
    animation: bounce-out-nds 0.15s linear;
  animation-fill-mode:  forwards;
}

.nd4{
  background: #be76bf;
  right: 40px;
  bottom: 240px;
  animation-delay: 0.1s;
    animation: bounce-out-nds 0.1s linear;
  animation-fill-mode:  forwards;
}

@keyframes bounce-nds{
    from {opacity: 0;}
    to {opacity: 1; transform: scale(1);}
}

@keyframes bounce-out-nds{
    from {opacity: 1; transform: scale(1);}
    to {opacity: 0; transform: scale(0);}
}

#container-floating:hover .nds{
  animation: bounce-nds 0.1s linear;
  animation-fill-mode:  forwards;
}

#container-floating:hover .nd3{
  animation-delay: 0.08s;
}

#container-floating:hover .nd4{
  animation-delay: 0.15s;
}

.letter{
  font-size: 23px;
  font-family: 'Roboto';
  color: white;
  position: absolute;
  left: 0;
  right: 0;
  margin: 0;
  top: 0;
  bottom: 0;
  text-align: center;
  line-height: 40px;
}

.reminder{
  position: absolute;
  left: 0;
  right: 0;
  margin: auto;
  top: 0;
  bottom: 0;
  line-height: 40px;
}

#container-floating a {
	color: white;
}
</style>

<!-- floating button -->
<div id="container-floating">
	<div class="nd4 nds" data-toggle="tooltip" data-placement="left"
		title="스타일링 글쓰기">
		<img class="reminder">
		<p class="letter">
			<a href="voteStyling.go">S</a>
		</p>
	</div>
	<div class="nd3 nds" data-toggle="tooltip" data-placement="left"
		title="팁 글쓰기">
		<img class="reminder">
		<p class="letter">
			<a href="tipInsertPage.go">T</a>
		</p>
	</div>
	<div class="nd1 nds" data-toggle="tooltip" data-placement="left"
		title="피드 글쓰기">
		<img class="reminder">
		<p class="letter">
			<a href="writeSocial.go">F</a>
		</p>
	</div>

	<div id="floating-button" data-toggle="tooltip" data-placement="left"
		title="Create">
		<p class="plus">+</p>
		<img class="edit"
			src="https://ssl.gstatic.com/bt/C3341AA7A1A076756462EE2E5CD71C11/1x/bt_compose2_1x.png">
	</div>
</div>

<div id="sidefooter">

	<p>
		<a class="footer-brand" href="#"><img id="logo" alt=""
			src="resources/images/logo_black.png"></a>©2018 ItSo. All rights
		reserved.
	</p>
	<p>
		<a href="#">language</a>· <a href="#">help</a>· <a href="#">widgets</a>·
		<a href="#">advertise</a>· <a href="#">legal</a>
	</p>
</div>


<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
