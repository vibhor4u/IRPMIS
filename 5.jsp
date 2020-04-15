<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8">
<title>IRPMIS</title>
<meta name="description" content="Marketing Dashboard">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no, minimal-ui">
<!-- Call App Mode on ios devices -->
<meta name="apple-mobile-web-app-capable" content="yes" />
<!-- Remove Tap Highlight on Windows Phone IE -->
<meta name="msapplication-tap-highlight" content="no">
<!-- base css -->
<link rel="stylesheet" media="screen, print" href="${pageContext.request.contextPath}/smartadmin/css/vendors.bundle.css">
<link rel="stylesheet" media="screen, print" href="${pageContext.request.contextPath}/smartadmin/css/app.bundle.css">
<!-- Place favicon.ico in the root directory -->
<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/smartadmin/img/favicon/apple-touch-icon.png">
<link rel="icon" type="${pageContext.request.contextPath}/smartadmin/image/png" sizes="32x32" href="${pageContext.request.contextPath}/smartadmin/img/favicon/favicon-32x32.png">
<link rel="mask-icon" href="${pageContext.request.contextPath}/smartadmin/img/favicon/safari-pinned-tab.svg">
<link rel="stylesheet" media="screen, print" href="${pageContext.request.contextPath}/smartadmin/css/formplugins/bootstrap-daterangepicker/bootstrap-daterangepicker.css">
<link rel="stylesheet" media="screen, print" href="${pageContext.request.contextPath}/smartadmin/css/notifications/sweetalert2/sweetalert2.bundle.css">
<link rel="stylesheet" media="screen, print" href="${pageContext.request.contextPath}/smartadmin/css/formplugins/select2/select2.bundle.css">

</head>
<body class="mod-bg-1 ">
	<!-- DOC: script to save and load page settings -->
	<script>
		/**
		 *	This script should be placed right after the body tag for fast execution 
		 *	Note: the script is written in pure javascript and does not depend on thirdparty library
		 **/
		'use strict';

		var classHolder = document.getElementsByTagName("BODY")[0],
		/** 
		 * Load from localstorage
		 **/
		themeSettings = (localStorage.getItem('themeSettings')) ? JSON.parse(localStorage.getItem('themeSettings')) : {}, themeURL = themeSettings.themeURL || '', themeOptions = themeSettings.themeOptions
				|| '';
		/** 
		 * Load theme options
		 **/
		if (themeSettings.themeOptions) {
			classHolder.className = themeSettings.themeOptions;
			// console.log("%c✔ Theme settings loaded", "color: #148f32");
		} else {
			console.log("Heads up! Theme settings is empty or does not exist, loading default settings...");
		}
		if (themeSettings.themeURL && !document.getElementById('mytheme')) {
			var cssfile = document.createElement('link');
			cssfile.id = 'mytheme';
			cssfile.rel = 'stylesheet';
			cssfile.href = themeURL;
			document.getElementsByTagName('head')[0].appendChild(cssfile);
		}
		/** 
		 * Save to localstorage 
		 **/
		var saveSettings = function() {
			themeSettings.themeOptions = String(classHolder.className).split(/[^\w-]+/).filter(function(item) {
				return /^(nav|header|mod|display)-/i.test(item);
			}).join(' ');
			if (document.getElementById('mytheme')) {
				themeSettings.themeURL = document.getElementById('mytheme').getAttribute("href");
			}
			;
			localStorage.setItem('themeSettings', JSON.stringify(themeSettings));
		}
		/** 
		 * Reset settings
		 **/
		var resetSettings = function() {
			localStorage.setItem("themeSettings", "");
		}
	</script>


	<!-- BEGIN Page Wrapper -->
	<div class="page-wrapper">

		<main id="js-page-content" role="main" class="page-content">
		<div class="form-row">
			<div class="col-md-3 mb-3">
				<label class="form-label">Railway <span class="text-danger">*</span></label> <select class="select2 form-control" name="rlycode" id="rlycode" onchange="getDivision(this);"
					required data-parsley-trigger="blur" data-parsley-errors-container="#select-errors1" data-parsley-required-message="You must select one option.">
					<option selected value="">-[Select One]-</option>
				</select>
				<div id="select-errors1"></div>
			</div>
			<div class="col-md-3 mb-3">
				<label class="form-label">Planhead<span class="text-danger">*</span></label> <select class="select2 form-control" name="divcode" id="divcode" required
					data-parsley-trigger="blur" onchange="submitForm();" data-parsley-errors-container="#select-errors2" data-parsley-required-message="You must select one option.">
					<option selected value="">-[Select One]-</option>
				</select>
				<div id="select-errors2"></div>
			</div>

			<div class="col-2 col-md-2 col-xl-2">
				<br>
				<div class="p-2 p-md-2">
					<button type="submit" class="btn btn-labeled btn-primary" id ="go" onclick="getData(event);">Go</button>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div id="panel-4" class="panel panel-locked" data-panel-sortable="" data-panel-collapsed="" data-panel-close="">
					<div class="panel-hdr">
						<h2>Category assignment by ED/Works </h2>
					</div>

					<div class="panel-container show">
						<div class="panel-content">
							<table id="dt-basic-example" class="table table-bordered table-hover table-striped w-100">
								<thead class="bg-warning-200">
									<tr>
										<th>Sr. No.</th>
										<th>Railway</th>
										<th>Planhead</th>
										<th>Name of Work</th>
										<th>Sanction Year</th>
										<th>Category</th>
										<!-- <th>Land Provided by State free of Cost</th> -->
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1.</td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td>
											<select class="select2 form-control" name="category" id="category" required data-parsley-trigger="blur" data-parsley-errors-container="#select-errors4"
													data-parsley-required-message="You must select one option.">
														<option selected value="">-[Select One]-</option>
														<option value="1">Critical</option>
														<option value="2">Super Critical</option>
														<option value="3">Other than Critical</option>
														<option value="4">Others</option>
												</select>
										</td>
										<!-- <td><select class="select2 form-control" name="category" id="category" required data-parsley-trigger="blur" data-parsley-errors-container="#select-errors4"
													data-parsley-required-message="You must select one option.">
														<option selected value="">-[Select One]-</option>
														<option value="1">Yes</option>
														<option value="2">No</option>
												</select></td> -->
									</tr>
							</table>
							<!-- datatable end -->
						</div>
					</div>
				</div>
			</div>
		</div>



		</main>

		<!-- this overlay is activated only when mobile menu is triggered -->
		<div class="page-content-overlay" data-action="toggle" data-class="mobile-nav-on"></div>
		<!-- END Page Content -->

		<!-- BEGIN Color profile -->
		<!-- this area is hidden and will not be seen on screens or screen readers -->
		<!-- we use this only for CSS color refernce for JS stuff -->
		<p id="js-color-profile" class="d-none">
			<span class="color-primary-50"></span> <span class="color-primary-100"></span> <span class="color-primary-200"></span> <span class="color-primary-300"></span> <span
				class="color-primary-400"></span> <span class="color-primary-500"></span> <span class="color-primary-600"></span> <span class="color-primary-700"></span> <span
				class="color-primary-800"></span> <span class="color-primary-900"></span> <span class="color-info-50"></span> <span class="color-info-100"></span> <span class="color-info-200"></span>
			<span class="color-info-300"></span> <span class="color-info-400"></span> <span class="color-info-500"></span> <span class="color-info-600"></span> <span class="color-info-700"></span>
			<span class="color-info-800"></span> <span class="color-info-900"></span> <span class="color-danger-50"></span> <span class="color-danger-100"></span> <span
				class="color-danger-200"></span> <span class="color-danger-300"></span> <span class="color-danger-400"></span> <span class="color-danger-500"></span> <span
				class="color-danger-600"></span> <span class="color-danger-700"></span> <span class="color-danger-800"></span> <span class="color-danger-900"></span> <span
				class="color-warning-50"></span> <span class="color-warning-100"></span> <span class="color-warning-200"></span> <span class="color-warning-300"></span> <span
				class="color-warning-400"></span> <span class="color-warning-500"></span> <span class="color-warning-600"></span> <span class="color-warning-700"></span> <span
				class="color-warning-800"></span> <span class="color-warning-900"></span> <span class="color-success-50"></span> <span class="color-success-100"></span> <span
				class="color-success-200"></span> <span class="color-success-300"></span> <span class="color-success-400"></span> <span class="color-success-500"></span> <span
				class="color-success-600"></span> <span class="color-success-700"></span> <span class="color-success-800"></span> <span class="color-success-900"></span> <span
				class="color-fusion-50"></span> <span class="color-fusion-100"></span> <span class="color-fusion-200"></span> <span class="color-fusion-300"></span> <span
				class="color-fusion-400"></span> <span class="color-fusion-500"></span> <span class="color-fusion-600"></span> <span class="color-fusion-700"></span> <span
				class="color-fusion-800"></span> <span class="color-fusion-900"></span>
		</p>
		<!-- END Color profile -->
	</div>

	<!-- END Page Wrapper -->

	<!-- BEGIN Quick Menu -->
	<!-- END Quick Menu -->

	<!-- BEGIN Page Settings -->
	<!-- END Page Settings -->

	<!-- Container for loading pages using bootstrap modal  -->
	<div id="modalContainer"></div>

	<!-- base vendor bundle: 
			 DOC: if you remove pace.js from core please note on Internet Explorer some CSS animations may execute before a page is fully loaded, resulting 'jump' animations 
						+ pace.js (recommended)
						+ jquery.js (core)
						+ jquery-ui-cust.js (core)
						+ popper.js (core)
						+ bootstrap.js (core)
						+ slimscroll.js (extension)
						+ app.navigation.js (core)
						+ ba-throttle-debounce.js (core)
						+ waves.js (extension)
						+ smartpanels.js (extension)
						+ src/../jquery-snippets.js (core) -->

	<script src="${pageContext.request.contextPath}/smartadmin/js/vendors.bundle.js"></script>
	<script src="${pageContext.request.contextPath}/smartadmin/js/app.bundle.js"></script>
	<script src="${pageContext.request.contextPath}/smartadmin/js/formplugins/select2/select2.bundle.js"></script>


	<script type="text/javascript">
	
		function openPopUp() {
	
			var pageurl = '${pageContext.request.contextPath}/assignpopup.jsp';
			$.when($.get(pageurl, function(data) {
				$('#modalContainer').html(data);
			})).done(function() {
				$('#default-example-modal-lg-center').modal({
					backdrop : 'static',
					keyboard : true
				});
			});
			return;
		}
	</script>

</body>
</html>
