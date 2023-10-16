<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>수강신청</title>

    <!-- 결제 api -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 플러그인 연결-->
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
    <style>
        .hero {
            height: 50px;
            margin-top: 40px;
        }

    </style>
</head>
<body>
<!-- 헤더 부분 인클루드 -->
<jsp:include page="../include/header.jsp"></jsp:include>
<%--<section class="hero is-medium is-white">--%>
<%--    <div class="hero-body has-text-centered">--%>
<%--    </div>--%>
<%--</section>--%>

<div class="content" id="content">
    <div class="row column text-center" style="margin: 0 auto; width: 700px">
        <div class="container" style="text-align: center">
            <h2 style="margin-top: 10px">수강 신청</h2>
        </div>
        <form action="${path}/lecture/lectureEnroll.do" method="post"  onsubmit="return payCheck(this)">
        <table class="table is-bordered is-striped is-narrow is-hoverable">
        <tr>
                <th>강의</th>
                <td>${lecture.title}</td>
            </tr>
            <tr>
                <th>선생님</th>
                <td>${lecture.teachername}</td>
            </tr>
            <tr>
                <th>가격</th>
                <td>${lecture.price}</td>
            </tr>
            <tr>
                <th>현재 수강인원</th>
                <td>${lecture.cnt}/${lecture.max_cnt}</td>
            </tr>

        </table>



        <div class="container" style="text-align: center">
            <h2 style="margin-top: 10px">결제</h2>
        </div>
        <table class="tb1">
            <tbody>
            <tr>
                <th class="item1">결제 수단</th>
                <td class="item2" colspan="2">
                    <select name="pmethod" id="pmethod" class="indata">
                        <option value="신용카드">신용카드</option>
                        <option value="체크카드">체크카드</option>
                        <option value="계좌이체">계좌이체</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>결제사</th>
                <td colspan="2">
                    <select name="pcom" id="pcom" class="indata">
                        <option value="선택안함">선택안함</option>
                    </select>
                    <input type="hidden" name="pcom2" id="pcom2" value="">
                </td>
            </tr>
            <tr>
                <th>결제 번호</th>
                <td colspan="2">
                    <input type="text" name="cnum" id="cnum" class="indata" required>
                    <input type="hidden" name="payAmount" id="payAmount">
                    <input type="hidden" name="payCk" id="payCk" value="no">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="button" id="pay" value="결제" class="inbtn">
                    <c:if test="${!empty sid }">
                        <input type="hidden" name="lectureno" value="${lecture.no}">
                        <input type="submit" class="inbtn" value="구매">
                    </c:if>
                    <p id="paymentResult" style="color:red; font-size: 20px;"></p>
                </td>
            </tr>
            </tbody>
        </table>
        </form>


        <script>
            $(document).ready(function(){
                var cardArr1 = ["현대카드","농협카드","BC카드","KB카드"];
                var cardArr2 = ["하나카드","농협카드","BC카드"];
                var bankArr = ["카카오뱅크","농협은행","신한은행","기업은행","국민은행"];
                $("#pmethod").change(function(){
                    var th = $(this).val();
                    if(th==="신용카드"){
                        for(var i=0;i<cardArr1.length;i++) {
                            $("#pcom").append("<option value='" + cardArr1[i] + "'>" + cardArr1[i] + "</option>");
                        }
                    } else if(th==="체크카드"){
                        for(var i=0;i<cardArr2.length;i++) {
                            $("#pcom").append("<option value='"+cardArr2[i]+"'>"+cardArr2[i]+"</option>");
                        }
                    } else {
                        for(var i=0;i<bankArr.length;i++) {
                            $("#pcom").append("<option value='"+bankArr[i]+"'>"+bankArr[i]+"</option>");
                        }
                    }
                }).change();
                $("#pcom").change(function(){
                    $("#pcom2").val($(this).val());
                });
            });
        </script>

        <script>
            //결제모듈 API 연동
            $(document).ready(function(){
                var totalPay=0;
                var proName;
                $("#pay").click(function(){
                    // var email = $("#email").val();
                    var cname = '${member.name}';
                    // var tel = $("#tel").val();
                    // var addr = $("#addr").val();
                    // var postcode = $("#postcode").val();
                    proName = '${lecture.title}';
                    // if($("#amount").val()!="") {
                        totalPay = parseInt(${lecture.price});
                    // } else {
                    //     alert("구매할 수량을 입력하지 않으셨습니다.");
                    //     $("#amount").focus();
                    //     return;
                    // }
                    alert("결제할 금액 : "+totalPay);
                    //상품명_현재시간
                    var d = new Date();
                    var date = d.getFullYear()+''+(d.getMonth()+1)+''+d.getDate()+''+d.getHours()+''+d.getMinutes()+''+d.getSeconds();
                    var IMP = window.IMP; // 생략가능
                    IMP.init('imp80577312'); // 결제 API를 사용하기 위한 코드 입력!
                    IMP.request_pay({		//결제 요청
                        pg: "T5102001",
                        merchant_uid : '상품명_' + date, //상점 거래 ID
                        name : proName,				// 결제 명
                        amount : totalPay,					// 결제금액
                        // buyer_email : email, // 구매자 email
                        buyer_name : cname,				// 구매자 이름
                        // buyer_tel : tel,		// 구매자 전화번호
                        // buyer_addr : addr,		// 구매자 주소
                        // buyer_postcode : postcode			// 구매자 우편번호
                    }, function(rsp){
                        if(rsp.success){
                            console.log(rsp);
                            var msg = '결제가 완료 되었습니다.';
                            var r1 = '고유 아이디 : ' +rsp.imp_uid;
                            var r2 = '상점 거래 아이디 : ' +rsp.merchant_uid;
                            var r3 = '결제 금액 : ' +rsp.paid_amount;
                            var r4 = '카드 승인 번호 : '+rsp.apply_num;

                            // 실제 결제 창
                            // $("#payCk").val("yes");
                            // $("#payAmount").val(rsp.paid_amount);
                            // $("#pmethod").val(rsp.pay_method);
                            // $("#pcom").val(rsp.pg_provider);
                            // $("#cnum").val(rsp.apply_num);
                            // alert(msg);
                            // $("#paymentResult").html(r1+"<br>"+r2+"<br>"+r3+"<br>"+r4);
                        } else{
                            //$("#paymentResult").html('결제실패<br>'+'에러내용 : ' +rsp.error_msg);
                        }
                        //테스트용이므로 실패시에도 그냥 통과시킴
                        $("#payCk").val("yes");
                        $("#payAmount").val(totalPay);
                        // $("#pmethod").val("신용카드");
                        // $("#pcom").val("삼성카드");
                        // $("#cnum").val("123-1234-1234-1278");
                        $("#paymentResult").text("결제 완료 : "+totalPay);
                    });
                });
            });
        </script>
        <script>
            function payCheck(f){
                var payCk = f.payCk.value;
                console.log(payCk);
                if(payCk!="yes"){
                    alert("아직 결제 전 입니다.");
                    return false;
                }
            }

            //구매 가능한지 확인하고 처리
            <%--function checkEnroll(no, ${sid }) {--%>
            <%--    $.ajax({--%>
            <%--        url: "${path1}/lecture/checkEnroll.do",--%>
            <%--        method: "POST",--%>
            <%--        data: {--%>
            <%--            boardNo: boardNo,--%>
            <%--            sid: ${sid }--%>
            <%--        },--%>
            <%--        dataType: "json",--%>
            <%--        success: function(result) {--%>
            <%--            var likeButton = $("[data-board-id='" + boardNo + "']");--%>
            <%--            console.log(result.result);--%>
            <%--            var chk = result.result;--%>

            <%--           --%>
            <%--        }--%>
            <%--    });--%>
            <%--}--%>



        </script>







    </div>
</div>
<footer id="footer" class="footer-nav row expanded collapse">
    <!-- 푸터 부분 인클루드 -->
    <jsp:include page="../include/footer.jsp"></jsp:include>
</footer>
</body>
</html>