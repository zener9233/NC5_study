<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath }/header.jsp"></jsp:include>
	<div style="display: flex; flex-direction: column; justify-content: center; align-items: center;">
		<h3>새 글 등록</h3>
		<form id="insertForm" action="/board/insertBoard.do" method="post" enctype="multipart/form-data">
			<table border="1" style="border-collapse: collapse">
				<tr>
					<td style="background: skyblue; width: 70px;">
						제목
					</td>
					<td style="text-align: left;">
						<input type="text" name="boardTitle">
					</td>
				</tr>
				<tr>
					<td style="background: skyblue;">
						작성자
					</td>
					<td style="text-align: left;">
						<input type="text" name="boardWriter" value="${loginUser.userId }" readonly>
					</td>
				</tr>
				<tr>
					<td style="background: skyblue; width: 70px;">
						내용
					</td>
					<td style="text-align: left;">
						<textarea name="boardContent" cols="40" rows="10"></textarea>
					</td>
				</tr>
				<tr>
					<td style="background: skyblue; width: 70px;">
						파일첨부
					</td>
					<td>
						<div id="image_preview">
							<input type="file" id="btnAtt" 
							name="uploadFiles" multiple>
							<div id="attZone"
								data-placeholder="파일을 첨부하려면 파일선택 버튼을 누르세요.">
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit">새 글 등록</button>
					</td>
				</tr>
			</table>
		</form>
		<hr/>
		<a href="#">글 목록</a>
	</div>
	<jsp:include page="${pageContext.request.contextPath }/footer.jsp"></jsp:include>
	<script>
		//추가된 파일들을 담아줄 배열. File 객체들이 하나씩 저장.
		const uploadFiles = [];
	
		$(function() {
			//input type="file"이 변경되면 미리보기 동작
			$("#btnAtt").on("change", (e) => { 
				//input에 추가된 파일들 변수로 받기
				const files = e.target.files;
				
				//변수로 받아온 파일들 배열로 변환
				const fileArr = Array.prototype.slice.call(files);
				
				//파일 배열에 담긴 파일들 하나씩 꺼내서 미리보기 처리
				for(f of fileArr) {
					//미리보기 메소드 호출
					imageLoader(f);
				}
			});
			
			$("#insertForm").on("submit", () => {
				//폼 서브밋 전에 마지막으로 uploadFiles에 있는 파일들을 
				//input type="file"에 담아준다.
				dt = new DataTransfer();
				
				for(f in uploadFiles) {
					const file = uploadFiles[f];
					
					dt.items.add(file);
				}
				
				$("#btnAtt").files = dt.files;
			});
		});
		
		//미리보기 메소드
		//미리보기 영역에 들어갈 img 태그 생성 및 선택된 파일을 
		//Base 64 인코딩된 문자열 형태로 변환하여 미리보기 구현
		const imageLoader = (file) => {
			//첨부파일 배열에 추가
			uploadFiles.push(file);
			
			let reader = new FileReader();
			
			reader.onload = (e) => {
				//이미지 표출할 img 태그 생성
				let img = document.createElement("img");
				img.setAttribute("style", "width: 100%; height: 100%; z-index: none;");
				
				//이미지 파일인지 아닌지 체크
				if(file.name.toLowerCase().match(/(.*?)\.(jpg|jpeg|png|gif|svg|bmp)$/)) {
					img.src = e.target.result;
				} else {
					img.src = 'images/defaultFileImg.png';
				}
				
				//미리보기 영역에 추가
				//미리보기 이미지 태그와 삭제 버튼 그리고 파일명을 표출하는 p태그
				//묶어주는 div를 만들어서 미리보기 영역에 추가
				$("#attZone").append(makeDiv(img, file));
			}
			
			//파일을 BASE 64 인코딩 문자열로 변경
			reader.readAsDataURL(file);
		}
	
		//미리보기 영역에 들어갈 div 생성하는 메소드
		const makeDiv = (img, file) => {
			//div 태그 생성
			let div = document.createElement("div");
			
			div.setAttribute("style", "display: inline-block;" 
			+ " position: relative;"
			+ " width: 150px; height: 120px;" 
			+ " margin: 5px; border: 1px solid #00f; z-index: 1");
			
			//잘못 올렸을 경우 삭제할 수 있는 버튼 생성
			let btn = document.createElement("input");
			btn.setAttribute("type", "button");
			btn.setAttribute("value", "x");
			btn.setAttribute("delFile", file.name);
			btn.setAttribute("style", "width: 30px; height: 30px;"
			+ " position: absolute; right: 0px; bottom: 0px;"
			+ " z-index: 999; background-color: rgba(255, 255, 255, 0.1);"
			+ " color: #f00;");
			
			//버튼 이벤트 생성
			//버튼 클릭하면 해당 파일삭제 기능 구현
			btn.onclick = (e) => {
				//클릭된 버튼
				const ele = e.srcElement;
				
				const delFile = ele.getAttribute("delFile");
				
				for(let i = 0; i < uploadFiles.length; i++) {
					//배열에 담겨있는 파일중 파일명이 같은 파일 삭제
					if(delFile === uploadFiles[i].name) {
						//배열에서 i번째 하나 제거
						uploadFiles.splice(i, 1);
					}
				}
				
				//버튼 클릭 시 btnAtt 인풋에서도 첨부된 파일 삭제
				//input type="file"은 첨부된 파일을 fileList의 형태로 관리
				//fileList에는 일반적인 File 객체를 넣을 수 없다.
				//DataTransfer라는 클래스를 이용해서 완전한 fileList 형태로 만들어서
				//input.files에 넣어줘야 한다.
				
				dt = new DataTransfer();
				
				for(f in uploadFiles) {
					const file = uploadFiles[f];
					dt.items.add(file);
				}
				
				$("#btnAtt")[0].files = dt.files;
				
				//해당 img 태그를 담고 있는 div 삭제
				const parentDiv = ele.parentNode;
				$(parentDiv).remove();
			}
			
			//파일명 표출할 p태그 생성
			const fName = document.createElement("p");
			fName.setAttribute("style", "display: inline-block; font-size: 8px;");
			fName.textContent = file.name;
			
			//div에 하나씩 추가
			div.appendChild(img);
			div.appendChild(btn);
			div.appendChild(fName);
			
			//완성된 div 리턴
			return div;
		}	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	</script>
</body>
</html>