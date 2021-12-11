<!-- BEGIN: main -->
<link href="/themes/softs/css/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css">
<link href="/themes/softs/css/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css">
<link type="text/css" href="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/jquery-ui/jquery-ui.min.css" rel="stylesheet" />

<div class="page-breadcrumb d-none d-md-flex align-items-center mb-3">
	<div class="breadcrumb-title pr-3">{LANG.serviceextra}</div>
	<div class="pl-3">
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb mb-0 p-0">
				<li class="breadcrumb-item">
					<a href="/"><i class='bx bx-home-alt'></i></a>
				</li>
				<li class="breadcrumb-item " aria-current="page">{LANG.serviceextra_add}</li>
			</ol>
		</nav>
	</div>
	<div class="ml-auto">
		<div class="btn-group">
			<a type="button" class="btn btn-success" href="{FLOOR_ADD}"><i class="lni lni-add-files mrg-r-5"></i>{LANG.add}</a>
		</div>
	</div>
</div>
<div class="card radius-15">
	<div class="card-body">
		<div class="card-title">
			<h4 class="mb-0">{LANG.serviceextra_add}</h4>
		</div>
		<hr>
		<!-- BEGIN: error -->
		<div class="alert alert-warning">{ERROR}</div>
		<!-- END: error -->
		<form class="form-horizontal" action="{NV_BASE_SITEURL}index.php?{NV_LANG_VARIABLE}={NV_LANG_DATA}&amp;{NV_NAME_VARIABLE}={MODULE_NAME}&amp;{NV_OP_VARIABLE}={OP}/add" method="post">
			<input type="hidden" name="id" value="{ROW.id}" />
			<div class="form-row">
				<div class="col-md-3 mb-3">
					<label>{LANG.sid} <span class="red">(*)</span></label>
					<select class="form-control" name="sid" id="serviceextraid">
						<option value="" class="hidden">--Chọn dịch vụ tạo phiếu --</option>
						<!-- BEGIN: select_sid -->
						<option value="{OPTION.key}" {OPTION.selected}>{OPTION.title}</option>
						<!-- END: select_sid -->
					</select>
				</div>
				<div class="col-md-3 mb-3">
					<label>{LANG.yearmonth} <span class="red">(*)</span></label>
					<div class="form-row" >
						<div class="col-md-6 mb-3">
							<select class="form-control" name="month" id="month">
								<option value=""> --- </option>
								<!-- BEGIN: select_month -->
								<option value="{OPTION.key}" {OPTION.selected}>{OPTION.title}</option>
								<!-- END: select_month -->
							</select>
						</div>
						<div class="col-md-6 mb-3">
							<select class="form-control" name="year" id="year">
								<option value=""> --- </option>
								<!-- BEGIN: select_year -->
								<option value="{OPTION.key}" {OPTION.selected}>{OPTION.title}</option>
								<!-- END: select_year -->
							</select>
						</div>
					</div>
				</div>
				<div class="col-md-3 mb-3">
					<label>
						&nbsp;
					</label>
					<p>
						<button type="button" class="btn btn-primary" onclick="import_data()">
							Nhập dữ liệu
						</button>
					</p>
				</div>
			</div>

			<div class="form-row" id="load_data">

			</div>








			<div class="form-row hidden">

				<div class="col-md-3 mb-3">
					<label>Sản Phẩm <span class="red">(*)</span></label>
					<select class="form-control" name="pid" id="productid">
						<option value="0">--{LANG.pid} --</option>
						<!-- BEGIN: select_pid -->
						<option value="{OPTION.key}" {OPTION.selected}>{OPTION.title}</option>
						<!-- END: select_pid -->
					</select>
				</div>
				<div class="col-md-3 mb-3">
					<label>Khách hàng <span class="red">(*)</span></label>
					<select class="form-control" name="cid" id ="customerid" >
						<option value="0">-- {LANG.serviceextra_customer} --</option>
						<!-- BEGIN: select_cid -->
						<option value="{OPTION.key}" {OPTION.selected}>{OPTION.title}</option>
						<!-- END: select_cid -->
					</select>
				</div>
				
			</div>	
			
			<div class="form-row hidden">
				<div class="col-md-3 mb-3">
					<label>{LANG.datefrom}<span class="red">(*)</span></label>
					<div class="input-group">
						<input class="form-control" type="text" name="datefrom" value="{ROW.datefrom}" id="datefrom" pattern="^[0-9]{2,2}\/[0-9]{2,2}\/[0-9]{1,4}$" required="required" oninvalid="setCustomValidity(nv_required)" oninput="setCustomValidity('')" />
						<div class="input-group-append">
							<button class="btn btn-primary" type="button"><i class="lni lni-calendar"></i></button>
						</div>
					</div>
				</div>
				<div class="col-md-3 mb-3">
					<label>{LANG.dateto} <span class="red">(*)</span></label>
					<div class="input-group">
						<input class="form-control" type="text" name="dateto" value="{ROW.dateto}" id="dateto" pattern="^[0-9]{2,2}\/[0-9]{2,2}\/[0-9]{1,4}$" required="required" oninvalid="setCustomValidity(nv_required)" oninput="setCustomValidity('')" />
						<div class="input-group-append">
							<button class="btn btn-primary" type="button"><i class="lni lni-calendar"></i></button>
						</div>
					</div>
				</div>
			</div>
			<div class="form-row hidden">
				<div class="col-md-3 mb-3">
					<div class="form-group">
						<label>{LANG.amount} <span class="red">(*)</span></label>
						<input class="mask form-control" type="text" name="amount" value="{ROW.amount}" id="amount" />
					</div>
					<div class="form-group">
						<label>{LANG.file}</label>
						<input class="form-control" type="text" name="fileupload" value="{ROW.file}"  id="fileupload"/>
						<input  type="file" name="file"  id="file"/>
						<button id="upload" class="btn btn-primary">{LANG.upload}</button>
					</div>
				</div>
				<div class="col-md-4 mb-3">
					<div class="form-group">
						<label>Đơn giá VND / Đơn vị tính</label>
						<input class="mask form-control" type="text" name="pricevnd" value="{ROW.pricevnd}" id="pricevnd" />
					</div>
					<div class="form-group">
						<label>Đơn giá USD / Đơn vị tính</label>
						<input class="mask form-control" type="text" name="priceusd" value="{ROW.priceusd}" id="priceusd"/>
					</div>
					
				</div>
				<div class="col-md-4 mb-3">
					<div class="form-group">
						<label>{LANG.totalvnd}</label>
						<input class="mask form-control" type="text" name="totalvnd" value="{ROW.totalvnd}" readonly id="totalvnd"/>
					</div>

					<div class="form-group">
						<label>{LANG.totalusd}</label>
						<input class="mask form-control" type="text" name="totalusd" value="{ROW.totalusd}" readonly id="totalusd"/>
					</div>
				</div>
			</div>
			
			<div class="form-group hidden">
				<label>{LANG.note}</label>
				{ROW.note}
			</div>
			<div class="text-center hidden">
				<button class="btn btn-primary" name="submit" type="submit"><i class="lni lni-save mrg-r-5"></i>{LANG.save}</button>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/language/jquery.ui.datepicker-{NV_LANG_INTERFACE}.js"></script>

<script>
	
	function import_data(){
		var serviceextraid = $('#serviceextraid').val();
		
		var month = $('#month').val();
		var year = $('#year').val();
		if(serviceextraid && month && year){
			$.ajax({
				type : 'POST',
				url: nv_base_siteurl + 'index.php?' + nv_name_variable + '=' + nv_module_name + '&' + 			nv_fc_variable + '={OP}&mod=import_data&serviceextraid=' + serviceextraid + '&month=' + month + '&year=' + year,
				contentType: false,
				processData: false,
				success : function(res){
					res2=JSON.parse(res);
					if(res2.status=="OK"){
						$('#load_data').html(res2.text);
					}else{
						alert('Lỗi');

					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}else{
			alert('Vui lòng chọn loại dịch vụ và kì thanh toán');
		}
		

	}
    //xử lý khi có sự kiện click
    $('#upload').on('click', function () {
        //Lấy ra files
        var file_data = $('#file').prop('files')[0];
        //lấy ra kiểu file
        var type = file_data.type;
        //Xét kiểu file được upload
        console.log(type);
		// file word
		var match = ["application/vnd.openxmlformats-officedocument.wordprocessingml.document"];
        //kiểm tra kiểu file
        //if (type == match[0] || type == match[1]) {
        	if (true) {
            //khởi tạo đối tượng form data
            var form_data = new FormData();
            //thêm files vào trong form data
            form_data.append('file', file_data);
            //sử dụng ajax post
            $.ajax({
                url: nv_base_siteurl + 'index.php?' + nv_name_variable + '={MODULE_NAME}&' + nv_fc_variable + '={OP}/uploadfile', // gửi đến file upload.php 
                dataType: 'json',
                cache: false,
                contentType: false,
                processData: false,
                data: form_data,
                type: 'post',
                success: function (a) {
                	if (a.status == "OKE") {
                		alert('{LANG.upload_finish}');
                		$('#fileupload').val(a.message);
                		$('#file').val('');
                	} else {
                		console.log('Error' + a.message);
                	}
                }
            });
        } else {
        	$('.status').text('Chỉ được upload file ảnh');
        	$('#file').val('');
        }
        return false;
    });
</script>
<script type="text/javascript">
//<![CDATA[
$("#datefrom,#dateto").datepicker({
	dateFormat : "dd/mm/yy",
	changeMonth : true,
	changeYear : true,
	showOtherMonths : true,
});
function change_serviceextra(){
	var serviceextra = $("#serviceextraid").val();
	$.ajax({
		type: 'POST',
		url: nv_base_siteurl + 'index.php?' + nv_lang_variable + '=' + nv_lang_data + '&' + nv_name_variable + '=lease&' + nv_fc_variable + '=ajax/ChangeServiceExtra',
		cache: !1,
		data: {
			nv_ajax: 1,
			serviceextra: serviceextra
		},
		dataType: "json"
	}).done(function(a) {
		var amount = $("#amount").val();
		if (a.status == "OKE") {
			var totalvnd = a.message.price_vnd*amount;
			var totalusd = a.message.price_usd*amount;
			$("#pricevnd").val(a.message.price_vnd);
			$("#totalvnd").val(totalvnd);
			$("#priceusd").val(a.message.price_usd);
			$("#totalusd").val(totalusd);
		} else {
			console.log('Error' + a.message);
		}
	});
}
function change_total(){

	var amount = $("#amount").val();
	var pricevnd = $("#pricevnd").val();
	var priceusd = $("#priceusd").val();
	var totalvnd = pricevnd*amount;
	var totalusd = priceusd*amount;
	$("#totalvnd").val(totalvnd);
	$("#totalusd").val(totalusd);
}
function change_product(){
	var productid = $("#productid").val();
	$.ajax({
		type: 'POST',
		url: nv_base_siteurl + 'index.php?' + nv_lang_variable + '=' + nv_lang_data + '&' + nv_name_variable + '=lease&' + nv_fc_variable + '=ajax/GetCustomerAll',
		cache: !1,
		data: {
			nv_ajax: 1,
			productid: productid
		},
		dataType: "json"
	}).done(function(a) {
		if (a.status == "OKE") {
			$("#customerid").html('');
			$.each(a.message,function(index, data){ 

				$("#customerid").append('<option value="' + data.cid + '"> ' + data.title + '</option>');
			});

			change_customer();
		} else {
			console.log('Error' + a.message);
		}
	});
}
function change_customer(){
	var customerid = $("#customerid").val();
	$.ajax({
		type: 'POST',
		url: nv_base_siteurl + 'index.php?' + nv_lang_variable + '=' + nv_lang_data + '&' + nv_name_variable + '=lease&' + nv_fc_variable + '=ajax/GetCustomer',
		cache: !1,
		data: {
			nv_ajax: 1,
			customerid: customerid
		},
		dataType: "json"
	}).done(function(a) {
		var html_vi='';
		var html_en='';
		if (a.status == "OKE") {
			check_services();
		} else {
			console.log('Error' + a.message);
		}
	});
}
$(document).ready(function(){
	$("#productid").on("change",function(){
		change_product();
	});
	$("#serviceextraid").on("change",function(){
		change_serviceextra();
	});
	$("#amount").on("change",function(){
		change_total();
	});
	$("#pricevnd").on("change",function(){
		change_total();
	});
	$("#priceusd").on("change",function(){
		change_total();
	});
	change_serviceextra();

});
$("input.mask").each((i,ele)=>{
	let clone=$(ele).clone(false)
	clone.attr("type","text")
	let ele1=$(ele)
	clone.val(Number(ele1.val()).toLocaleString("en"))
	$(ele).after(clone)
	$(ele).hide()
	clone.mouseenter(()=>{

		ele1.show()
		clone.hide()
	})
	setInterval(()=>{
		let newv=Number(ele1.val()).toLocaleString("en")
		if(clone.val()!=newv){
			clone.val(newv)
		}
	},10)

	$(ele).mouseleave(()=>{
		$(clone).show()
		$(ele1).hide()
	})


});
//]]>
</script>
<!-- END: main -->