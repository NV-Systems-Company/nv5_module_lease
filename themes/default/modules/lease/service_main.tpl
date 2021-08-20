<!-- BEGIN: main -->


<link href="/themes/softs/css/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css">
<link href="/themes/softs/css/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css">


<div class="well" style="display:none">
<form action="{NV_BASE_SITEURL}index.php" method="get">
    <input type="hidden" name="{NV_LANG_VARIABLE}"  value="{NV_LANG_DATA}" />
    <input type="hidden" name="{NV_NAME_VARIABLE}"  value="{MODULE_NAME}" />
    <input type="hidden" name="{NV_OP_VARIABLE}"  value="{OP}" />
    <div class="row">
        <div class="col-xs-24 col-md-6">
            <div class="form-group">
                <input class="form-control" type="text" value="{Q}" name="q" maxlength="255" placeholder="{LANG.search_title}" />
            </div>
        </div>
        <div class="col-xs-12 col-md-3">
            <div class="form-group">
                <input class="btn btn-primary" type="submit" value="{LANG.search_submit}" />
            </div>
        </div>
    </div>
</form>
</div>

<div class="page-breadcrumb d-none d-md-flex align-items-center mb-3">
	<div class="breadcrumb-title pr-3">Dịch vụ</div>
	<div class="pl-3">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb mb-0 p-0">
					<li class="breadcrumb-item">
						<a href="/"><i class='bx bx-home-alt'></i></a>
					</li>
					<li class="breadcrumb-item active" aria-current="page">Danh sách Dịch vụ</li>
				</ol>
			</nav>
		</div>
	<div class="ml-auto">
			<div class="btn-group">
				<a type="button" class="btn btn-primary" href="{service_add}">{LANG.add}</a>
			</div>
		</div>
</div>

<!-- BEGIN: view -->
<form action="{NV_BASE_SITEURL}index.php?{NV_LANG_VARIABLE}={NV_LANG_DATA}&amp;{NV_NAME_VARIABLE}={MODULE_NAME}&amp;{NV_OP_VARIABLE}={OP}" method="post">
	<div class="card">
		<div class="card-body">
			<div class="card-title">
				<h4 class="mb-0">Danh sách Dịch Vụ</h4>
			</div>
			<hr/>	
			<div class="table-responsive">
				<table id="example" class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th class="w100">{LANG.number}</th>
							<th>{LANG.title_service}</th>
							<th>{LANG.catid}</th>
							<th>{LANG.unitid}</th>
							<th>{LANG.price_usd}</th>
							<th>{LANG.price_vnd}</th>
							<th class="w100 text-center">{LANG.rent_status1}</th>
							<th class="w150">{LANG.active}</th>
						</tr>
					</thead>
					<!-- BEGIN: generate_page -->
					<tfoot>
						<tr>
							<td class="text-center" colspan="8">{NV_GENERATE_PAGE}</td>
						</tr>
					</tfoot>
					<!-- END: generate_page -->
					<tbody>
						<!-- BEGIN: loop -->
						<tr>
							<td>
								<select class="form-control" id="id_weight_{VIEW.sid}" onchange="nv_change_weight('{VIEW.sid}');">
								<!-- BEGIN: update_time_loop -->
									<option value="{WEIGHT.key}"{WEIGHT.selected}>{WEIGHT.title}</option>
								<!-- END: update_time_loop -->
								</select>
							</td>
							<td> {VIEW.title} </td>
							<td> {VIEW.catid} </td>
							<td> {VIEW.unitid} </td>
							<td> {VIEW.price_usd} </td>
							<td> {VIEW.price_vnd} </td>
							<td class="text-center"><input type="checkbox" name="active" id="change_status_{VIEW.sid}" value="{VIEW.sid}" {CHECK} onclick="nv_change_status({VIEW.sid});" /></td>
							<td class="text-center"><i class="fa fa-edit fa-lg">&nbsp;</i> <a href="{VIEW.link_edit}#edit">{LANG.edit}</a> - <em class="fa fa-trash-o fa-lg">&nbsp;</em> <a href="{VIEW.link_delete}" onclick="return confirm(nv_is_del_confirm[0]);">{LANG.delete}</a></td>
						</tr>
						<!-- END: loop -->
					</tbody>
					<tfoot>
						<tr>
							<th class="w100">{LANG.number}</th>
							<th>{LANG.title_service}</th>
							<th>{LANG.catid}</th>
							<th>{LANG.unitid}</th>
							<th>{LANG.price_usd}</th>
							<th>{LANG.price_vnd}</th>
							<th class="w100 text-center">{LANG.rent_status1}</th>
							<th class="w150">{LANG.active}</th>
						</tr>
					</tfoot>
        </table>
    </div>
</form>
<!-- END: view -->


<script type="text/javascript">
//<![CDATA[
    function nv_change_weight(id) {
        var nv_timer = nv_settimeout_disable('id_weight_' + id, 5000);
        var new_vid = $('#id_weight_' + id).val();
        $.post(script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=service&nocache=' + new Date().getTime(), 'ajax_action=1&sid=' + id + '&new_vid=' + new_vid, function(res) {
            var r_split = res.split('_');
            if (r_split[0] != 'OK') {
                alert(nv_is_change_act_confirm[2]);
            }
            window.location.href = script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=service';
            return;
        });
        return;
    }


    function nv_change_status(id) {
        var new_status = $('#change_status_' + id).is(':checked') ? true : false;
        if (confirm(nv_is_change_act_confirm[0])) {
            var nv_timer = nv_settimeout_disable('change_status_' + id, 5000);
            $.post(script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=service&nocache=' + new Date().getTime(), 'change_status=1&sid='+id, function(res) {
                var r_split = res.split('_');
                if (r_split[0] != 'OK') {
                    alert(nv_is_change_act_confirm[2]);
                }
            });
        }
        else{
            $('#change_status_' + id).prop('checked', new_status ? false : true);
        }
        return;
    }


//]]>
</script>

<script src="/themes/softs/js/jquery.dataTables.min.js"></script>
	<script>
		$(document).ready(function () {
			//Default data table
			$('#example').DataTable();
		});
	</script>
	
<!-- END: main -->