<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<h3 style="font-size: 15px; padding-top: 10px;"><i class="fa-solid fa-angles-right"></i> 자주하는 질문등록</h3>
<table class="table td-border mx-auto my-10" style="width: 99%;">
	<tr>
			<td class="wp-15 text-center bg-light">제목</td>
			<td class="ps-5">
				${dto.subject}
			</td>
		</tr>
		<tr>
			<td class="pe-7 text-center bg-light">내용</td>
			<td class="ps-5">
				${dto.content}
							
			</td>
		</tr>
	
	
	
</table>