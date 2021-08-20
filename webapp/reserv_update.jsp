<%@page import="hotel_reserv.DAO.ReservDAO"%>
<%@page import="hotel_reserv.DTO.ReservDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%	
    	//form action으로 넘어온 값들
    	//예약번호로 특정 레코드값을 수정할 것이므로 reserv_up에서 예약번호 값을 넘겨줘야 한다.
    	//예약번호 값을 넘겨주는 매개체는 <input type="hidden"> 이 작업이 없을 시 null로, 에러 발생
    	String reserv_num = request.getParameter("reserv_num");
    	int reserv_num2 = Integer.parseInt(reserv_num);
    	//변경한 예약정보 값
		String room_sort = request.getParameter("room_sort");
    	String check_in = request.getParameter("check_in");
    	String check_out = request.getParameter("check_out");
    	String reserv_count = request.getParameter("reserv_count");
    	int reserv_count2 = Integer.parseInt(reserv_count);
    	String reserv_price = request.getParameter("reserv_price"); //00000원
    	//"금액(숫자)+원"인 값에서 숫자만 추출
    	String reserv_price2 = reserv_price.substring(0, reserv_price.length() - 1);
    	int reserv_price3 = Integer.parseInt(reserv_price2);
		//예약번호를 조건으로 update메서드를 사용할 것이므로, 예약번호 값을 dto에 싣는다.
		ReservDTO dto = new ReservDTO();
		dto.setReserv_num(reserv_num2);
		dto.setRoom_sort(room_sort);
		dto.setCheck_in(check_in);
		dto.setCheck_out(check_out);
		dto.setReserv_count(reserv_count2);
		dto.setReserv_price(reserv_price3);
		//예약번호와 변경된 입력값을 담은 dto를 update메서드에 전송
		ReservDAO dao = new ReservDAO();
		int result = dao.update(dto);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JEJU Hotel Booking_mytrip</title>
<script type="text/javascript">
	<%
		if(result != 0){ %>
			alert('예약정보 수정을 성공했습니다.')
			location.href="reserv_list.jsp"
		<%}else{%>
			alert('예약정보 실패했습니다. 다시 시도해주세요.')
		<%}
	%>
</script>
</head>
<body>
</body>
</html>