<%@page import="hotel_reserv.DAO.ReservDAO"%>
<%@page import="hotel_reserv.DTO.ReservDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
	//a태그로 받아온 예약번호 값으로 등록된 예약 내역 지우기
	String reserv_num = request.getParameter("reserv_num");
    	int reserv_num2 = Integer.parseInt(reserv_num);
    	//취소하고 싶은 글의 예약번호 값을 dto에 싣는다.
	ReservDTO dto = new ReservDTO();
    	dto.setReserv_num(reserv_num2);
    	//delete메서드에 dto를 입력값으로 전송
    	ReservDAO dao = new ReservDAO();
    	int result = dao.delete(dto);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JEJU Hotel Booking_mytrip</title>
<script type="text/javascript">
<%
	if(result != 0){ %>
		alert('예약이 취소되었습니다.')
		location.href="reserv_list.jsp"
	<%}else{%>
		alert('예약 취소를 실패했습니다. 다시 시도해주세요.')
	<%}
%>
</script>
</head>
<body>
</body>
</html>
