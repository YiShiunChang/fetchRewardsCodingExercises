<html lang="en">
	<head>
	<meta charset="utf-8"> <!-- specifies the character encoding for the HTML document -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> <!-- fits to whatever IE version and force IE uses Chrome frame if it is installed -->
	<meta name="viewport" content="width=device-width, initial-scale=1"> <!-- Bootstrap4 needs this to ensure proper rendering and touch zooming -->
	<!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- FusionCharts -->
    <script type="text/javascript" src="/resources/js/fusioncharts.js"></script>
    <!-- Fusion Theme -->
    <script type="text/javascript" src="/resources/js/themes/fusioncharts.theme.fusion.js"></script>
    <!-- jQuery-FusionCharts -->
    <script type="text/javascript" src="/resources/js/jquery-fusioncharts.js"></script>
    <!-- jQuery -->
    <script type="text/javascript" src="/resources/js/jquery-fusioncharts.min.js"></script>
    <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	
	<title> Key Stage Report (KSR) </title> 
    <style>
      .form-inline {
      	position:relative;
      	top:8px;
      }
      .selectProcess {
      	width:60px;
      }
      .selectRoute {
      	width:100px;
      }
      .selectTime {
      	width:60px;
      }
      .columnFilter{
      	top:0px;
      	font-size:12px;
      }
      .tableHeader {
      	font-size:12px;
      }
      td {
      	font-size:12px;
      }
    </style>

	</head>
	<body>
	<div class="container-fluid">
		<div class="row">
		    <div class="col-sm-8" style="background-color:#92a8d1;">
		    	<form class="form-inline" id="dataSource1" style="float:left">
		            <label>Process</label>
		            <select class="selectProcess" id="selectProcess" name="selectProcess" style="font-size:12px">
				    	<option value="S18" selected>S18</option>
				    	<option value="B3">B3</option>
				    	<option value="B8">B8</option>	
		            </select>
	        	</form>
	        	<form class="form-inline" id="dataSource1" style="float:left">
	            	<label style="margin-left:10px">Route</label>
		            <select class="selectRoute" id="selectRoute" name="selectRoute" style="font-size:12px">
			            <option value="All" selected>All</option>
			            <option value="S18M4W">S18M4W</option>
			            <option value="S18B4W">S18B4W</option>
		            </select>
	        	</form>
	        	<form class="form-inline" id="dataSource1" style="float:left">
		        	<label style="margin-left:10px">Time Stamp</label>
		            <select class="selectTme" id="selectTime" name="selectTime" style="font-size:12px;  margin-right:20px">
						<option value="Current" selected>Current</option>
						<option value="Morning">Morning</option>
		            </select>
		        </form>
		        <button class="form-inline" type="button" id="selectProcessBtn" style="margin-left:20px; font-size:12px; display:inline">Refresh Chart</button>
		    </div>
		    <div class="col-sm-4" style="background-color:#92a8d1;">
		    	<h6 class="form-inline" style="float:right;"> 
	    			AMove: <span id="aMove" style="padding: 5px"> loading </span> Pace: <span id="pace" style="padding: 5px"> loading </span>
        		</h6>
		    </div>
		</div>
		<div class="row"> 
			<div id="chart-container" style="width:100%;"> FusionCharts will render here </div>
		</div>
		<div class="row"> 
			<div hidden id="chart-rawdata" style="width:100%"> FusionCharts raw data render here for debugging </div>
		</div>
		<!-- document.getElementById("chart-rawdata").innerHTML = "this line is used for updating chart-rawdata in js"; -->
		<div class="row" style="height:25px; background-color:#92a8d1;">
			<button type="button" id="resetTableBtn" style="margin-left:10px; font-size:12px; display:inline">Reset Table</button>
        	<button type="button" id="linkWIPTrackerBtn" style="margin-left:20px; font-size:12px; display:inline">Link WIP Tracker</button>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">
		<table class="table table-bordered table-responsive" style="width:100%;">
			<thead>
			<tr id="tableTitles"> <!-- input row for users to provide predicates for different columns and do the filtering -->
				<th class="tableWidth" align="left" style="width:10%; padding:3px">
					<input type="text" class="columnFilter" id="filter0" onkeypress="filterTable(event)" placeholder="ALL" style="width:100%" />
				</th>
				<th class="tableWidth" align="left" style="width:7%; padding:3px">
					<input type="text" class="columnFilter" id="filter1" onkeypress="filterTable(event)" placeholder="ALL" style="width:100%" />
				</th>
				<th class="tableWidth" align="left" style="width:8%; padding:3px">
					<input type="text" class="columnFilter" id="filter2" onkeypress="filterTable(event)" placeholder="ALL" style="width:100%" />
				</th>
				<th class="tableWidth" align="left" style="width:5%; padding:3px">
					<input type="text" class="columnFilter" id="filter3" onkeypress="filterTable(event)" placeholder="ALL" style="width:100%" />
				</th>
				<th class="tableWidth" align="left" style="width:5%; padding:3px">
					<input type="text" class="columnFilter" id="filter4" onkeypress="filterTable(event)" placeholder="ALL" style="width:100%" />
				</th>
				<th class="tableWidth" align="left" style="width:5%; padding:3px">
					<input type="text" class="columnFilter" id="filter5" onkeypress="filterTable(event)" placeholder="ALL" style="width:100%" />
				</th>
				<th class="tableWidth" align="left" style="width:6%; padding:3px">
					<input type="text" class="columnFilter" id="filter6" onkeypress="filterTable(event)" placeholder="ALL" style="width:100%" />
				</th>
				<th class="tableWidth" align="left" style="width:10%; padding:3px">
					<input type="text" class="columnFilter" id="filter7" onkeypress="filterTable(event)" placeholder="ALL" style="width:100%" />
				</th>
				<th class="tableWidth" align="left" style="width:22%; padding:3px">
					<input type="text" class="columnFilter" id="filter8" onkeypress="filterTable(event)" placeholder="ALL" style="width:100%" />
				</th>
				<th class="tableWidth" align="left" style="width:22%; padding:3px">
					<input type="text" class="columnFilter" id="filter9" onkeypress="filterTable(event)" placeholder="ALL" style="width:100%" />
				</th>
			</tr>
			<tr> <!-- this row includes headers and sorting buttons of all columns -->
				<th class="tableHeader" style="padding: 4px"> location
					<input type="image" src="/resources/sortIcon.png" id="sortLocationBtn" style="float:right" width="14" height="14">
				</th>
				<th class="tableHeader" style="padding: 4px"> lotId
					<input type="image" src="/resources/sortIcon.png" id="sortLotIdBtn" style="float:right" width="14" height="14">
				</th>
				<th class="tableHeader" style="padding: 4px"> cassetteId
					<input type="image" src="/resources/sortIcon.png" id="sortCassetteIdBtn" style="float:right" width="14" height="14">
				</th>
				<th class="tableHeader" style="padding: 4px"> state
					<input type="image" src="/resources/sortIcon.png" id="sortStateBtn" style="float:right" width="14" height="14">	
				</th>
				<th class="tableHeader" style="padding: 4px"> qtime
					<input type="image" src="/resources/sortIcon.png" id="sortQtimeBtn" style="float:right" width="14" height="14">
				</th>
				<th class="tableHeader" style="padding: 4px"> qty
					<input type="image" src="/resources/sortIcon.png" id="sortQtyBtn" style="float:right" width="14" height="14">
				</th>
				<th class="tableHeader" style="padding: 4px"> process
					<input type="image" src="/resources/sortIcon.png" id="sortProcessBtn" style="float:right" width="14" height="14">
				</th>
				<th class="tableHeader" style="padding: 4px"> route
					<input type="image" src="/resources/sortIcon.png" id="sortRouteBtn" style="float:right" width="14" height="14">
				</th>
				<th class="tableHeader" style="padding: 4px"> callProc
					<input type="image" src="/resources/sortIcon.png" id="sortCallProcBtn" style="float:right" width="14" height="14">
				</th>
				<th class="tableHeader" style="padding: 4px"> callProcTitle
					<input type="image" src="/resources/sortIcon.png" id="sortCallProcTitleBtn" style="float:right" width="14" height="14">
				</th>
			</tr>
			</thead>
			<tbody id="tableLots">
			</tbody>
		</table>
		</div>
	</div>
	</body> 
	
	<script type="text/javascript">
	// this var is used for interactive dropdown list, new process and corresponding routes are added here
	var processes_to_routes = {
    		"S18":{"S18M4W":"S18M4W", "S18B4W":"S18B4W"}, 
    		"B3":{"B3EIWK":"B3EIWK", "B3EIMWK":"B3EIMWK"},
    		"B8":{"B8EIFW":"B8EIFW", "B8EIFWP":"B8EIFWP"}};
    // this method first updates chart, and the updates table 
    function updateChartTable() {
    	$.ajax({
			url:'/ksrchart',
			data:{'process':$("#selectProcess :selected").text(), 'route':$("#selectRoute :selected").text(), 'time':$("#selectTime :selected").text()},
			type:'post',
			dataType: 'html', // returning datatype shall be html, otherwise, we wont execute success function
		    success: function(data) {
		    	// un-comment next line to see raw data after removing hidden flag in chart-rawdata
		    	// document.getElementById("chart-rawdata").innerHTML = data;
		    	createNewFusionChart("#chart-container", data.substring(0, data.indexOf("Moves")), "100%", "500");
				getMoves(data.substring(data.indexOf("Moves")));
				updateTable();
		    }
		});
    }
 	// this method creates a chart at chartlocation 
    function createNewFusionChart(chartlocation, chartdata, width, height) {
		// Create a JSON object to store the chart configurations
    	const chartConfigs = {
			type: "stackedcolumn2dline", // scrollstackedcolumn2d scrollcombi2d stackedcolumn2dline scrollmsstackedcolumn2dlinedy
		  	width: width,				 // this can be px of percentage
		  	height: height, 			 // this can be px of percentage
		  	dataFormat: "json",
		  	dataSource: chartdata,       // JSON format String
		  	events: {
		  		// when a bar of the chart is clicked, we can have basic infomation (eventObj, dataObj) of the bar, we need the 
		  		// label (step) of the bar to update our table, since lots shown on the table are constrained by process, route
		  		// and step if they are specified by drop down list and clicking bar
		  		dataPlotClick: function(eventObj, dataObj) {
			      	autofilter(dataObj['categoryLabel']);
	  			}
			}
  		};
    	// our chart renders at chartlocation
  		$(chartlocation).insertFusionCharts(chartConfigs);
	}
    // this method separates the moves into actual move and pcae, which is forecasting move
    function getMoves(moves) {
    	var move = moves.split(" ");
		document.getElementById("aMove").textContent = move[1];
	    document.getElementById("pace").textContent = move[2];
    }
    // this method updates the table for corresponding process, route and step
    function updateTable() {
    	cleanfilter();
    	$.ajax({
			url:'/ksrtable',
			data:{'process':$("#selectProcess :selected").text(), 'route':$("#selectRoute :selected").text(), 'time':$("#selectTime :selected").text()},
			type:'post',
			dataType: 'json', // returning datatype shall be json, otherwise, we wont execute success function
		    success: function(data){
		    	target = $('#tableLots');
		      	$(target).empty(); // clear current content in tableLots
				$.each(data, function() { // go through each lot and create a row for it
					$(target).append(
						$('<tr>').append(
							$('<td style="padding: 4px">').text(this['location']),
							$('<td style="padding: 4px">').text(this['lotId']),
							$('<td style="padding: 4px">').text(this['cassetteId']),
							$('<td style="padding: 4px">').text(this['state']),
							$('<td style="padding: 4px">').text(this['qtime']),
							$('<td style="padding: 4px">').text(this['qty']),
							$('<td style="padding: 4px">').text(this['process']),
							$('<td style="padding: 4px">').text(this['route']),
							$('<td style="padding: 4px">').text(this['callProc']),
							$('<td style="padding: 4px">').text(this['callProcTitle']))
					);
    		  	});
		    }
		});
    }
    // this function is used when users want to reset table or updateTable() is invoked 
    function cleanfilter() {
    	filter0.value = "";
    	filter1.value = "";
    	filter2.value = "";
    	filter3.value = "";
    	filter4.value = "";
    	filter5.value = "";
    	filter6.value = "";
    	filter7.value = "";
    	filter8.value = "";
    	filter9.value = "";
    }
    // this method will triggger #filter9 for filtering callProcTitle
    function autofilter(clickedStep) {
    	filter9.value = clickedStep;
    	var event = $.Event('keypress'); // a keypress event
        event.which = 13; // key 'enter'
        $('#filter9').trigger(event);
    }
    // this method updates tables based on the predicates in columnFilter and it is invoked by 
    // onkeypress event. Predicates are case sensitive and separated only be comma
    function filterTable(event) {
    	// if inputKey is not enter then don't filter
	   	var inputKey = event.which || event.keyCode;
	   	if (inputKey != 13) {
	   		return;
	   	}
	   	// store predicates in set for better time complexity
	   	var locations = new Set(document.getElementById("filter0").value.split(","));
	   	locations.delete("");
	   	var lotIds = new Set(document.getElementById("filter1").value.split(","));
	   	lotIds.delete("");
	   	var cassetteIds = new Set(document.getElementById("filter2").value.split(","));
	   	cassetteIds.delete("");
	   	var states = new Set(document.getElementById("filter3").value.split(","));
	   	states.delete("");
	   	var qtimes = new Set(document.getElementById("filter4").value.split(","));
	   	qtimes.delete("");
	   	var qtys = new Set(document.getElementById("filter5").value.split(","));
	   	qtys.delete("");
	   	var processes = new Set(document.getElementById("filter6").value.split(","));
	   	processes.delete("");
	   	var routes = new Set(document.getElementById("filter7").value.split(","));
	   	routes.delete("");
	   	var callProcs = new Set(document.getElementById("filter8").value.split(","));
	   	callProcs.delete("");
	   	var callProcTitles = new Set(document.getElementById("filter9").value.split(","));
	    callProcTitles.delete("");
	   	// check whether a row (lot) of the table can be shown or not 
	   	var trs = document.getElementById("tableLots").getElementsByTagName("tr");
	   	for (var i = 0; i < trs.length; i++) {
			var tds = trs[i].getElementsByTagName("td");
			if ((locations.size == 0 || locations.has(tds[0].innerText)) &&     // locations is empty or contains the location of the row
				(lotIds.size == 0 || lotIds.has(tds[1].innerText)) &&           // lotIds is empty or contains the lodId of the row 
				(cassetteIds.size == 0 || cassetteIds.has(tds[2].innerText)) && // cassetteIds is empty or contains the cassetteId of the row 
				(states.size == 0 || states.has(tds[3].innerText)) &&           // same logic below
				(qtimes.size == 0 || qtimes.has(tds[4].innerText)) &&
				(qtys.size == 0 || qtys.has(tds[5].innerText)) &&
				(processes.size == 0 || processes.has(tds[6].innerText)) &&
				(routes.size == 0 || routes.has(tds[7].innerText)) &&
				(callProcs.size == 0 || callProcs.has(tds[8].innerText)) &&
				(callProcTitles.size == 0 || callProcTitles.has(tds[9].innerText))) {
				trs[i].style.display = ""; // show the row
			} else {
				trs[i].style.display = "none"; // hide the row
			}
		}
    }
 	// when document is ready, this function is invoked by "sort*Btn" to sort the table. Index is 
 	// corresponding to column, from location, lotId, ... to callProcTitle. Ascending is a bool
 	// which corresponding to true = ascending and false = descending
    function sortTable(index, ascending) {
    	var rows = document.getElementById("tableLots").rows; 
    	var map = new Map();              // key = HTML of a row, value = location, lotId, ... or callProcTitle. We sort by value.
    	var arr = new Array(rows.length); // this array is used for deepcopy, and we sort on this array
    	for (var i = 0; i < rows.length; i++) {
    		var newRow = deepCopy(rows[i]);
    		// only values of qtime and qty are Float
    		var value = index == 4 || index == 5? parseFloat(rows[i].getElementsByTagName("td")[index].innerText):rows[i].getElementsByTagName("td")[index].innerText;
    		map.set(newRow, value);
    		arr[i] = newRow;
    	}
    	// we are going to do mergesort so we can preserve the order of previous sorting result
    	if (ascending) {
    		mergesortAscend(arr, new Array(rows.length), map, 0, arr.length - 1);
    	} else {
    		mergesortDescend(arr, new Array(rows.length), map, 0, arr.length - 1);
    	}
    	// build a new table after mergesort
    	var target = document.getElementById("tableLots");
    	target.innerHTML = "";
      	for (var i = 0; i < arr.length; i++) {
      		target.appendChild(arr[i]);
      	}
   	}
    // do the deepcopy, otherwise, sorting will fail
 	function deepCopy(tr) {
 		var tds = tr.getElementsByTagName("td");
 		var trNew = document.createElement('tr');
 		for (var i = 0; i < 10; i++) {
 			trNew.insertCell(-1).outerHTML = tds[i].outerHTML;
 		}
 		trNew.style.display = tr.style.display;
 		return trNew;
 	}
 	// this is just a mergesort
 	function mergesortAscend(array, temp, map, start, end) {
 		if (start >= end) {
 			return;
 		}
 		
 		var mid = start + Math.floor((end - start) / 2);
 		mergesortAscend(array, temp, map, start, mid);
 		mergesortAscend(array, temp, map, mid + 1, end);
 		var left = start;
 		var right = mid + 1;
 		var index = start;
 		while (left <= mid && right <= end) {
 			if (map.get(array[left]) <= map.get(array[right])) {
 				temp[index++] = array[left++];
 			} else {
 				temp[index++] = array[right++];
 			}
 		}
 		
 		while (left <= mid) {
 			temp[index++] = array[left++];
 		}
 		while (right <= end) {
 			temp[index++] = array[right++];
 		}
 		
 		for (index = start; index <= end; index++) {
 			array[index] = temp[index];
 		}
 	}
 	// this is just a mergesort
 	function mergesortDescend(array, temp, map, start, end) {
 		if (start >= end) {
 			return;
 		}
 		
 		var mid = start + Math.floor((end - start) / 2);
 		mergesortDescend(array, temp, map, start, mid);
 		mergesortDescend(array, temp, map, mid + 1, end);
 		var left = start;
 		var right = mid + 1;
 		var index = start;
 		while (left <= mid && right <= end) {
 			if (map.get(array[left]) >= map.get(array[right])) {
 				temp[index++] = array[left++];
 			} else {
 				temp[index++] = array[right++];
 			}
 		}
 		
 		while (left <= mid) {
 			temp[index++] = array[left++];
 		}
 		while (right <= end) {
 			temp[index++] = array[right++];
 		}
 		
 		for (index = start; index <= end; index++) {
 			array[index] = temp[index];
 		}
 	}
    // while this web page is ready, it executes function below and waits for users' interaction
	$(document).ready(function () {
		// update the first chart and table once our report page is ready, the update is mandatory
		updateChartTable("All")
		// update the chart and table as long as the selectProcessBtn is clicked, 
		// parameters could be process: B8 and route: B8EIFWP
		$("#selectProcessBtn").click(function() {
			updateChartTable("All")
		});
		// when resetTable is involked, we clean all the values in filters and trigger any filter 
		// to update the table based on chosen process/route/timestamp
		$("#resetTableBtn").click(function() {
			cleanfilter();
	    	var event = $.Event('keypress'); // a keypress event
	        event.which = 13; // key 'enter'
	        $('#filter0').trigger(event);
		});
		// when WIPTracker is involked, we call WIPTracker report and attached all the lotIds that 
		// are shown in the table to the URL for parameter lotIds
		$("#linkWIPTrackerBtn").click(function() {
			var link = "https://helios.maxim-ic.com/OperationalReporting/wipSnapshot/mfnWip?lotIds=";
			var trs = document.getElementById("tableLots").getElementsByTagName("tr");
		   	
			for (var i = 0; i < trs.length; i++) {
				if (trs[i].style.display == "") {
					link += trs[i].getElementsByTagName("td")[1].innerText;
					link += ",";
				}
			}
			window.open(link);
		});
		// dynamically update selectRoute if selectProcees is changed
		// this is for dropdown list on the top left corner
		$('#selectProcess').on('change', function(e) {
			var source = $(this), val = $.trim(source.val()), target = $('#selectRoute');
	      	$(target).empty(); // clear current content in selectRoute
        	var options = processes_to_routes[val];
       		$('<option value="All" selected>All</option>').appendTo(target);
            $.each(options, function(key, value) {
            	$('<option value="' + key + '">' + value + '</option>').appendTo(target);
            });
	    });
		// below is a series of sort*Btn for sorting the table
		// the first sorting is ascneding, then descending, then ascending in a cycle
		var locationAscend = true;
		$('#sortLocationBtn').click(function() {
			sortTable(0, locationAscend);
			locationAscend = !locationAscend;
		});
		
		var lotIdAscend = true;
		$('#sortLotIdBtn').click(function() {
			sortTable(1, lotIdAscend);
			lotIdAscend = !lotIdAscend;
		});
		
		var cassetteIdAscend = true;
		$('#sortCassetteIdBtn').click(function() {
			sortTable(2, cassetteIdAscend);
			cassetteIdAscend = !cassetteIdAscend;
		});
		
		var stateAscend = true;
		$('#sortStateBtn').click(function() {
			sortTable(3, stateAscend);
			stateAscend = !stateAscend;
		});
		
		var qtimeAscend = true;
		$('#sortQtimeBtn').click(function() {
			sortTable(4, qtimeAscend);
			qtimeAscend = !qtimeAscend;
		});
		
		var qtyAscend = true;
		$('#sortQtyBtn').click(function() {
			sortTable(5, qtyAscend);
			qtyAscend = !qtyAscend;
		});
		
		var processAscend = true;
		$('#sortProcessBtn').click(function() {
			sortTable(6, processAscend);
			processAscend = !processAscend;
		});
		
		var routeAscend = true;
		$('#sortRouteBtn').click(function() {
			sortTable(7, routeAscend);
			routeAscend = !routeAscend;
		});
		
		var callProcAscend = true;
		$('#sortCallProcBtn').click(function() {
			sortTable(8, callProcAscend);
			callProcAscend = !callProcAscend;
		});
		
		var callProcTitleAscend = true;
		$('#sortCallProcTitleBtn').click(function() {
			sortTable(9, callProcTitleAscend);
			callProcTitleAscend = !callProcTitleAscend;
		});   
	});
	</script>
</html>

    

