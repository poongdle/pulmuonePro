<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/views/layouts/head.jsp" %>



<body>
	<div class="wrapper">
		<%@ include file="/WEB-INF/views/layouts/header.jsp" %>
		<div class="breadcrumb-style">
			<div class="container">
				<ul>
				      <li><a href="/">홈</a></li>
				      <li><a href="/mypage">MY녹즙</a></li>
				      <li><a class="" href="/mypage/drink/drink">매일배송 음용내역</a></li>
				      <li><a class="active" href="/mypage/drink/drink">음용내역</a></li>
			   </ul>
			</div>
		</div>
		<div class="container aside-layout main" style="padding-bottom:100px; ">
			<%@ include file="/WEB-INF/views/layouts/mypage/aside.jsp" %>
				
			<div class="container">
		      <div class="border-wrapper">
		        <h2 class="container-title">
		          환불계좌 등록
		        </h2>
		      </div>
		      <form id="accountForm">
		      <div style="width:640px;">
		        <div class="input-group">
		          <div class="form-input select">
		            <dl>
		              <dt style="padding-left:20px;">
		                <label for="input01">은행명</label>
		              </dt>
		              <dd>
		                <div class="dropdown">
		                  <a class="btn dropdown-toggle" id="bankCode" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
		                    은행명을 선택하세요
		                  </a>
		                  <div style="max-height: 200px;overflow-y: scroll" class="dropdown-menu">
       		                  <a class="dropdown-item" data-value="88">신한(통합)은행</a>
		                      <a class="dropdown-item" data-value="DD">유진투자증권</a>
		                      <a class="dropdown-item" data-value="45">새마을금고</a>
		                      <a class="dropdown-item" data-value="89">케이뱅크</a>
		                      <a class="dropdown-item" data-value="DE">메리츠증권</a>
		                      <a class="dropdown-item" data-value="02">한국산업은행</a>
		                      <a class="dropdown-item" data-value="DF">신영증권</a>
		                      <a class="dropdown-item" data-value="03">기업은행</a>
		                      <a class="dropdown-item" data-value="DG">대우증권</a>
		                      <a class="dropdown-item" data-value="04">국민은행</a>
		                      <a class="dropdown-item" data-value="48">신용협동조합중앙회</a>
		                      <a class="dropdown-item" data-value="DH">삼성증권</a>
		                      <a class="dropdown-item" data-value="05">하나은행 (구 외환)</a>
		                      <a class="dropdown-item" data-value="DI">교보증권</a>
		                      <a class="dropdown-item" data-value="06">국민은행 (구 주택)</a>
		                      <a class="dropdown-item" data-value="DJ">키움증권</a>
		                      <a class="dropdown-item" data-value="07">수협중앙회</a>
		                      <a class="dropdown-item" data-value="DK">이트레이드</a>
		                      <a class="dropdown-item" data-value="DL">솔로몬증권</a>
		                      <a class="dropdown-item" data-value="DM">한화증권</a>
		                      <a class="dropdown-item" data-value="DN">NH증권</a>
		                      <a class="dropdown-item" data-value="DO">부국증권</a>
		                      <a class="dropdown-item" data-value="DP">LIG증권</a>
		                      <a class="dropdown-item" data-value="90">카카오뱅크</a>
		                      <a class="dropdown-item" data-value="91">네이버포인트</a>
		                      <a class="dropdown-item" data-value="92">토스뱅크</a>
		                      <a class="dropdown-item" data-value="93">토스머니</a>
		                      <a class="dropdown-item" data-value="50">상호저축은행</a>
		                      <a class="dropdown-item" data-value="94">SSG머니</a>
		                      <a class="dropdown-item" data-value="96">엘포인트</a>
		                      <a class="dropdown-item" data-value="53">한국씨티은행</a>
		                      <a class="dropdown-item" data-value="97">카카오머니</a>
		                      <a class="dropdown-item" data-value="54">홍콩상하이은행</a>
		                      <a class="dropdown-item" data-value="98">페이코포인트</a>
		                      <a class="dropdown-item" data-value="11">농협중앙회</a>
		                      <a class="dropdown-item" data-value="55">도이치은행</a>
		                      <a class="dropdown-item" data-value="12">단위농협</a>
		                      <a class="dropdown-item" data-value="56">ABN암로</a>
		                      <a class="dropdown-item" data-value="57">JP모건</a>
		                      <a class="dropdown-item" data-value="59">미쓰비시도쿄은행</a>
		                      <a class="dropdown-item" data-value="16">축협중앙회</a>
		                      <a class="dropdown-item" data-value="60">BOA(Bank of America)</a>
		                      <a class="dropdown-item" data-value="20">우리은행</a>
		                      <a class="dropdown-item" data-value="64">산림조합</a>
		                      <a class="dropdown-item" data-value="21">구)조흥은행</a>
		                      <a class="dropdown-item" data-value="22">상업은행</a>
		                      <a class="dropdown-item" data-value="23">SC제일은행</a>
		                      <a class="dropdown-item" data-value="24">한일은행</a>
		                      <a class="dropdown-item" data-value="25">서울은행</a>
		                      <a class="dropdown-item" data-value="26">구)신한은행</a>
		                      <a class="dropdown-item" data-value="27">한국씨티은행 (구 한미)</a>
		                      <a class="dropdown-item" data-value="BW">뱅크월렛</a>
		                      <a class="dropdown-item" data-value="70">신안상호저축은행</a>
		                      <a class="dropdown-item" data-value="71">우체국</a>
		                      <a class="dropdown-item" data-value="31">대구은행</a>
		                      <a class="dropdown-item" data-value="32">부산은행</a>
		                      <a class="dropdown-item" data-value="34">광주은행</a>
		                      <a class="dropdown-item" data-value="35">제주은행</a>
		                      <a class="dropdown-item" data-value="37">전북은행</a>
		                      <a class="dropdown-item" data-value="38">강원은행</a>
		                      <a class="dropdown-item" data-value="39">경남은행</a>
		                      <a class="dropdown-item" data-value="D1">유안타증권</a>
		                      <a class="dropdown-item" data-value="D2">현대증권</a>
		                      <a class="dropdown-item" data-value="D3">미래에셋증권</a>
		                      <a class="dropdown-item" data-value="D4">한국투자증권</a>
		                      <a class="dropdown-item" data-value="D5">우리투자증권</a>
		                      <a class="dropdown-item" data-value="D6">하이투자증권</a>
		                      <a class="dropdown-item" data-value="D7">HMC투자증권</a>
		                      <a class="dropdown-item" data-value="D8">SK증권</a>
		                      <a class="dropdown-item" data-value="D9">대신증권</a>
		                      <a class="dropdown-item" data-value="81">하나은행</a>
		                      <a class="dropdown-item" data-value="83">평화은행</a>
		                      <a class="dropdown-item" data-value="41">비씨카드</a>
		                      <a class="dropdown-item" data-value="DA">하나대투증권</a>
		                      <a class="dropdown-item" data-value="DB">굿모닝신한증권</a>
		                      <a class="dropdown-item" data-value="87">신세계</a>
		                      <a class="dropdown-item" data-value="DC">동부증권</a>
		                  </div>
		                </div>
		              </dd>
		            </dl>
		          </div>
		          <div class="form-input">
		            <dl>
		              <dt style="padding-left:20px;">
		                <label for="accountHolder">예금주</label>
		              </dt>
		              <dd>
		                <input type="text" value="<%= request.getParameter("acctOwner") %>" name="accountHolder" id="accountHolder">
		              </dd>
		            </dl>
		          </div>
		          <div class="form-input">
		            <dl>
		              <dt style="padding-left:20px;">
		                <label for="bankAccount">계좌번호</label>
		              </dt>
		              <dd>
<!-- 		              	<input type="hidden" value="${ acctNum }"> -->
<%-- 		              	<input type="hidden" value="<%= request.getParameter("acctNum") %>"> --%>
		                <input value="<%= request.getParameter("acctNum") %>" class="numberOnly" type="number" name="bankAccount" id="bankAccount">
		                <button type="button" id="verify" class="btn-square btn-black">계좌인증</button>
		              </dd>
		            </dl>
		          </div>
		
		        </div>
		        <div style="margin-top:61px;">
		          <label class="check-type" style="margin-bottom:19px;">
		            <input type="checkbox" name="agree">
		            <span>성명, 은행명,계좌번호를 환불 목적으로수집, 5년간 처리에 동의</span>
		          </label>
		        </div>
		        <div class="alert-area lg between" style="padding-top:38px;">
		          <h4 style="margin-bottom:17px;">주의사항</h4>
		          <ul>
		            <li>
		              무통장입금 또는 핸드폰결제 후 주문 취소 시 등록하신 무통장 계좌로 환불해드립니다. (단, 본인 명의의 계좌만 가능)
		            </li>
		            <li>
		              환불대기중 상품은 등록하신 환불계좌로 환불됩니다.
		            </li>
		          </ul>
		        </div>
		        <div class="btn-area-right" style="margin-top:20px;">
		          <button type="button" style="padding:0; width:140px;" id="cancel" class="btn-default btn-white">취소</button>
		          <button type="button" style="padding:0; width:140px;" id="register" class="btn-default btn-default">등록</button>
		        </div>
		      </div>
		      </form>
    		</div>
					
			</div> <!-- container aside-layout main -->

		<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>

 	</div> <!-- wrapper -->
<script>
	$(function () {
	    $("div.item p").each(function(index) {
	        if ($(this).text() != 0) {
	            $("div.item:eq(" + index + ")").parent("li").addClass("active");
	        } // if
	    });
	})
</script>

<script type="text/javascript">
  $().ready(function () {

    //region dropdown
    $('.dropdown-item').click(function () {
      const select = $('#bankCode')
      select.text($(this).text())
      select.data('value', $(this).data('value'))
      $('#verify').prop('v', false);
      $('#verify').text('계좌인증')
      $('#verify').prop('disabled', false)
    })

    
//     $('.dropdown-item[data-value=11]').click();
    $('.dropdown-item[data-value=<%= request.getParameter("insttCode") %>]').click();
    

    
    //endregion

    //region cancel
    $('#cancel').click(function () {

      confirmDesign("", "작업한 내용이 사라집니다. 취소 하시겠습니까?",function(){
        location.href = '/mypage/personal/refund.do'
      })

      // if (confirm('작업한 내용이 사라집니다. 취소 하시겠습니까?')) {
      //   location.href = '/mypage/personal/address'
      // }
    })
    //endregion

    //region form

    function checkForm() {
      const accountForm = $('#accountForm').serializeObject();
      accountForm.bankCode = $('#bankCode').data('value')

      if (!accountForm.bankCode) {
        alert('은행명을 선택하세요')
        $('#bankCode').click();
        return false;
      }

      if (!accountForm.accountHolder.trim()) {
        alert('예금주를 입력해주세요')
        $('#accountHolder').focus()
        return false;
      }
      if (!accountForm.bankAccount.trim()) {
        alert('계좌번호를 입력해주세요')
        $('#bankAccount').focus()
        return false;
      }
      return accountForm;
    }

    $('#register').click(function () {
      const data = checkForm();

      if (data) {
        if (!$('#verify').prop('v')) return alert('계좌인증을 진행해주세요')
        if ($('input[name=agree]:checked').length === 0) {
          return alert('개인정보 수집 이용약관에 동의해주세요')
        }
        if ("1601") {
          post({url: '/mypage/personal/refund/1601', param: $.param(data)},
                  function (r) {
                    if (r.RESULT_MSG) {
                      alert('환불계좌가 정상적으로 수정되었습니다.',
                              () => location.href = '/mypage/personal/refund')
                    } else {
                      return alert('잘못된 요청입니다.')
                    }
                  })
        } else {
          post({url: '/mypage/personal/refund', param: $.param(data)}, function (r) {
            if (r.RESULT_MSG) {
              alert('환불계좌가 정상적으로 등록되었습니다.', () => location.href = '/mypage/personal/refund')
            } else {
              return alert('잘못된 요청입니다.')
            }
          })
        }
      }
    })

    $('input[type=text]').on('change , keyup', function () {
      $('#verify').prop('v', false);
      $('#verify').text('계좌인증')
      $('#verify').prop('disabled', false)
    })
    //  endregion

    //  region verify
    $('#verify').click(function () {
      var el = $(this)
      if (!el.prop('v')) {
        const data = checkForm();
        if (data) {
          post({url: '/mypage/personal/refund/verify', param: $.param(data)}, function (r) {
            if (r.RESULT_MSG) {
              el.text('인증완료')
              el.prop('disabled', true)
              el.prop('v', true);
            } else {
              alert('계좌인증에 실패하였습니다. 다시 시도해주세요.')
            }
          })
        }
      }
    })

    //  endregion
  });

</script>


<script>
	$("#verify").on("click", function() {
		var el = $(this);
		alert("인증되었습니다. (임시)");		
        
		el.text('인증완료')
        el.prop('disabled', true)
        el.prop('v', true);
	});


</script>

<div class="modal fade" id="alertModal" tabindex="-1" aria-labelledby="alertModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="alertModalLabel"></h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				</button>
			</div>
			<div class="modal-body">
			</div>
			<button type="button" class="modal-footer" data-dismiss="modal">확인</button>
		</div>
	</div>
</div>


<div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="confirmModalLabel"></h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				</button>
			</div>
			<div class="modal-body">
			</div>
			<div class="modal-footer">
				<button type="button" class="cancel" data-dismiss="modal">취소</button>
				<button type="button" class="confirm">확인</button>
			</div>
		</div>
	</div>
</div>





</body>
</html>
