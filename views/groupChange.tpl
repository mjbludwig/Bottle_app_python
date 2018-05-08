<h1>Please enter your changes for the users below</h1>
<style>
td {
	border: 1px solid #1B8422;
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

<table>

<form action="/changes-made" method="post">
%for users in printUsers:
	<tr>
	<td><b>{{users}}:</b></td> 
	<td><input type="radio" name="{{users}}" value="deleteAll"/>
	Remove user and their files</td>
	<td><input type="radio" name="{{users}}" value="save" checked="checked"/>
	No change</td>
	<td><input type="radio" name="{{users}}" value="suspend"/>Suspend account</td>
	<td><input type="radio" name="{{users}}" value="delete"/>Delete user (keep files)
	</tr>
%end
</table>
	<input style="width: 30%; height: 10%;" type="submit" name="submit" value="submit">
</form>
