<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <div class="line"></div>
    <div class="background-img">
	    <div class="image-container">
	        <img src="${pageContext.request.contextPath}/w/images/image1.jpg" alt="Image 1" />
	        <img src="${pageContext.request.contextPath}/w/images/image2.jpg" alt="Image 2" />
	        <img src="${pageContext.request.contextPath}/w/images/image3.jpg" alt="Image 3" />
	    </div>
	
	    <div class="navigation">
	        <button onclick="prevImage()"><</button>
	        <button onclick="nextImage()">></button>
	    </div>
	</div>
	<div class="line"></div>
	
	<script>
        var images = document.querySelectorAll('.image-container img');
        var currentIndex = 0;
        var maxVisibleImages = images.length;

        function shiftImages(direction) {
            if (direction === 'left') {
                var lastImage = images[images.length - 1].src;
                for (var i = images.length - 1; i > 0; i--) {
                    images[i].src = images[i - 1].src;
                }
                images[0].src = lastImage;
            } else if (direction === 'right') {
                var firstImage = images[0].src;
                for (var i = 0; i < images.length - 1; i++) {
                    images[i].src = images[i + 1].src;
                }
                images[images.length - 1].src = firstImage;
            }

            updateVisibility();
        }

        function updateVisibility() {
            for (var i = 0; i < images.length; i++) {
                if (i < currentIndex || i >= currentIndex + maxVisibleImages) {
                    images[i].style.display = 'none';
                } else {
                    images[i].style.display = 'block';
                }
                
                if (i === currentIndex + Math.floor(maxVisibleImages / 2)) {
                    images[i].style.opacity = 1;
                } else {
                	images[i].style.opacity = 0.5;
                }
            }
        }

        function prevImage() {
            shiftImages('left');
        }

        function nextImage() {
            shiftImages('right');
        }

        function showNextImage() {
            shiftImages('right');
            setTimeout(showNextImage, 5000);
        }

        window.onload = function () {
            showNextImage();
        };
    </script>