<h1>Please enter your changes for the users below</h1>
<style>
td, table {
	border: 2px solid #1B8422;
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
.button {
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
</style>

<table>

<form action="/changes-made" method="post">
%for users in printUsers:
	<tr>
	<td><b>{{users}}</b></td> 
	<td style="font-size:80%"><input type="radio" name="{{users}}" value="deleteAll"/>
	Remove user and their files</td>
	<td style="font-size:80%"><input type="radio" name="{{users}}" value="save" checked="checked"/>
	No change</td>
	<td style="font-size:80%"><input type="radio" name="{{users}}" value="suspend"/>Suspend account</td>
	<td style="font-size:80%"><input type="radio" name="{{users}}" value="delete"/>Delete user (keep files)
	</tr>
%end
</table>
	<button class="button button1">
	Submit
	</button>
	<!-- <input style="width: 30%; height: 10%; font-size:150%;" type="submit" name="submit" value="submit">  -->
</form>
