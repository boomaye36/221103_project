<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="contents-box">
<div class="d-flex justify-content-center">
	<div class="d-flex justify-content-center">
	<h3>${userName}님 오늘도 근성장 <span class="text-info">${Ddays}일</span> </h3>
	<a href="#" class="myBtn ml-5" data-toggle="modal" data-target="#modal" ><img src="https://www.iconninja.com/files/860/824/939/more-icon.png" width="50"></a>
	</div>
</div>
</div>


<!-- Modal -->
<div class="modal fade" id="modal">
	<%-- modal-dialog-centered 모달창을 가운데정렬, modal-sm 작은 모달창 --%>
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
			<%-- 모달 창 안에 내용 넣기 --%>
			<div class="text-center">
				<div class="my-3 border-bottom">
					<a class="m-3 modaltext" href="/gym/gym_view" id="healthBtn" data-category-id="1">이용중인 서비스 </a><br>
					<a class="m-3 modaltext" href="/gym/gym_view" id="pilatesBtn" data-category-id="3">관심 체육관  </a><br>
					<a class="m-3 modaltext" href="/gym/gym_view" id="crossfitBtn" data-category-id="4">관심 트레이너 </a><br>
					<a class="m-3 modaltext" href="/user/sign_out"  >로그아웃 </a>
				</div>
				<div class="py-3">
					<%-- data-dismiss="modal" 모달창 닫힘 --%>
					<a class="m-3 modaltext"href="#" data-dismiss="modal">취소</a>
				</div>

			</div>
		</div>
	</div>
</div>
<script>
	
	
</script>