<jsp:include page='<%=(String) request.getAttribute("includeHeader")%>' />
<style>
.resize {
width: 60%;
}
.resize-body {
width: 80%;
}


</style>

<div class="container">

<!-- Panel -->
<div class="panel panel-default resize center-block">
<!-- Default panel contents -->
<div class="panel-heading text-center"><h1>Appointment Type Manager</h1></div>
<div class="panel-body resize-body center-block">
	
				<form action="appointments" method="post" name="cancel">
					<input type=hidden name=cancel_button id="cancel_button"> 
					<input type=hidden name=edit_button id="edit_button">
					
						<table class="table table-striped custab">
							<thead>
								<tr>
									<th><font style="color: #0" size="4">Appointment Type</font></th>
									<th><font style="color: #0" size="4">Duration</font></th>
								</tr>
							</thead>
							<%@ page import="uta.mav.appoint.beans.AppointmentType"%>
							<% ArrayList<AppointmentType> ats = (ArrayList<AppointmentType>)session.getAttribute("appointmenttypes");%>
							<%@ page import="java.util.ArrayList"%>
							<%@ page import="uta.mav.appoint.beans.Appointment"%>
							<!-- begin processing appointments  -->
							<%if (ats != null){%>
							<%for (int i=0;i<ats.size();i++){ %>
							<tr>
								<td><font style="color: #0" size="3"><%=ats.get(i).getType()%></font></td>
								<td><font style="color: #0" size="3"><%=ats.get(i).getDuration()%></font></td>
							</tr>
							<%	}
			    			}
			    			%>
							<!-- end processing advisors -->
						</table>
				</form>
		
			
		</div>
		<div class="panel-footer text-center">
		      	<input type="submit" class="btn-lg" value="Add Appointment Type" href="#" data-toggle="modal" data-target="#addApptType">
		     </div>

		<form action="add_app_type" method="post" onsubmit="return false;">
			<div class="modal fade" id="addApptType" tabindex="-1">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"></button>
							<h4 class="modal-title" id="addApptTypeLabel">Add Appointment Type</h4>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label for="apptypes">Appointment Type:</label> <input
									type="text" class="form-control" id="apptypes"
									placeholder="">
							</div>
							<div class="form-group">
								<label for="minutes">Minutes</label> <input type="number"
									class="form-control" id="minutes" step="5" placeholder="">
							</div>
							<div>
								<label id="result"><font style="color: #0" size="4"></font></label>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">
								Close</button>
							<input type="submit" value="submit"
								onclick="javascript:FormSubmit();">
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>

<script> function FormSubmit(){
									var apptype = document.getElementById("apptypes").value;
									var minutes = document.getElementById("minutes").value;
									var params = ('minutes='+minutes+'&apptypes='+apptype);
									var xmlhttp;
									xmlhttp = new XMLHttpRequest();
									xmlhttp.onreadystatechange=function(){
										if (xmlhttp.readyState==4){
											document.getElementById("result").innerHTML = xmlhttp.responseText;	
										}
									}
									xmlhttp.open("POST","add_app_type",true);
									xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
									xmlhttp.setRequestHeader("Content-length",params.length);
									xmlhttp.setRequestHeader("Connection","close");
									xmlhttp.send(params);
									document.getElementById("result").innerHTML = "Adding appointment type...";
								}
								</script>

<%@include file="templates/footer.jsp"%>