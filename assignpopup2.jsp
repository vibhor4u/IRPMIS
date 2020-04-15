<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<link rel="stylesheet" media="screen, print" href="${pageContext.request.contextPath}/smartadmin/css/vendors.bundle.css">
<link rel="stylesheet" media="screen, print" href="${pageContext.request.contextPath}/smartadmin/css/app.bundle.css">
<link rel="stylesheet" media="screen, print" href="${pageContext.request.contextPath}/css/custom.css">
<link rel="stylesheet" media="screen, print" href="${pageContext.request.contextPath}/smartadmin/css/datagrid/datatables/datatables.bundle.css">

<!-- Modal center Large -->
<div class="modal fade" id="default-example-modal-lg-center" role="dialog" aria-hidden="true" tabindex="-1">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					<span class="h6 font-weight-bold text-uppercase">Assign to User</span>
				</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true"><i class="fal fa-times"></i></span>
				</button>
			</div>
			<div class="modal-body">

				<div class="form-row">
					<div class="col-md-12 mb-3">
						<label class="form-label" for="simpleinput">Name of Work</label> <input type="text" class="form-control" id="address" rows="2" name="address" placeholder="Name of Work"
							required maxlength="200" value="">
					</div>
				</div>
				
				<div class="form-row">
					<div class="col-md-12 mb-3">
						<label class="form-label" for="simpleinput">Name of Section</label> <input type="text" class="form-control" id="address" rows="2" name="address" placeholder="Name of Section"
							required maxlength="200" value="">
					</div>
				</div>

				<div class="row">
					<div class="col-xl-12">
						<%-- <h4>
							Timeline for Proposal :
							<c:out value="${param.applnid}" />
						</h4> --%>
						<div id="panel-4" class="panel panel-locked" data-panel-sortable="" data-panel-collapsed="" data-panel-close="">
							<div class="panel-container show">
								<div class="panel-content">

									<table id="dt-basic-example2" class="table table-bordered table-hover table-striped w-100">
										<thead class="bg-warning-200">
											<tr>
												<th rowspan="2">Sr. No.</th>
												<th rowspan="2">Sub Section Name</th>
												<th colspan="2">From</th>
												<th colspan="2">To</th>
												<th rowspan="2">Assign to User</th>
												<th rowspan="2">Coordinating Deputy</th>
											</tr>
											<tr style="border: 1px solid;">
												<th>Km</th>
												<th>met.</th>
												<th>Km</th>
												<th>met.</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>1.</td>
												<td><input type="text" id="tpfrom" class="form-control" placeholder="" name="tpfrom" required maxlength="15"></td>
												<td><input type="text" id="tpfrom" class="form-control" placeholder="" name="tpfrom" required maxlength="15"></td>
												<td><input type="text" id="tpfrom" class="form-control" placeholder="" name="tpfrom" required maxlength="15"></td>
												<td><input type="text" id="tpfrom" class="form-control" placeholder="" name="tpfrom" required maxlength="15"></td>
												<td><input type="text" id="tpfrom" class="form-control" placeholder="" name="tpfrom" required maxlength="15"></td>
												<td><select class="select2 form-control" name="divcode" id="divcode" required data-parsley-trigger="blur" data-parsley-errors-container="#select-errors4"
													data-parsley-required-message="You must select one option.">
														<option selected value="">-[Select One]-</option>
														<option value="caonr">Dy.CE1/NR</option>
														<option value="caocr">Dy.CE2/NR</option>
												</select></td>
												<td><input type="checkbox" class="custom-control custom-checkbox" id="tpfrom" placeholder="" name="tpfrom" required></td>
											</tr>
											<!-- <button type="button" class="btn btn-labeled btn-primary" id="add" onclick="">Add Row</button> -->
											<tr>
												<td colspan="7" align="right">
													<div>
														<button type="button" class="btn btn-primary btn-xs btn-icon rounded-circle waves-effect waves-themed" onclick="circularSelection();">
															<i class="fal fa-plus"></i>
														</button>
														Add Row
													</div>
												</td>
											</tr>
									</table>

								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary"
					onclick="SaveNocSigning();" id="saveButton">Save</button>
			</div>
		</div>
	</div>
</div>
<script src="${pageContext.request.contextPath}/smartadmin/js/vendors.bundle.js"></script>
<script src="${pageContext.request.contextPath}/smartadmin/js/app.bundle.js"></script>
<script src="${pageContext.request.contextPath}/smartadmin/js/datagrid/datatables/datatables.bundle.js"></script>

<script>

$(document).ready(function() {

	$('#default-example-modal-lg-center').on('shown.bs.modal', function() {
        //Get the datatable which has previously been initialized
         //var dataTable= $('#dt-basic-example').DataTable();
         //recalculate the dimensions
         //dataTable.columns.adjust().responsive.recalc();

     });
	
});


function showHideFields(type) {

	$('#carrier_pipe').val('');
	$('#casing_pipe').val('');
	$('#railway_land_length').val('');
	$('#number_of_lanes').val('');
	$('#size').val('');
	$('#other_crossing_type').val('');
	/* var purposeValue = $('#purposeWayLeave').val(); */
	if(type == 1){
		$("#dt-basic-example1").removeClass('d-none');
		$("#dt-basic-example2").addClass('d-none');
	}
	else{
		$("#dt-basic-example2").removeClass('d-none');
		$("#dt-basic-example1").addClass('d-none');
	}
}	

</script>

