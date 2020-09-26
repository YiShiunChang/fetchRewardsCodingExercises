<html lang="en">
	<head>
	<meta charset="utf-8"> <!-- specifies the character encoding for the HTML document -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> <!-- fits to whatever IE version and force IE uses Chrome frame if it is installed -->
	<meta name="viewport" content="width=device-width, initial-scale=1"> <!-- Bootstrap4 needs this to ensure proper rendering and touch zooming -->
	<!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<title>fetch rewards coding exercises</title>
	</head>
	
	<body>
	<div class="container-fluid">
		<table class="table table-bordered table-responsive">
			<thead>
			<tr> <!-- this row includes headers "Pyramid Word" and "Unique Email" for different coding exercises-->
				<th class="tableHeader" style="width:50%; padding: 4px"> 
					Pyramid Word
				</th>
				<th class="tableHeader" style="width:50%; padding: 4px"> 
					Unique Email
				</th>
			</tr>
			<tr id="tableTitles"> <!-- input row for users to provide a word for "Pyramid Word" or a list for "Unique Email" -->
				<th class="tableWidth" align="left" style="padding:3px">
					<input type="text" id="wordInput" placeholder="type a word here, and click button below to check whether it is a pyramid" style="width:100%" />
				</th>
				<th class="tableWidth" align="left" style="padding:3px">
					<input type="text" id="emailInput" placeholder="type a list of emails separated by comma, and click button below for # of unique emails" style="width:100%" />
				</th>
			</tr>
			</thead>
			<tbody id="tableLots"> <!-- when a user is ready, click a button to send request for one of the two exercises -->
				<tr>
				    <td style="width:50%; padding: 4px">
				    	<button class="form-inline" type="button" id="checkPyramid" style="font-size:12px; display:inline">Check Pyramid</button>
				    	<span id="wordOutput" style="padding: 5px"> wait user types a word </span>
				    </td>
				    <td style="width:50%; padding: 4px">
				    	<button class="form-inline" type="button" id="checkUnique" style="font-size:12px; display:inline">Check Unique</button>
				    	<span id="emailOutput" style="padding: 5px"> wait user types a list of emails </span>
				    </td> 
			  	</tr>
			  	<tr>
				    <td style="width:50%; padding: 4px">
				    	<h6>Additional assumption1: a word is case sensitive.</h6>
				    	<h6>Additional Assumption2: an empty word is not a pyramid.</h6>
				    </td>
				    <td style="width:50%; padding: 4px">
				    	<h6>Additional assumption1: there is no space in the String given by a user.</h6>
				    	<h6>Additional assumption2: every emails are separated by comma.</h6>
				    </td> 
			  	</tr>
			</tbody>
		</table>
	</div>
	
	</body>
	
	
	<script type="text/javascript">
	
	// while this web page is ready, it waits for users' interactions
	$(document).ready(function () {
		// update the answer to "Pyramid Word"
		$("#checkPyramid").click(function() {
			$.ajax({
				url:'/isPyramid',
				data:{'word':$("#wordInput").val()},
				type:'post',
				dataType: 'html', // returning datatype shall be html, otherwise, we wont execute success function
			    success: function(data) {
			    	document.getElementById("wordOutput").textContent = $("#wordInput").val() + data;
			    }
			});
		});
		// update the answer to "Unique Email"
		$("#checkUnique").click(function() {
			$.ajax({
				url:'/getUnique',
				data:{'emails':$("#emailInput").val()},
				type:'post',
				dataType: 'html', // returning datatype shall be html, otherwise, we wont execute success function
			    success: function(data) {
			    	document.getElementById("emailOutput").textContent = data;
			    }
			});
		});
	});
	
	</script>
</html>