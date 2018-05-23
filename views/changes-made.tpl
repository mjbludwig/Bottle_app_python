<style>
.container {
	text-align: center;
	margin: auto;
	padding: 20px;
}
.header {
        text-align: center;
        max-width: 500px;
        margin: auto;
        margin-top: 3%;
        color: #064A04;
        text-shadow: 2px 2px 8px #FFFFFF;
        padding: 10px;
        border: 3px solid #1B8422;
        background: rgba(190, 218, 189, .6);
        border-radius: 40px;
}
.button {
    box-shadow: 0 12px 16px 0 rgba(255,255,255,0.24),0 17px 50px 0 rgba(255,255,255,0.19);
    background-color: #4CAF50;
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    -webkit-transition-duration: 0.4s;
    transition-duration: 0.4s;
}

.button1:hover {
    box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
}

body {
	background-image: url({{backGround}});
	background-repeat: no-repeat;
	background-size: cover;
}
table {
        display: inline-block;
        border: 5px solid #073A05;
        border-collapse: collapse;

}
th {
	padding: 6px;
	font-size: 1.25em;
	border-collapse: collapse;
	text-align: center;
}
td {
	border-top: 2px solid #073A05;
        border-collapse: collapse;
        padding: 6px;
        text-align: center;
}
tr:nth-child(even) {
        background-color: #7EEF86;
}
tr:nth-child(odd) {
        background-color: #D3ECD2;
}

</style>
<body>
<div class="header">
	<h1>Review changes</h1>
</div>
<div class="container">
<table>
<th><b>Users to delete fully (including files)</b></th>
%if len(deleteAll) == 0:
<tr><td><b>No Users were selected</b></td></tr>
%else:
	%for users in deleteAll:
	<tr><td><b>{{users}}</b></td></tr>
	%end
%end
</table>
<table>
<th><b>Users to delete (keep files)</b></th>
%if len(delete) == 0:
<tr><td><b>No Users were selected</b></td></tr>
%else:
	%for users in delete:
	<tr><td><b>{{users}}</b></td></tr>
	%end
%end
</table>
<table>
<th><b>Users to suspend</b></th>
%if len(suspend) == 0:
<tr><td><b>No users were selected</b></td></tr>
%else:
	%for users in suspend:
	<tr><td><b>{{users}}</b></td></tr>
	%end
%end
</table>
<form action="/groups/changes/changes-made/submit" method="post">
<button class="button button1">
Submit
</button>
